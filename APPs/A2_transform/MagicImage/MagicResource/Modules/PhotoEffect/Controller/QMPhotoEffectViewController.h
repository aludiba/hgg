#import <UIKit/UIKit.h>
@interface QMPhotoEffectViewController : UIViewController
@property (nonatomic, strong) UIImage *image;
- (instancetype)initWithImage:(UIImage *)image;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy) NSString * resourcePath;
@end
