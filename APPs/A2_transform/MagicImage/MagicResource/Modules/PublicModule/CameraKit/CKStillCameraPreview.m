#import "CKStillCameraPreview.h"
#define kCameraViewTopBGHeight      70
@interface CKStillCameraPreview()
{
    CGFloat     _lastTwoFingerDistance;
}
@end
@implementation CKStillCameraPreview
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUserInteractionEnabled:YES];
        [self setupGesture];
    }
    return self;
}
- (void)setupGesture
{
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] init];
    [self addGestureRecognizer:pinchGesture];
    _pinchGestureSignal = [pinchGesture rac_gestureSignal];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
    [self addGestureRecognizer:tapGesture];
    _tapGestureSignal = [tapGesture rac_gestureSignal];
    UISwipeGestureRecognizer *swipeRightGesture = [[UISwipeGestureRecognizer alloc] init];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:swipeRightGesture];
    _swipeRightGestureSignal = [swipeRightGesture rac_gestureSignal];
    UISwipeGestureRecognizer *swipeGestureLeft = [[UISwipeGestureRecognizer alloc] init];
    swipeGestureLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:swipeGestureLeft];
    _swipeLeftGestureSignal = [swipeGestureLeft rac_gestureSignal];
}
@end
