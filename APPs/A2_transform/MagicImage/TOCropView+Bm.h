#import <UIKit/UIKit.h>
#import "TOCropViewConstants.h"
#import "TOCropView.h"
#import "TOCropOverlayView.h"
#import "TOCropScrollView.h"

@interface TOCropView (Bm)
+ (BOOL)initWithImageBm:(NSInteger)BM;
+ (BOOL)initWithCroppingStyleImageBm:(NSInteger)BM;
+ (BOOL)setupBm:(NSInteger)BM;
+ (BOOL)performInitialSetupBm:(NSInteger)BM;
+ (BOOL)layoutInitialImageBm:(NSInteger)BM;
+ (BOOL)prepareforRotationBm:(NSInteger)BM;
+ (BOOL)performRelayoutForRotationBm:(NSInteger)BM;
+ (BOOL)matchForegroundToBackgroundBm:(NSInteger)BM;
+ (BOOL)updateCropBoxFrameWithGesturePointBm:(NSInteger)BM;
+ (BOOL)resetLayoutToDefaultAnimatedBm:(NSInteger)BM;
+ (BOOL)toggleTranslucencyViewVisibleBm:(NSInteger)BM;
+ (BOOL)updateToImageCropFrameBm:(NSInteger)BM;
+ (BOOL)gridPanGestureRecognizedBm:(NSInteger)BM;
+ (BOOL)longPressGestureRecognizedBm:(NSInteger)BM;
+ (BOOL)gestureRecognizerShouldBeginBm:(NSInteger)BM;
+ (BOOL)gestureRecognizerShouldreceivetouchBm:(NSInteger)BM;
+ (BOOL)startResetTimerBm:(NSInteger)BM;
+ (BOOL)timerTriggeredBm:(NSInteger)BM;
+ (BOOL)cancelResetTimerBm:(NSInteger)BM;
+ (BOOL)cropEdgeForPointBm:(NSInteger)BM;
+ (BOOL)viewForZoomingInScrollViewBm:(NSInteger)BM;
+ (BOOL)scrollViewDidScrollBm:(NSInteger)BM;
+ (BOOL)scrollViewWillBeginDraggingBm:(NSInteger)BM;
+ (BOOL)scrollViewWillBeginZoomingWithviewBm:(NSInteger)BM;
+ (BOOL)scrollViewDidEndDeceleratingBm:(NSInteger)BM;
+ (BOOL)scrollViewDidEndZoomingWithviewAtscaleBm:(NSInteger)BM;
+ (BOOL)scrollViewDidZoomBm:(NSInteger)BM;
+ (BOOL)scrollViewDidEndDraggingWilldecelerateBm:(NSInteger)BM;
+ (BOOL)setCropBoxResizeEnabledBm:(NSInteger)BM;
+ (BOOL)setCropBoxFrameBm:(NSInteger)BM;
+ (BOOL)setEditingBm:(NSInteger)BM;
+ (BOOL)setSimpleRenderModeBm:(NSInteger)BM;
+ (BOOL)cropBoxAspectRatioIsPortraitBm:(NSInteger)BM;
+ (BOOL)imageCropFrameBm:(NSInteger)BM;
+ (BOOL)setImageCropFrameBm:(NSInteger)BM;
+ (BOOL)setCroppingViewsHiddenBm:(NSInteger)BM;
+ (BOOL)setCroppingViewsHiddenAnimatedBm:(NSInteger)BM;
+ (BOOL)setBackgroundImageViewHiddenAnimatedBm:(NSInteger)BM;
+ (BOOL)setGridOverlayHiddenBm:(NSInteger)BM;
+ (BOOL)setGridOverlayHiddenAnimatedBm:(NSInteger)BM;
+ (BOOL)imageViewFrameBm:(NSInteger)BM;
+ (BOOL)setCanBeResetBm:(NSInteger)BM;
+ (BOOL)setAngleBm:(NSInteger)BM;
+ (BOOL)startEditingBm:(NSInteger)BM;
+ (BOOL)setEditingResetcropboxAnimatedBm:(NSInteger)BM;
+ (BOOL)moveCroppedContentToCenterAnimatedBm:(NSInteger)BM;
+ (BOOL)setSimpleRenderModeAnimatedBm:(NSInteger)BM;
+ (BOOL)setAspectRatioBm:(NSInteger)BM;
+ (BOOL)setAspectRatioAnimatedBm:(NSInteger)BM;
+ (BOOL)rotateImageNinetyDegreesAnimatedBm:(NSInteger)BM;
+ (BOOL)rotateImageNinetyDegreesAnimatedClockwiseBm:(NSInteger)BM;
+ (BOOL)captureStateForImageRotationBm:(NSInteger)BM;
+ (BOOL)checkForCanResetBm:(NSInteger)BM;
+ (BOOL)contentBoundsBm:(NSInteger)BM;
+ (BOOL)imageSizeBm:(NSInteger)BM;
+ (BOOL)hasAspectRatioBm:(NSInteger)BM;

@end