#import "QMBaseThemeView.h"
#import "QMFrameModel.h"
@interface QMFrameThemeView : QMBaseThemeView
@property (nonatomic, assign) BOOL external;
@property (nonatomic, strong) NSArray<QMFrameModel *> *frameModels;
@property (nonatomic, strong) void(^frameClickBlock)(QMFrameModel *model);
- (void)reloadData;
@end
