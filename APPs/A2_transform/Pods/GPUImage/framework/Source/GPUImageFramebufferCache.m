#import "GPUImageFramebufferCache.h"
#import "GPUImageContext.h"
#import "GPUImageOutput.h"
#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#endif
@interface GPUImageFramebufferCache()
{
    NSMutableDictionary *framebufferCache;
    NSMutableDictionary *framebufferTypeCounts;
    NSMutableArray *activeImageCaptureList; 
    id memoryWarningObserver;
    dispatch_queue_t framebufferCacheQueue;
}
- (NSString *)hashForSize:(CGSize)size textureOptions:(GPUTextureOptions)textureOptions onlyTexture:(BOOL)onlyTexture;
@end
@implementation GPUImageFramebufferCache
#pragma mark -
#pragma mark Initialization and teardown
- (id)init;
{
    if (!(self = [super init]))
    {
		return nil;
    }
#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
    memoryWarningObserver = [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidReceiveMemoryWarningNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
        [self purgeAllUnassignedFramebuffers];
	}];
#else
#endif
    framebufferCache = [[NSMutableDictionary alloc] init];
    framebufferTypeCounts = [[NSMutableDictionary alloc] init];
    activeImageCaptureList = [[NSMutableArray alloc] init];
    framebufferCacheQueue = dispatch_queue_create("com.sunsetlakesoftware.GPUImage.framebufferCacheQueue", NULL);
    return self;
}
#pragma mark -
#pragma mark Framebuffer management
- (NSString *)hashForSize:(CGSize)size textureOptions:(GPUTextureOptions)textureOptions onlyTexture:(BOOL)onlyTexture;
{
    if (onlyTexture)
    {
        return [NSString stringWithFormat:@"%.1fx%.1f-%d:%d:%d:%d:%d:%d:%d-NOFB", size.width, size.height, textureOptions.minFilter, textureOptions.magFilter, textureOptions.wrapS, textureOptions.wrapT, textureOptions.internalFormat, textureOptions.format, textureOptions.type];
    }
    else
    {
        return [NSString stringWithFormat:@"%.1fx%.1f-%d:%d:%d:%d:%d:%d:%d", size.width, size.height, textureOptions.minFilter, textureOptions.magFilter, textureOptions.wrapS, textureOptions.wrapT, textureOptions.internalFormat, textureOptions.format, textureOptions.type];
    }
}
- (GPUImageFramebuffer *)fetchFramebufferForSize:(CGSize)framebufferSize textureOptions:(GPUTextureOptions)textureOptions onlyTexture:(BOOL)onlyTexture;
{
    __block GPUImageFramebuffer *framebufferFromCache = nil;
    runSynchronouslyOnVideoProcessingQueue(^{
        NSString *lookupHash = [self hashForSize:framebufferSize textureOptions:textureOptions onlyTexture:onlyTexture];
        NSNumber *numberOfMatchingTexturesInCache = [framebufferTypeCounts objectForKey:lookupHash];
        NSInteger numberOfMatchingTextures = [numberOfMatchingTexturesInCache integerValue];
        if ([numberOfMatchingTexturesInCache integerValue] < 1)
        {
            framebufferFromCache = [[GPUImageFramebuffer alloc] initWithSize:framebufferSize textureOptions:textureOptions onlyTexture:onlyTexture];
        }
        else
        {
            NSInteger currentTextureID = (numberOfMatchingTextures - 1);
            while ((framebufferFromCache == nil) && (currentTextureID >= 0))
            {
                NSString *textureHash = [NSString stringWithFormat:@"%@-%ld", lookupHash, (long)currentTextureID];
                framebufferFromCache = [framebufferCache objectForKey:textureHash];
                if (framebufferFromCache != nil)
                {
                    [framebufferCache removeObjectForKey:textureHash];
                }
                currentTextureID--;
            }
            currentTextureID++;
            [framebufferTypeCounts setObject:[NSNumber numberWithInteger:currentTextureID] forKey:lookupHash];
            if (framebufferFromCache == nil)
            {
                framebufferFromCache = [[GPUImageFramebuffer alloc] initWithSize:framebufferSize textureOptions:textureOptions onlyTexture:onlyTexture];
            }
        }
    });
    [framebufferFromCache lock];
    return framebufferFromCache;
}
- (GPUImageFramebuffer *)fetchFramebufferForSize:(CGSize)framebufferSize onlyTexture:(BOOL)onlyTexture;
{
    GPUTextureOptions defaultTextureOptions;
    defaultTextureOptions.minFilter = GL_LINEAR;
    defaultTextureOptions.magFilter = GL_LINEAR;
    defaultTextureOptions.wrapS = GL_CLAMP_TO_EDGE;
    defaultTextureOptions.wrapT = GL_CLAMP_TO_EDGE;
    defaultTextureOptions.internalFormat = GL_RGBA;
    defaultTextureOptions.format = GL_BGRA;
    defaultTextureOptions.type = GL_UNSIGNED_BYTE;
    return [self fetchFramebufferForSize:framebufferSize textureOptions:defaultTextureOptions onlyTexture:onlyTexture];
}
- (void)returnFramebufferToCache:(GPUImageFramebuffer *)framebuffer;
{
    [framebuffer clearAllLocks];
    runAsynchronouslyOnVideoProcessingQueue(^{
        CGSize framebufferSize = framebuffer.size;
        GPUTextureOptions framebufferTextureOptions = framebuffer.textureOptions;
        NSString *lookupHash = [self hashForSize:framebufferSize textureOptions:framebufferTextureOptions onlyTexture:framebuffer.missingFramebuffer];
        NSNumber *numberOfMatchingTexturesInCache = [framebufferTypeCounts objectForKey:lookupHash];
        NSInteger numberOfMatchingTextures = [numberOfMatchingTexturesInCache integerValue];
        NSString *textureHash = [NSString stringWithFormat:@"%@-%ld", lookupHash, (long)numberOfMatchingTextures];
        [framebufferCache setObject:framebuffer forKey:textureHash];
        [framebufferTypeCounts setObject:[NSNumber numberWithInteger:(numberOfMatchingTextures + 1)] forKey:lookupHash];
    });
}
- (void)purgeAllUnassignedFramebuffers;
{
    runAsynchronouslyOnVideoProcessingQueue(^{
        [framebufferCache removeAllObjects];
        [framebufferTypeCounts removeAllObjects];
#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
        CVOpenGLESTextureCacheFlush([[GPUImageContext sharedImageProcessingContext] coreVideoTextureCache], 0);
#else
#endif
    });
}
- (void)addFramebufferToActiveImageCaptureList:(GPUImageFramebuffer *)framebuffer;
{
    runAsynchronouslyOnVideoProcessingQueue(^{
        [activeImageCaptureList addObject:framebuffer];
    });
}
- (void)removeFramebufferFromActiveImageCaptureList:(GPUImageFramebuffer *)framebuffer;
{
    runAsynchronouslyOnVideoProcessingQueue(^{
        [activeImageCaptureList removeObject:framebuffer];
    });
}
@end
