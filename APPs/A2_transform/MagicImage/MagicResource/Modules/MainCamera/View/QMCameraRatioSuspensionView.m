#import "QMCameraRatioSuspensionView.h"
#define kCameraRatioSuspensionViewHeight   80
#define kCameraRatioSuspensionViewMargin   11
NSString * const RationConfigJson = @"[{\"name\":\"1:1\",\"icon\":\"qmkit_ratio_11_white\",\"value\":1,\"type\":2},{\"name\":\"3:4\",\"icon\":\"qmkit_ratio_34_white\",\"value\":1.33,\"type\":4},{\"name\":\"4:3\",\"icon\":\"qmkit_ratio_43_white\",\"value\":0.75,\"type\":4},{\"name\":\"9:16\",\"value\":1.78,\"icon\":\"qmkit_ratio_916_white\",\"type\":7},{\"name\":\"5:4\",\"icon\":\"qmkit_ratio_54_white\",\"value\":0.8,\"type\":5}]";
@implementation QMCameraRatioSuspensionView
+ (instancetype)ratioSuspensionView
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGRect rect = CGRectMake(kCameraRatioSuspensionViewMargin, 0, size.width - 2*kCameraRatioSuspensionViewMargin, kCameraRatioSuspensionViewHeight);
    QMCameraRatioSuspensionView *view = [[QMCameraRatioSuspensionView alloc] initWithFrame:rect];
    view.suspensionModels = [QMSuspensionModel buildSuspensionModelsWithJson:RationConfigJson];
    view.hidden = YES;
    __weak typeof(view) wview = view;
    [view setSuspensionItemClickBlock:^(QMSuspensionModel *item) {
        __weak typeof(view) sview = wview;
        [sview hide];
        if (sview.ratioCallBack) {
            sview.ratioCallBack(item);
        }
    }];
    return view;
}
@end
