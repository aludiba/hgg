#import "QMCropModel.h"
@implementation QMCropModel
+ (NSArray<QMCropModel *> *)buildCropModels
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"croper" ofType:@"geojson"];
    NSData *jsonConfig = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonConfig options:NSJSONReadingMutableContainers error:nil];
    if (!array) {
        return nil;
    }
    NSMutableArray *cropsArr = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        QMCropModel *model = [QMCropModel yy_modelWithDictionary:dict];
        if (model) {
            [cropsArr addObject:model];
        }
    }
    return cropsArr;
}
@end
