#import <Foundation/Foundation.h>
#import <YYModel.h>
@interface QMCropModel : NSObject<YYModel>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, assign) NSInteger type;
+ (NSArray<QMCropModel *> *)buildCropModels;
@end
