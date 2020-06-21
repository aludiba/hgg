#import "SDImageCacheConfig.h"
static const NSInteger kDefaultCacheMaxCacheAge = 60 * 60 * 24 * 7; 
@implementation SDImageCacheConfig
- (instancetype)init {
    if (self = [super init]) {
        _shouldDecompressImages = YES;
        _shouldDisableiCloud = YES;
        _shouldCacheImagesInMemory = YES;
        _shouldUseWeakMemoryCache = YES;
        _diskCacheReadingOptions = 0;
        _diskCacheWritingOptions = NSDataWritingAtomic;
        _maxCacheAge = kDefaultCacheMaxCacheAge;
        _maxCacheSize = 0;
        _diskCacheExpireType = SDImageCacheConfigExpireTypeModificationDate;
    }
    return self;
}
@end
