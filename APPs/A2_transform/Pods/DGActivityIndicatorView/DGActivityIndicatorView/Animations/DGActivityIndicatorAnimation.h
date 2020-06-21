#import <Foundation/Foundation.h>
#import "DGActivityIndicatorAnimationProtocol.h"
@interface DGActivityIndicatorAnimation : NSObject <DGActivityIndicatorAnimationProtocol>
- (CABasicAnimation *)createBasicAnimationWithKeyPath:(NSString *)keyPath;
- (CAKeyframeAnimation *)createKeyframeAnimationWithKeyPath:(NSString *)keyPath;
- (CAAnimationGroup *)createAnimationGroup;
@end
