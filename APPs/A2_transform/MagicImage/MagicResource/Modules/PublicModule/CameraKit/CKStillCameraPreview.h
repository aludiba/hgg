#import <GPUImage/GPUImage.h>
#import <ReactiveObjC.h>
@interface CKStillCameraPreview : GPUImageView
@property (nonatomic, strong, readonly) RACSignal *pinchGestureSignal;
@property (nonatomic, strong, readonly) RACSignal *tapGestureSignal;
@property (nonatomic, strong, readonly) RACSignal *swipeRightGestureSignal;
@property (nonatomic, strong, readonly) RACSignal *swipeLeftGestureSignal;
@end
