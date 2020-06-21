#import <UIKit/UIKit.h>
#import "QMBaseThemeView.h"
@interface QMFilterThemeSilder : QMBaseThemeView
@property (nonatomic, strong) void(^sliderValueChangeBlock)(NSInteger index, float value);
- (instancetype)init;
- (void)showWithValue:(float)value;
@end
