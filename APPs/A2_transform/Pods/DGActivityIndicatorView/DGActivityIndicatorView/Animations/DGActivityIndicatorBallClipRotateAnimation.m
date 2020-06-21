#import "DGActivityIndicatorBallClipRotateAnimation.h"
@implementation DGActivityIndicatorBallClipRotateAnimation
- (void)setupAnimationInLayer:(CALayer *)layer withSize:(CGSize)size tintColor:(UIColor *)tintColor {
    CGFloat duration = 0.75f;
    CAKeyframeAnimation *scaleAnimation = [self createKeyframeAnimationWithKeyPath:@"transform.scale"];
    scaleAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)],
                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.6f, 0.6f, 1.0f)],
                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)]];
    scaleAnimation.keyTimes = @[@0.0f, @0.5f, @1.0f];
    CAKeyframeAnimation *rotateAnimation = [self createKeyframeAnimationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.values = @[@0, @M_PI, @(2 * M_PI)];
    rotateAnimation.keyTimes = scaleAnimation.keyTimes;
    CAAnimationGroup *animation = [self createAnimationGroup];;
    animation.animations = @[scaleAnimation, rotateAnimation];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = duration;
    animation.repeatCount = HUGE_VALF;
    CAShapeLayer *circle = [CAShapeLayer layer];
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.width / 2, size.height / 2) radius:size.width / 2 startAngle:1.5 * M_PI endAngle:M_PI clockwise:true];
    circle.path = circlePath.CGPath;
    circle.lineWidth = 2;
    circle.fillColor = nil;
    circle.strokeColor = tintColor.CGColor;
    circle.frame = CGRectMake((layer.bounds.size.width - size.width) / 2, (layer.bounds.size.height - size.height) / 2, size.width, size.height);
    [circle addAnimation:animation forKey:@"animation"];
    [layer addSublayer:circle];
}
@end
