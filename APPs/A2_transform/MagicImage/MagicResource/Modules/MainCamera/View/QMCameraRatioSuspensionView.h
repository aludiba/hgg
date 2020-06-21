#import "QMSuspensionView.h"
#import "Constants.h"
@interface QMCameraRatioSuspensionView : QMSuspensionView
@property (nonatomic, copy) void (^ratioCallBack)(QMSuspensionModel *item);
+ (instancetype)ratioSuspensionView;
@end
