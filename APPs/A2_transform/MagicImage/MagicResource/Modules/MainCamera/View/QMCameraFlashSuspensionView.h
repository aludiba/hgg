#import "QMSuspensionView.h"
#import "Constants.h"
#import <AVFoundation/AVFoundation.h>
@interface QMCameraFlashSuspensionView : QMSuspensionView
@property (nonatomic, copy) void (^flashCallBack)(AVCaptureFlashMode flash, AVCaptureTorchMode torch, NSString *icon);
+ (instancetype)flashSuspensionView;
@end
