#import "RACSubscriptionScheduler.h"
#import "RACScheduler+Private.h"
@interface RACSubscriptionScheduler ()
@property (nonatomic, strong, readonly) RACScheduler *backgroundScheduler;
@end
@implementation RACSubscriptionScheduler
#pragma mark Lifecycle
- (instancetype)init {
	self = [super initWithName:@"org.reactivecocoa.ReactiveObjC.RACScheduler.subscriptionScheduler"];
	_backgroundScheduler = [RACScheduler scheduler];
	return self;
}
#pragma mark RACScheduler
- (RACDisposable *)schedule:(void (^)(void))block {
	NSCParameterAssert(block != NULL);
	if (RACScheduler.currentScheduler == nil) return [self.backgroundScheduler schedule:block];
	block();
	return nil;
}
- (RACDisposable *)after:(NSDate *)date schedule:(void (^)(void))block {
	RACScheduler *scheduler = RACScheduler.currentScheduler ?: self.backgroundScheduler;
	return [scheduler after:date schedule:block];
}
- (RACDisposable *)after:(NSDate *)date repeatingEvery:(NSTimeInterval)interval withLeeway:(NSTimeInterval)leeway schedule:(void (^)(void))block {
	RACScheduler *scheduler = RACScheduler.currentScheduler ?: self.backgroundScheduler;
	return [scheduler after:date repeatingEvery:interval withLeeway:leeway schedule:block];
}
@end
