#import "SDWebImageCompat.h"
#import "NSData+ImageContentType.h"
@interface UIImage (MultiFormat)
@property (nonatomic, assign) NSUInteger sd_imageLoopCount;
@property (nonatomic, assign) SDImageFormat sd_imageFormat;
+ (nullable UIImage *)sd_imageWithData:(nullable NSData *)data;
- (nullable NSData *)sd_imageData;
- (nullable NSData *)sd_imageDataAsFormat:(SDImageFormat)imageFormat;
@end
