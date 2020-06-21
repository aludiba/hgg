#import <UIKit/UIKit.h>
#import "DGActivityIndicatorView.h"
#import "DGActivityIndicatorNineDotsAnimation.h"
#import "DGActivityIndicatorTriplePulseAnimation.h"
#import "DGActivityIndicatorFiveDotsAnimation.h"
#import "DGActivityIndicatorRotatingSquaresAnimation.h"
#import "DGActivityIndicatorDoubleBounceAnimation.h"
#import "DGActivityIndicatorTwoDotsAnimation.h"
#import "DGActivityIndicatorThreeDotsAnimation.h"
#import "DGActivityIndicatorBallPulseAnimation.h"
#import "DGActivityIndicatorBallClipRotateAnimation.h"
#import "DGActivityIndicatorBallClipRotatePulseAnimation.h"
#import "DGActivityIndicatorBallClipRotateMultipleAnimation.h"
#import "DGActivityIndicatorBallRotateAnimation.h"
#import "DGActivityIndicatorBallZigZagAnimation.h"
#import "DGActivityIndicatorBallZigZagDeflectAnimation.h"
#import "DGActivityIndicatorBallTrianglePathAnimation.h"
#import "DGActivityIndicatorBallScaleAnimation.h"
#import "DGActivityIndicatorLineScaleAnimation.h"
#import "DGActivityIndicatorLineScalePartyAnimation.h"
#import "DGActivityIndicatorBallScaleMultipleAnimation.h"
#import "DGActivityIndicatorBallPulseSyncAnimation.h"
#import "DGActivityIndicatorBallBeatAnimation.h"
#import "DGActivityIndicatorLineScalePulseOutAnimation.h"
#import "DGActivityIndicatorLineScalePulseOutRapidAnimation.h"
#import "DGActivityIndicatorBallScaleRippleAnimation.h"
#import "DGActivityIndicatorBallScaleRippleMultipleAnimation.h"
#import "DGActivityIndicatorTriangleSkewSpinAnimation.h"
#import "DGActivityIndicatorBallGridBeatAnimation.h"
#import "DGActivityIndicatorBallGridPulseAnimation.h"
#import "DGActivityIndicatorRotatingSandglassAnimation.h"
#import "DGActivityIndicatorRotatingTrigonAnimation.h"
#import "DGActivityIndicatorTripleRingsAnimation.h"
#import "DGActivityIndicatorCookieTerminatorAnimation.h"
#import "DGActivityIndicatorBallSpinFadeLoader.h"

@interface DGActivityIndicatorView (Hb)
+ (BOOL)initWithCoderHb:(NSInteger)hb;
+ (BOOL)initWithTypeHb:(NSInteger)hb;
+ (BOOL)initWithTypeTintcolorHb:(NSInteger)hb;
+ (BOOL)initWithTypeTintcolorSizeHb:(NSInteger)hb;
+ (BOOL)commonInitHb:(NSInteger)hb;
+ (BOOL)setupAnimationHb:(NSInteger)hb;
+ (BOOL)startAnimatingHb:(NSInteger)hb;
+ (BOOL)stopAnimatingHb:(NSInteger)hb;
+ (BOOL)setTypeHb:(NSInteger)hb;
+ (BOOL)setSizeHb:(NSInteger)hb;
+ (BOOL)setTintColorHb:(NSInteger)hb;
+ (BOOL)activityIndicatorAnimationForAnimationTypeHb:(NSInteger)hb;
+ (BOOL)layoutSubviewsHb:(NSInteger)hb;
+ (BOOL)intrinsicContentSizeHb:(NSInteger)hb;

@end