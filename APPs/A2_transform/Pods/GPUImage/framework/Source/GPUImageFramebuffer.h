#import <Foundation/Foundation.h>
#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
#else
#import <OpenGL/OpenGL.h>
#import <OpenGL/gl.h>
#endif
#import <QuartzCore/QuartzCore.h>
#import <CoreMedia/CoreMedia.h>
typedef struct GPUTextureOptions {
    GLenum minFilter;
    GLenum magFilter;
    GLenum wrapS;
    GLenum wrapT;
    GLenum internalFormat;
    GLenum format;
    GLenum type;
} GPUTextureOptions;
@interface GPUImageFramebuffer : NSObject
@property(readonly) CGSize size;
@property(readonly) GPUTextureOptions textureOptions;
@property(readonly) GLuint texture;
@property(readonly) BOOL missingFramebuffer;
- (id)initWithSize:(CGSize)framebufferSize;
- (id)initWithSize:(CGSize)framebufferSize textureOptions:(GPUTextureOptions)fboTextureOptions onlyTexture:(BOOL)onlyGenerateTexture;
- (id)initWithSize:(CGSize)framebufferSize overriddenTexture:(GLuint)inputTexture;
- (void)activateFramebuffer;
- (void)lock;
- (void)unlock;
- (void)clearAllLocks;
- (void)disableReferenceCounting;
- (void)enableReferenceCounting;
- (CGImageRef)newCGImageFromFramebufferContents;
- (void)restoreRenderTarget;
- (void)lockForReading;
- (void)unlockAfterReading;
- (NSUInteger)bytesPerRow;
- (GLubyte *)byteBuffer;
@end
