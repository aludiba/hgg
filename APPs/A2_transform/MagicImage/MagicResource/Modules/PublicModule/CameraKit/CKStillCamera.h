#import <GPUImage/GPUImage.h>
@interface CKStillCamera : GPUImageStillCamera
@property(nullable, nonatomic, copy) void(^ISOChangeBlock)(float ISO);
@property(nullable, nonatomic, copy) void(^ISOAdjustingBlock)(BOOL adjust);
@property(nullable, nonatomic, copy) void(^FocusAdjustingBlock)(BOOL adjust);
- (BOOL)isFocusPointOfInterestSupported;
- (void)focusAtPoint:(CGPoint)point;
- (void)setFocusModel:(AVCaptureFocusMode)focusModel;
- (BOOL)isAutoFocusRangeRestrictionSupported;
- (void)setAutoFocusRangeRestrictionModel:(AVCaptureAutoFocusRangeRestriction)autoFocusModel;
- (BOOL)isSmoothAutoFocusSupported;
- (void)enableSmoothAutoFocus:(BOOL)enable;
- (BOOL)isExposurePointOfInterestSupported;
- (void)setExposeModel:(AVCaptureExposureMode)exposeModel;
- (void)exposeAtPoint:(CGPoint)point;
- (float)exposureTargetOffset;
- (CGFloat)currentISOPercentage;
- (void)setExposureModeCustomWithDuration:(CMTime)duration ISO:(float)ISO completionHandler:(nullable void (^)(CMTime syncTime))handler;
- (AVCaptureFlashMode)currentFlashModel;
- (void)setFlashModel:(AVCaptureFlashMode)flashModel;
- (AVCaptureWhiteBalanceMode)currentWhiteBalanceMode;
- (void)setWhiteBalanceMode:(AVCaptureWhiteBalanceMode)whiteBalanceMode;
- (AVCaptureTorchMode)currentTorchModel;
- (void)setTorchModel:(AVCaptureTorchMode)torchModel;
- (void)setTorchLevel:(float)torchLevel;
- (BOOL)videoCanZoom;
- (float)videoZoomFactor;
- (float)videoMaxZoomFactor;
- (void)setVideoZoomFactor:(float)factor;
- (void)rampZoomToFactor:(float)factor;
@end
