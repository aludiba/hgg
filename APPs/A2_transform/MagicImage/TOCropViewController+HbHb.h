#import <UIKit/UIKit.h>
#import "TOCropViewConstants.h"
#import "TOCropView.h"
#import "TOCropToolbar.h"
#import "TOCropViewController.h"
#import "TOCropViewControllerTransitioning.h"
#import "TOActivityCroppedImageProvider.h"
#import "UIImage+CropRotate.h"
#import "TOCroppedImageAttributes.h"
#import "TOCropViewController+Hb.h"

@interface TOCropViewController (HbHb)
+ (BOOL)initWithCroppingStyleImageHbHb:(NSInteger)hb;
+ (BOOL)initWithImageHbHb:(NSInteger)hb;
+ (BOOL)viewDidLoadHbHb:(NSInteger)hb;
+ (BOOL)viewWillAppearHbHb:(NSInteger)hb;
+ (BOOL)viewDidAppearHbHb:(NSInteger)hb;
+ (BOOL)viewWillDisappearHbHb:(NSInteger)hb;
+ (BOOL)viewDidDisappearHbHb:(NSInteger)hb;
+ (BOOL)preferredStatusBarStyleHbHb:(NSInteger)hb;
+ (BOOL)prefersStatusBarHiddenHbHb:(NSInteger)hb;
+ (BOOL)preferredScreenEdgesDeferringSystemGesturesHbHb:(NSInteger)hb;
+ (BOOL)frameForToolbarWithVerticalLayoutHbHb:(NSInteger)hb;
+ (BOOL)frameForCropViewWithVerticalLayoutHbHb:(NSInteger)hb;
+ (BOOL)frameForTitleLabelWithSizeVerticallayoutHbHb:(NSInteger)hb;
+ (BOOL)adjustCropViewInsetsHbHb:(NSInteger)hb;
+ (BOOL)adjustToolbarInsetsHbHb:(NSInteger)hb;
+ (BOOL)viewSafeAreaInsetsDidChangeHbHb:(NSInteger)hb;
+ (BOOL)viewDidLayoutSubviewsHbHb:(NSInteger)hb;
+ (BOOL)willRotateToInterfaceOrientationDurationHbHb:(NSInteger)hb;
+ (BOOL)willAnimateRotationToInterfaceOrientationDurationHbHb:(NSInteger)hb;
+ (BOOL)didRotateFromInterfaceOrientationHbHb:(NSInteger)hb;
+ (BOOL)viewWillTransitionToSizeWithtransitioncoordinatorHbHb:(NSInteger)hb;
+ (BOOL)resetCropViewLayoutHbHb:(NSInteger)hb;
+ (BOOL)showAspectRatioDialogHbHb:(NSInteger)hb;
+ (BOOL)actionSheetDiddismisswithbuttonindexHbHb:(NSInteger)hb;
+ (BOOL)setAspectRatioPresetAnimatedHbHb:(NSInteger)hb;
+ (BOOL)rotateCropViewClockwiseHbHb:(NSInteger)hb;
+ (BOOL)rotateCropViewCounterclockwiseHbHb:(NSInteger)hb;
+ (BOOL)cropViewDidBecomeResettableHbHb:(NSInteger)hb;
+ (BOOL)cropViewDidBecomeNonResettableHbHb:(NSInteger)hb;
+ (BOOL)presentAnimatedFromParentViewControllerFromviewFromframeSetupCompletionHbHb:(NSInteger)hb;
+ (BOOL)presentAnimatedFromParentViewControllerFromimageFromviewFromframeAngleToimageframeSetupCompletionHbHb:(NSInteger)hb;
+ (BOOL)dismissAnimatedFromParentViewControllerToviewToframeSetupCompletionHbHb:(NSInteger)hb;
+ (BOOL)dismissAnimatedFromParentViewControllerWithcroppedimageToviewToframeSetupCompletionHbHb:(NSInteger)hb;
+ (BOOL)animationControllerForPresentedControllerPresentingcontrollerSourcecontrollerHbHb:(NSInteger)hb;
+ (BOOL)animationControllerForDismissedControllerHbHb:(NSInteger)hb;
+ (BOOL)cancelButtonTappedHbHb:(NSInteger)hb;
+ (BOOL)doneButtonTappedHbHb:(NSInteger)hb;
+ (BOOL)setTitleHbHb:(NSInteger)hb;
+ (BOOL)setDoneButtonTitleHbHb:(NSInteger)hb;
+ (BOOL)setCancelButtonTitleHbHb:(NSInteger)hb;
+ (BOOL)cropViewHbHb:(NSInteger)hb;
+ (BOOL)toolbarHbHb:(NSInteger)hb;
+ (BOOL)titleLabelHbHb:(NSInteger)hb;
+ (BOOL)setAspectRatioLockEnabledHbHb:(NSInteger)hb;
+ (BOOL)setAspectRatioLockDimensionSwapEnabledHbHb:(NSInteger)hb;
+ (BOOL)aspectRatioLockEnabledHbHb:(NSInteger)hb;
+ (BOOL)setRotateButtonsHiddenHbHb:(NSInteger)hb;
+ (BOOL)rotateButtonsHiddenHbHb:(NSInteger)hb;
+ (BOOL)setRotateClockwiseButtonHiddenHbHb:(NSInteger)hb;
+ (BOOL)rotateClockwiseButtonHiddenHbHb:(NSInteger)hb;
+ (BOOL)setAspectRatioPickerButtonHiddenHbHb:(NSInteger)hb;
+ (BOOL)aspectRatioPickerButtonHiddenHbHb:(NSInteger)hb;
+ (BOOL)setResetAspectRatioEnabledHbHb:(NSInteger)hb;
+ (BOOL)setCustomAspectRatioHbHb:(NSInteger)hb;
+ (BOOL)resetAspectRatioEnabledHbHb:(NSInteger)hb;
+ (BOOL)setAngleHbHb:(NSInteger)hb;
+ (BOOL)angleHbHb:(NSInteger)hb;
+ (BOOL)setImageCropFrameHbHb:(NSInteger)hb;
+ (BOOL)imageCropFrameHbHb:(NSInteger)hb;
+ (BOOL)verticalLayoutHbHb:(NSInteger)hb;
+ (BOOL)overrideStatusBarHbHb:(NSInteger)hb;
+ (BOOL)statusBarHiddenHbHb:(NSInteger)hb;
+ (BOOL)statusBarHeightHbHb:(NSInteger)hb;
+ (BOOL)statusBarSafeInsetsHbHb:(NSInteger)hb;
+ (BOOL)setMinimumAspectRatioHbHb:(NSInteger)hb;
+ (BOOL)minimumAspectRatioHbHb:(NSInteger)hb;

@end
