#import <UIKit/UIKit.h>
#import "TOCropViewConstants.h"
#import "TOCropView.h"
#import "TOCropToolbar.h"
#import "TOCropViewController.h"
#import "TOCropViewControllerTransitioning.h"
#import "TOActivityCroppedImageProvider.h"
#import "UIImage+CropRotate.h"
#import "TOCroppedImageAttributes.h"

@interface TOCropViewController (Bm)
+ (BOOL)initWithCroppingStyleImageBm:(NSInteger)BM;
+ (BOOL)initWithImageBm:(NSInteger)BM;
+ (BOOL)viewDidLoadBm:(NSInteger)BM;
+ (BOOL)viewWillAppearBm:(NSInteger)BM;
+ (BOOL)viewDidAppearBm:(NSInteger)BM;
+ (BOOL)viewWillDisappearBm:(NSInteger)BM;
+ (BOOL)viewDidDisappearBm:(NSInteger)BM;
+ (BOOL)preferredStatusBarStyleBm:(NSInteger)BM;
+ (BOOL)prefersStatusBarHiddenBm:(NSInteger)BM;
+ (BOOL)preferredScreenEdgesDeferringSystemGesturesBm:(NSInteger)BM;
+ (BOOL)frameForToolbarWithVerticalLayoutBm:(NSInteger)BM;
+ (BOOL)frameForCropViewWithVerticalLayoutBm:(NSInteger)BM;
+ (BOOL)frameForTitleLabelWithSizeVerticallayoutBm:(NSInteger)BM;
+ (BOOL)adjustCropViewInsetsBm:(NSInteger)BM;
+ (BOOL)adjustToolbarInsetsBm:(NSInteger)BM;
+ (BOOL)viewSafeAreaInsetsDidChangeBm:(NSInteger)BM;
+ (BOOL)viewDidLayoutSubviewsBm:(NSInteger)BM;
+ (BOOL)willRotateToInterfaceOrientationDurationBm:(NSInteger)BM;
+ (BOOL)willAnimateRotationToInterfaceOrientationDurationBm:(NSInteger)BM;
+ (BOOL)didRotateFromInterfaceOrientationBm:(NSInteger)BM;
+ (BOOL)viewWillTransitionToSizeWithtransitioncoordinatorBm:(NSInteger)BM;
+ (BOOL)resetCropViewLayoutBm:(NSInteger)BM;
+ (BOOL)showAspectRatioDialogBm:(NSInteger)BM;
+ (BOOL)actionSheetDiddismisswithbuttonindexBm:(NSInteger)BM;
+ (BOOL)setAspectRatioPresetAnimatedBm:(NSInteger)BM;
+ (BOOL)rotateCropViewClockwiseBm:(NSInteger)BM;
+ (BOOL)rotateCropViewCounterclockwiseBm:(NSInteger)BM;
+ (BOOL)cropViewDidBecomeResettableBm:(NSInteger)BM;
+ (BOOL)cropViewDidBecomeNonResettableBm:(NSInteger)BM;
+ (BOOL)presentAnimatedFromParentViewControllerFromviewFromframeSetupCompletionBm:(NSInteger)BM;
+ (BOOL)presentAnimatedFromParentViewControllerFromimageFromviewFromframeAngleToimageframeSetupCompletionBm:(NSInteger)BM;
+ (BOOL)dismissAnimatedFromParentViewControllerToviewToframeSetupCompletionBm:(NSInteger)BM;
+ (BOOL)dismissAnimatedFromParentViewControllerWithcroppedimageToviewToframeSetupCompletionBm:(NSInteger)BM;
+ (BOOL)animationControllerForPresentedControllerPresentingcontrollerSourcecontrollerBm:(NSInteger)BM;
+ (BOOL)animationControllerForDismissedControllerBm:(NSInteger)BM;
+ (BOOL)cancelButtonTappedBm:(NSInteger)BM;
+ (BOOL)doneButtonTappedBm:(NSInteger)BM;
+ (BOOL)setTitleBm:(NSInteger)BM;
+ (BOOL)setDoneButtonTitleBm:(NSInteger)BM;
+ (BOOL)setCancelButtonTitleBm:(NSInteger)BM;
+ (BOOL)cropViewBm:(NSInteger)BM;
+ (BOOL)toolbarBm:(NSInteger)BM;
+ (BOOL)titleLabelBm:(NSInteger)BM;
+ (BOOL)setAspectRatioLockEnabledBm:(NSInteger)BM;
+ (BOOL)setAspectRatioLockDimensionSwapEnabledBm:(NSInteger)BM;
+ (BOOL)aspectRatioLockEnabledBm:(NSInteger)BM;
+ (BOOL)setRotateButtonsHiddenBm:(NSInteger)BM;
+ (BOOL)rotateButtonsHiddenBm:(NSInteger)BM;
+ (BOOL)setRotateClockwiseButtonHiddenBm:(NSInteger)BM;
+ (BOOL)rotateClockwiseButtonHiddenBm:(NSInteger)BM;
+ (BOOL)setAspectRatioPickerButtonHiddenBm:(NSInteger)BM;
+ (BOOL)aspectRatioPickerButtonHiddenBm:(NSInteger)BM;
+ (BOOL)setResetAspectRatioEnabledBm:(NSInteger)BM;
+ (BOOL)setCustomAspectRatioBm:(NSInteger)BM;
+ (BOOL)resetAspectRatioEnabledBm:(NSInteger)BM;
+ (BOOL)setAngleBm:(NSInteger)BM;
+ (BOOL)angleBm:(NSInteger)BM;
+ (BOOL)setImageCropFrameBm:(NSInteger)BM;
+ (BOOL)imageCropFrameBm:(NSInteger)BM;
+ (BOOL)verticalLayoutBm:(NSInteger)BM;
+ (BOOL)overrideStatusBarBm:(NSInteger)BM;
+ (BOOL)statusBarHiddenBm:(NSInteger)BM;
+ (BOOL)statusBarHeightBm:(NSInteger)BM;
+ (BOOL)statusBarSafeInsetsBm:(NSInteger)BM;
+ (BOOL)setMinimumAspectRatioBm:(NSInteger)BM;
+ (BOOL)minimumAspectRatioBm:(NSInteger)BM;

@end
