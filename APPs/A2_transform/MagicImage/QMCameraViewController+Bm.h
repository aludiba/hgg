#import <UIKit/UIKit.h>
#import "Constants.h"
#import "QMCameraViewController.h"
#import "QMPhotoClipViewController.h"
#import "QMPhotoEffectViewController.h"
#import "RTImagePickerViewController.h"
#import "UIColor+Additions.h"
#import "QMCameraSettingViewController.h"
#import <Photos/Photos.h>
#import <TOCropViewController.h>
#import <GPUImage.h>
#import <Masonry.h>
#import "QMShakeButton.h"
#import "CKStillCamera.h"
#import "CKStillCameraPreview.h"
#import "PHAsset+Latest.h"
#import "QMCameraRatioSuspensionView.h"
#import "QMCameraFlashSuspensionView.h"
#import "QMCameraFilterView.h"
#import "QMImageFilter.h"
#import "QMPhotoDisplayViewController.h"
#import "UIImage+Rotate.h"
#import "UIImage+Clip.h"
#import "QMCameraFocusView.h"
#import "QMProgressHUD.h"

@interface QMCameraViewController (Bm)
+ (BOOL)viewDidLoadBm:(NSInteger)BM;
+ (BOOL)viewDidAppearBm:(NSInteger)BM;
+ (BOOL)prefersStatusBarHiddenBm:(NSInteger)BM;
+ (BOOL)preferredStatusBarStyleBm:(NSInteger)BM;
+ (BOOL)setupVarBm:(NSInteger)BM;
+ (BOOL)setupUIBm:(NSInteger)BM;
+ (BOOL)setupCameraBm:(NSInteger)BM;
+ (BOOL)startCameraCaptureBm:(NSInteger)BM;
+ (BOOL)stopCameraCaptureBm:(NSInteger)BM;
+ (BOOL)choseImageFromPhotoLibraryBm:(NSInteger)BM;
+ (BOOL)asyncLoadLatestImageFromPhotoLibBm:(NSInteger)BM;
+ (BOOL)fixImageOrientationCompletionblockBm:(NSInteger)BM;
+ (BOOL)setCameraRatioBm:(NSInteger)BM;
+ (BOOL)ratioSuspensionViewBm:(NSInteger)BM;
+ (BOOL)flashSuspensionViewBm:(NSInteger)BM;
+ (BOOL)cameraFilterViewBm:(NSInteger)BM;
+ (BOOL)cameraFocusViewBm:(NSInteger)BM;
+ (BOOL)rt_imagePickerControllerDidfinishpickingimagesBm:(NSInteger)BM;
+ (BOOL)rt_imagePickerControllerDidCancelBm:(NSInteger)BM;
+ (BOOL)rt_imagePickerControllerDidselectassetBm:(NSInteger)BM;
+ (BOOL)cropViewControllerDidcroptoimageWithrectAngleBm:(NSInteger)BM;

@end
