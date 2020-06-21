#import <UIKit/UIKit.h>
@interface QMCameraFocusView : UIView
@property(nonatomic, assign) CGFloat ISO;
@property(nullable, nonatomic, copy) void (^luminanceChangeBlock)(CGFloat value);
+ (instancetype _Nonnull)focusView;
- (void)foucusAtPoint:(CGPoint)center;
@end
