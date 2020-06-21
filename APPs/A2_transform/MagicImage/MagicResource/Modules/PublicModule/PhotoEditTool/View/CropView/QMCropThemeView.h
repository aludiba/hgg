#import "QMBaseThemeView.h"
#import "QMCropModel.h"
#import "Constants.h"
@interface QMCropThemeView : QMBaseThemeView
@property (nonatomic, strong) NSArray<QMCropModel *> *cropModels;
@property (nonatomic, strong) void(^croperClickBlock)(CGSize aspect, CGFloat rotation);
- (void)reloadData;
@end
