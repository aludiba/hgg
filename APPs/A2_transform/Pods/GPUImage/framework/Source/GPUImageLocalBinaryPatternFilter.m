#import "GPUImageLocalBinaryPatternFilter.h"
@implementation GPUImageLocalBinaryPatternFilter
#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
NSString *const kGPUImageLocalBinaryPatternFragmentShaderString = SHADER_STRING
(
 precision highp float;
 varying vec2 textureCoordinate;
 varying vec2 leftTextureCoordinate;
 varying vec2 rightTextureCoordinate;
 varying vec2 topTextureCoordinate;
 varying vec2 topLeftTextureCoordinate;
 varying vec2 topRightTextureCoordinate;
 varying vec2 bottomTextureCoordinate;
 varying vec2 bottomLeftTextureCoordinate;
 varying vec2 bottomRightTextureCoordinate;
 uniform sampler2D inputImageTexture;
 void main()
 {
     lowp float centerIntensity = texture2D(inputImageTexture, textureCoordinate).r;
     lowp float bottomLeftIntensity = texture2D(inputImageTexture, bottomLeftTextureCoordinate).r;
     lowp float topRightIntensity = texture2D(inputImageTexture, topRightTextureCoordinate).r;
     lowp float topLeftIntensity = texture2D(inputImageTexture, topLeftTextureCoordinate).r;
     lowp float bottomRightIntensity = texture2D(inputImageTexture, bottomRightTextureCoordinate).r;
     lowp float leftIntensity = texture2D(inputImageTexture, leftTextureCoordinate).r;
     lowp float rightIntensity = texture2D(inputImageTexture, rightTextureCoordinate).r;
     lowp float bottomIntensity = texture2D(inputImageTexture, bottomTextureCoordinate).r;
     lowp float topIntensity = texture2D(inputImageTexture, topTextureCoordinate).r;
     lowp float byteTally = 1.0 / 255.0 * step(centerIntensity, topRightIntensity);
     byteTally += 2.0 / 255.0 * step(centerIntensity, topIntensity);
     byteTally += 4.0 / 255.0 * step(centerIntensity, topLeftIntensity);
     byteTally += 8.0 / 255.0 * step(centerIntensity, leftIntensity);
     byteTally += 16.0 / 255.0 * step(centerIntensity, bottomLeftIntensity);
     byteTally += 32.0 / 255.0 * step(centerIntensity, bottomIntensity);
     byteTally += 64.0 / 255.0 * step(centerIntensity, bottomRightIntensity);
     byteTally += 128.0 / 255.0 * step(centerIntensity, rightIntensity);
     gl_FragColor = vec4(byteTally, byteTally, byteTally, 1.0);
 }
);
#else
NSString *const kGPUImageLocalBinaryPatternFragmentShaderString = SHADER_STRING
(
 varying vec2 textureCoordinate;
 varying vec2 leftTextureCoordinate;
 varying vec2 rightTextureCoordinate;
 varying vec2 topTextureCoordinate;
 varying vec2 topLeftTextureCoordinate;
 varying vec2 topRightTextureCoordinate;
 varying vec2 bottomTextureCoordinate;
 varying vec2 bottomLeftTextureCoordinate;
 varying vec2 bottomRightTextureCoordinate;
 uniform sampler2D inputImageTexture;
 void main()
 {
     float centerIntensity = texture2D(inputImageTexture, textureCoordinate).r;
     float bottomLeftIntensity = texture2D(inputImageTexture, bottomLeftTextureCoordinate).r;
     float topRightIntensity = texture2D(inputImageTexture, topRightTextureCoordinate).r;
     float topLeftIntensity = texture2D(inputImageTexture, topLeftTextureCoordinate).r;
     float bottomRightIntensity = texture2D(inputImageTexture, bottomRightTextureCoordinate).r;
     float leftIntensity = texture2D(inputImageTexture, leftTextureCoordinate).r;
     float rightIntensity = texture2D(inputImageTexture, rightTextureCoordinate).r;
     float bottomIntensity = texture2D(inputImageTexture, bottomTextureCoordinate).r;
     float topIntensity = texture2D(inputImageTexture, topTextureCoordinate).r;
     float byteTally = 1.0 / 255.0 * step(centerIntensity, topRightIntensity);
     byteTally += 2.0 / 255.0 * step(centerIntensity, topIntensity);
     byteTally += 4.0 / 255.0 * step(centerIntensity, topLeftIntensity);
     byteTally += 8.0 / 255.0 * step(centerIntensity, leftIntensity);
     byteTally += 16.0 / 255.0 * step(centerIntensity, bottomLeftIntensity);
     byteTally += 32.0 / 255.0 * step(centerIntensity, bottomIntensity);
     byteTally += 64.0 / 255.0 * step(centerIntensity, bottomRightIntensity);
     byteTally += 128.0 / 255.0 * step(centerIntensity, rightIntensity);
     gl_FragColor = vec4(byteTally, byteTally, byteTally, 1.0);
 }
);
#endif
#pragma mark -
#pragma mark Initialization and teardown
- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageLocalBinaryPatternFragmentShaderString]))
    {
		return nil;
    }
    return self;
}
@end
