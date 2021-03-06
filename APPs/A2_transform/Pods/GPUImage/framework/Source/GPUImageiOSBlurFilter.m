#import "GPUImageiOSBlurFilter.h"
#import "GPUImageSaturationFilter.h"
#import "GPUImageGaussianBlurFilter.h"
#import "GPUImageLuminanceRangeFilter.h"
@implementation GPUImageiOSBlurFilter
@synthesize blurRadiusInPixels;
@synthesize saturation;
@synthesize downsampling = _downsampling;
#pragma mark -
#pragma mark Initialization and teardown
- (id)init;
{
    if (!(self = [super init]))
    {
		return nil;
    }
    saturationFilter = [[GPUImageSaturationFilter alloc] init];
    [self addFilter:saturationFilter];
    blurFilter = [[GPUImageGaussianBlurFilter alloc] init];
    [self addFilter:blurFilter];
    luminanceRangeFilter = [[GPUImageLuminanceRangeFilter alloc] init];
    [self addFilter:luminanceRangeFilter];
    [saturationFilter addTarget:blurFilter];
    [blurFilter addTarget:luminanceRangeFilter];
    self.initialFilters = [NSArray arrayWithObject:saturationFilter];
    self.terminalFilter = luminanceRangeFilter;
    self.blurRadiusInPixels = 12.0;
    self.saturation = 0.8;
    self.downsampling = 4.0;
    self.rangeReductionFactor = 0.6;
    return self;
}
- (void)setInputSize:(CGSize)newSize atIndex:(NSInteger)textureIndex;
{
    if (_downsampling > 1.0)
    {
        CGSize rotatedSize = [saturationFilter rotatedSize:newSize forIndex:textureIndex];
        [saturationFilter forceProcessingAtSize:CGSizeMake(rotatedSize.width / _downsampling, rotatedSize.height / _downsampling)];
        [luminanceRangeFilter forceProcessingAtSize:rotatedSize];
    }
    [super setInputSize:newSize atIndex:textureIndex];
}
#pragma mark -
#pragma mark Accessors
- (void)setBlurRadiusInPixels:(CGFloat)newValue;
{
    blurFilter.blurRadiusInPixels = newValue;
}
- (CGFloat)blurRadiusInPixels;
{
    return blurFilter.blurRadiusInPixels;
}
- (void)setSaturation:(CGFloat)newValue;
{
    saturationFilter.saturation = newValue;
}
- (CGFloat)saturation;
{
    return saturationFilter.saturation;
}
- (void)setDownsampling:(CGFloat)newValue;
{
    _downsampling = newValue;
}
- (void)setRangeReductionFactor:(CGFloat)rangeReductionFactor
{
    luminanceRangeFilter.rangeReductionFactor = rangeReductionFactor;
}
- (CGFloat)rangeReductionFactor
{
    return luminanceRangeFilter.rangeReductionFactor;
}
@end
