#import <UIKit/UIKit.h>
@class RACDelegateProxy;
@class RACSignal<__covariant ValueType>;
NS_ASSUME_NONNULL_BEGIN
@interface UITextView (RACSignalSupport)
@property (nonatomic, strong, readonly) RACDelegateProxy *rac_delegateProxy;
- (RACSignal<NSString *> *)rac_textSignal;
@end
NS_ASSUME_NONNULL_END
