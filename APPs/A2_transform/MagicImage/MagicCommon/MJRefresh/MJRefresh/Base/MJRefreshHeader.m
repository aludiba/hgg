#import "MJRefreshHeader.h"
@interface MJRefreshHeader()
@property (assign, nonatomic) CGFloat insetTDelta;
@end
@implementation MJRefreshHeader
#pragma mark - 构造方法
+ (instancetype)headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock
{
    MJRefreshHeader *cmp = [[self alloc] init];
    cmp.refreshingBlock = refreshingBlock;
    return cmp;
}
+ (instancetype)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action
{
    MJRefreshHeader *cmp = [[self alloc] init];
    [cmp setRefreshingTarget:target refreshingAction:action];
    return cmp;
}
#pragma mark - 覆盖父类的方法
- (void)prepare
{
    [super prepare];
    self.lastUpdatedTimeKey = MJRefreshHeaderLastUpdatedTimeKey;
    self.mj_h = MJRefreshHeaderHeight;
}
- (void)placeSubviews
{
    [super placeSubviews];
    self.mj_y = - self.mj_h - self.ignoredScrollViewContentInsetTop;
}
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    if (self.state == MJRefreshStateRefreshing) {
        if (self.window == nil) return;
        CGFloat insetT = - self.scrollView.mj_offsetY > _scrollViewOriginalInset.top ? - self.scrollView.mj_offsetY : _scrollViewOriginalInset.top;
        insetT = insetT > self.mj_h + _scrollViewOriginalInset.top ? self.mj_h + _scrollViewOriginalInset.top : insetT;
        self.scrollView.mj_insetT = insetT;
        self.insetTDelta = _scrollViewOriginalInset.top - insetT;
        return;
    }
     _scrollViewOriginalInset = self.scrollView.mj_inset;
    CGFloat offsetY = self.scrollView.mj_offsetY;
    CGFloat happenOffsetY = - self.scrollViewOriginalInset.top;
    if (offsetY > happenOffsetY) return;
    CGFloat normal2pullingOffsetY = happenOffsetY - self.mj_h;
    CGFloat pullingPercent = (happenOffsetY - offsetY) / self.mj_h;
    if (self.scrollView.isDragging) { 
        self.pullingPercent = pullingPercent;
        if (self.state == MJRefreshStateIdle && offsetY < normal2pullingOffsetY) {
            self.state = MJRefreshStatePulling;
        } else if (self.state == MJRefreshStatePulling && offsetY >= normal2pullingOffsetY) {
            self.state = MJRefreshStateIdle;
        }
    } else if (self.state == MJRefreshStatePulling) {
        [self beginRefreshing];
    } else if (pullingPercent < 1) {
        self.pullingPercent = pullingPercent;
    }
}
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    if (state == MJRefreshStateIdle) {
        if (oldState != MJRefreshStateRefreshing) return;
        [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:self.lastUpdatedTimeKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [UIView animateWithDuration:MJRefreshSlowAnimationDuration animations:^{
            self.scrollView.mj_insetT += self.insetTDelta;
            if (self.isAutomaticallyChangeAlpha) self.alpha = 0.0;
        } completion:^(BOOL finished) {
            self.pullingPercent = 0.0;
            if (self.endRefreshingCompletionBlock) {
                self.endRefreshingCompletionBlock();
            }
        }];
    } else if (state == MJRefreshStateRefreshing) {
         dispatch_async(dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:MJRefreshFastAnimationDuration animations:^{
                CGFloat top = self.scrollViewOriginalInset.top + self.mj_h;
                self.scrollView.mj_insetT = top;
                CGPoint offset = self.scrollView.contentOffset;
                offset.y = -top;
                [self.scrollView setContentOffset:offset animated:NO];
            } completion:^(BOOL finished) {
                [self executeRefreshingCallback];
            }];
         });
    }
}
#pragma mark - 公共方法
- (NSDate *)lastUpdatedTime
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:self.lastUpdatedTimeKey];
}
@end
