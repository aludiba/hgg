#import <GPUImage/GPUImage.h>
#import "QMFilterModel.h"
@interface QMImageFilter : GPUImageFilter
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFilterModel:(QMFilterModel *)model;
- (void)setAlpha:(CGFloat)alpha;
@end
