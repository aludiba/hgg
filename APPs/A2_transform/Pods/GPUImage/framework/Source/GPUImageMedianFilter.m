#import "GPUImageMedianFilter.h"
#if TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE
NSString *const kGPUImageMedianFragmentShaderString = SHADER_STRING
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
#define s2(a, b)				temp = a; a = min(a, b); b = max(temp, b);
#define mn3(a, b, c)			s2(a, b); s2(a, c);
#define mx3(a, b, c)			s2(b, c); s2(a, c);
#define mnmx3(a, b, c)			mx3(a, b, c); s2(a, b);                                   
#define mnmx4(a, b, c, d)		s2(a, b); s2(c, d); s2(a, c); s2(b, d);                   
#define mnmx5(a, b, c, d, e)	s2(a, b); s2(c, d); mn3(a, c, e); mx3(b, d, e);           
#define mnmx6(a, b, c, d, e, f) s2(a, d); s2(b, e); s2(c, f); mn3(a, b, c); mx3(d, e, f); 
 void main()
 {
     vec3 v[6];
     v[0] = texture2D(inputImageTexture, bottomLeftTextureCoordinate).rgb;
     v[1] = texture2D(inputImageTexture, topRightTextureCoordinate).rgb;
     v[2] = texture2D(inputImageTexture, topLeftTextureCoordinate).rgb;
     v[3] = texture2D(inputImageTexture, bottomRightTextureCoordinate).rgb;
     v[4] = texture2D(inputImageTexture, leftTextureCoordinate).rgb;
     v[5] = texture2D(inputImageTexture, rightTextureCoordinate).rgb;
     vec3 temp;
     mnmx6(v[0], v[1], v[2], v[3], v[4], v[5]);
     v[5] = texture2D(inputImageTexture, bottomTextureCoordinate).rgb;
     mnmx5(v[1], v[2], v[3], v[4], v[5]);
     v[5] = texture2D(inputImageTexture, topTextureCoordinate).rgb;
     mnmx4(v[2], v[3], v[4], v[5]);
     v[5] = texture2D(inputImageTexture, textureCoordinate).rgb;
     mnmx3(v[3], v[4], v[5]);
     gl_FragColor = vec4(v[4], 1.0);
 }
);
#else
NSString *const kGPUImageMedianFragmentShaderString = SHADER_STRING
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
#define s2(a, b)				temp = a; a = min(a, b); b = max(temp, b);
#define mn3(a, b, c)			s2(a, b); s2(a, c);
#define mx3(a, b, c)			s2(b, c); s2(a, c);
#define mnmx3(a, b, c)			mx3(a, b, c); s2(a, b);                                   
#define mnmx4(a, b, c, d)		s2(a, b); s2(c, d); s2(a, c); s2(b, d);                   
#define mnmx5(a, b, c, d, e)	s2(a, b); s2(c, d); mn3(a, c, e); mx3(b, d, e);           
#define mnmx6(a, b, c, d, e, f) s2(a, d); s2(b, e); s2(c, f); mn3(a, b, c); mx3(d, e, f); 
 void main()
 {
     vec3 v[6];
     v[0] = texture2D(inputImageTexture, bottomLeftTextureCoordinate).rgb;
     v[1] = texture2D(inputImageTexture, topRightTextureCoordinate).rgb;
     v[2] = texture2D(inputImageTexture, topLeftTextureCoordinate).rgb;
     v[3] = texture2D(inputImageTexture, bottomRightTextureCoordinate).rgb;
     v[4] = texture2D(inputImageTexture, leftTextureCoordinate).rgb;
     v[5] = texture2D(inputImageTexture, rightTextureCoordinate).rgb;
     vec3 temp;
     mnmx6(v[0], v[1], v[2], v[3], v[4], v[5]);
     v[5] = texture2D(inputImageTexture, bottomTextureCoordinate).rgb;
     mnmx5(v[1], v[2], v[3], v[4], v[5]);
     v[5] = texture2D(inputImageTexture, topTextureCoordinate).rgb;
     mnmx4(v[2], v[3], v[4], v[5]);
     v[5] = texture2D(inputImageTexture, textureCoordinate).rgb;
     mnmx3(v[3], v[4], v[5]);
     gl_FragColor = vec4(v[4], 1.0);
 }
);
#endif
@implementation GPUImageMedianFilter
#pragma mark -
#pragma mark Initialization and teardown
- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageMedianFragmentShaderString]))
    {
		return nil;
    }
    hasOverriddenImageSizeFactor = NO;
    return self;
}
@end
