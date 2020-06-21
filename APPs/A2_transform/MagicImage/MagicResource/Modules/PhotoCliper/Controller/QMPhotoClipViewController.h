#import <UIKit/UIKit.h>
@interface QMPhotoClipViewController : UIViewController
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) void(^completionBlock)(UIImage *image, CGSize size, CGFloat rotate);
@end
