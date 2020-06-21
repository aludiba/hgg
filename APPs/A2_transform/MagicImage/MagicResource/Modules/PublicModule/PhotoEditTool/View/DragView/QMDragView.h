#import <UIKit/UIKit.h>
@interface QMDragView : UIView
@property (nonatomic, strong, readonly) UIImageView *imageView;
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image;
- (instancetype)copyWithScaleFactor:(CGFloat)factor relativedView:(UIView *)imageView;
- (void)hideToolBar;
- (void)showToolBar;
- (BOOL)isToolBarHidden;
@end
