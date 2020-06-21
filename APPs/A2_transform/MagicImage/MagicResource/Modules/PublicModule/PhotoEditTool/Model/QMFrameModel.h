#import "QMBaseThemeView.h"
@interface QMFrameModel : QMBaseThemeView
@property (nonatomic, strong) NSString *icon;
+ (NSArray<QMFrameModel *> *)buildFrameModels;
@end
