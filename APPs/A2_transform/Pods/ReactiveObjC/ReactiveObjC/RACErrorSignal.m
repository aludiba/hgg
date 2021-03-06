#import "RACErrorSignal.h"
#import "RACScheduler+Private.h"
#import "RACSubscriber.h"
@interface RACErrorSignal ()
@property (nonatomic, strong, readonly) NSError *error;
@end
@implementation RACErrorSignal
#pragma mark Lifecycle
+ (RACSignal *)error:(NSError *)error {
	RACErrorSignal *signal = [[self alloc] init];
	signal->_error = error;
#ifdef DEBUG
	[signal setNameWithFormat:@"+error: %@", error];
#else
	signal.name = @"+error:";
#endif
	return signal;
}
#pragma mark Subscription
- (RACDisposable *)subscribe:(id<RACSubscriber>)subscriber {
	NSCParameterAssert(subscriber != nil);
	return [RACScheduler.subscriptionScheduler schedule:^{
		[subscriber sendError:self.error];
	}];
}
@end
