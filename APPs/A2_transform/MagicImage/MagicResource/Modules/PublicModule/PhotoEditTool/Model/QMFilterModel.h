#import <Foundation/Foundation.h>
@interface QMFilterModel : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *enName;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *fragmentShader;
@property (nonatomic, assign) float currentAlphaValue;
@property (nonatomic, strong) NSArray<NSString *> *textureImages;
+ (QMFilterModel *)buildFilterModelWithFilterPath:(NSString *)filter;
+ (NSArray<QMFilterModel *> *)buildFilterModelsWithPath:(NSString *)folder;
@end
