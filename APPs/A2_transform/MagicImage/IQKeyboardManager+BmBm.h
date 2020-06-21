#import "IQKeyboardManagerConstants.h"
#import "IQUIView+IQKeyboardToolbar.h"
#import "IQPreviousNextView.h"
#import "IQUIViewController+Additions.h"
#import "IQKeyboardReturnKeyHandler.h"
#import "IQTextView.h"
#import "IQToolbar.h"
#import "IQUIScrollView+Additions.h"
#import "IQUITextFieldView+Additions.h"
#import "IQBarButtonItem.h"
#import "IQTitleBarButtonItem.h"
#import "IQUIView+Hierarchy.h"
#import <CoreGraphics/CGBase.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSObjCRuntime.h>
#import <Foundation/NSSet.h>
#import <UIKit/UITextInputTraits.h>
#import "IQKeyboardManager.h"
#import "IQUIView+Hierarchy.h"
#import "IQUIView+IQKeyboardToolbar.h"
#import "IQNSArray+Sort.h"
#import "IQKeyboardManagerConstantsInternal.h"
#import "IQUIScrollView+Additions.h"
#import "IQUITextFieldView+Additions.h"
#import "IQUIViewController+Additions.h"
#import "IQPreviousNextView.h"
#import <QuartzCore/CABase.h>
#import <objc/runtime.h>
#import <UIKit/UIAlertController.h>
#import <UIKit/UISearchBar.h>
#import <UIKit/UIScreen.h>
#import <UIKit/UINavigationBar.h>
#import <UIKit/UITapGestureRecognizer.h>
#import <UIKit/UITextField.h>
#import <UIKit/UITextView.h>
#import <UIKit/UITableViewController.h>
#import <UIKit/UICollectionViewController.h>
#import <UIKit/UICollectionViewCell.h>
#import <UIKit/UICollectionViewLayout.h>
#import <UIKit/UINavigationController.h>
#import <UIKit/UITouch.h>
#import <UIKit/UIWindow.h>
#import <UIKit/UIStackView.h>
#import <UIKit/NSLayoutConstraint.h>
#import <UIKit/UIStackView.h>
#import <UIKit/UIAccessibility.h>
#import <UIKit/UIWindowScene.h>
#import <UIKit/UIStatusBarManager.h>
#import "IQKeyboardManager+Bm.h"

@interface IQKeyboardManager (BmBm)
+ (BOOL)loadBmBm:(NSInteger)BM;
+ (BOOL)initBmBm:(NSInteger)BM;
+ (BOOL)sharedManagerBmBm:(NSInteger)BM;
+ (BOOL)deallocBmBm:(NSInteger)BM;
+ (BOOL)setEnableBmBm:(NSInteger)BM;
+ (BOOL)privateIsEnabledBmBm:(NSInteger)BM;
+ (BOOL)setKeyboardDistanceFromTextFieldBmBm:(NSInteger)BM;
+ (BOOL)setShouldResignOnTouchOutsideBmBm:(NSInteger)BM;
+ (BOOL)privateShouldResignOnTouchOutsideBmBm:(NSInteger)BM;
+ (BOOL)setMovedDistanceBmBm:(NSInteger)BM;
+ (BOOL)setEnableAutoToolbarBmBm:(NSInteger)BM;
+ (BOOL)privateIsEnableAutoToolbarBmBm:(NSInteger)BM;
+ (BOOL)keyWindowBmBm:(NSInteger)BM;
+ (BOOL)optimizedAdjustPositionBmBm:(NSInteger)BM;
+ (BOOL)adjustPositionBmBm:(NSInteger)BM;
+ (BOOL)restorePositionBmBm:(NSInteger)BM;
+ (BOOL)reloadLayoutIfNeededBmBm:(NSInteger)BM;
+ (BOOL)keyboardWillShowBmBm:(NSInteger)BM;
+ (BOOL)keyboardDidShowBmBm:(NSInteger)BM;
+ (BOOL)keyboardWillHideBmBm:(NSInteger)BM;
+ (BOOL)keyboardDidHideBmBm:(NSInteger)BM;
+ (BOOL)textFieldViewDidBeginEditingBmBm:(NSInteger)BM;
+ (BOOL)textFieldViewDidEndEditingBmBm:(NSInteger)BM;
+ (BOOL)willChangeStatusBarOrientationBmBm:(NSInteger)BM;
+ (BOOL)tapRecognizedBmBm:(NSInteger)BM;
+ (BOOL)gestureRecognizerShouldrecognizesimultaneouslywithgesturerecognizerBmBm:(NSInteger)BM;
+ (BOOL)gestureRecognizerShouldreceivetouchBmBm:(NSInteger)BM;
+ (BOOL)resignFirstResponderBmBm:(NSInteger)BM;
+ (BOOL)canGoPreviousBmBm:(NSInteger)BM;
+ (BOOL)canGoNextBmBm:(NSInteger)BM;
+ (BOOL)goPreviousBmBm:(NSInteger)BM;
+ (BOOL)goNextBmBm:(NSInteger)BM;
+ (BOOL)responderViewsBmBm:(NSInteger)BM;
+ (BOOL)addToolbarIfRequiredBmBm:(NSInteger)BM;
+ (BOOL)removeToolbarIfRequiredBmBm:(NSInteger)BM;
+ (BOOL)reloadInputViewsBmBm:(NSInteger)BM;
+ (BOOL)previousActionBmBm:(NSInteger)BM;
+ (BOOL)nextActionBmBm:(NSInteger)BM;
+ (BOOL)doneActionBmBm:(NSInteger)BM;
+ (BOOL)registerTextFieldViewClassDidbegineditingnotificationnameDidendeditingnotificationnameBmBm:(NSInteger)BM;
+ (BOOL)unregisterTextFieldViewClassDidbegineditingnotificationnameDidendeditingnotificationnameBmBm:(NSInteger)BM;
+ (BOOL)registerAllNotificationsBmBm:(NSInteger)BM;
+ (BOOL)unregisterAllNotificationsBmBm:(NSInteger)BM;
+ (BOOL)showLogBmBm:(NSInteger)BM;
+ (BOOL)showLogIndentationBmBm:(NSInteger)BM;

@end
