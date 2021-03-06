#import "RACSerialDisposable.h"
#import <pthread/pthread.h>
@interface RACSerialDisposable () {
	RACDisposable * _disposable;
	BOOL _disposed;
	pthread_mutex_t _mutex;
}
@end
@implementation RACSerialDisposable
#pragma mark Properties
- (BOOL)isDisposed {
	pthread_mutex_lock(&_mutex);
	const BOOL disposed = _disposed;
	pthread_mutex_unlock(&_mutex);
	return disposed;
}
- (RACDisposable *)disposable {
	pthread_mutex_lock(&_mutex);
	RACDisposable * const result = _disposable;
	pthread_mutex_unlock(&_mutex);
	return result;
}
- (void)setDisposable:(RACDisposable *)disposable {
	[self swapInDisposable:disposable];
}
#pragma mark Lifecycle
+ (instancetype)serialDisposableWithDisposable:(RACDisposable *)disposable {
	RACSerialDisposable *serialDisposable = [[self alloc] init];
	serialDisposable.disposable = disposable;
	return serialDisposable;
}
- (instancetype)init {
	self = [super init];
	if (self == nil) return nil;
	const int result __attribute__((unused)) = pthread_mutex_init(&_mutex, NULL);
	NSCAssert(0 == result, @"Failed to initialize mutex with error %d", result);
	return self;
}
- (instancetype)initWithBlock:(void (^)(void))block {
	self = [self init];
	if (self == nil) return nil;
	self.disposable = [RACDisposable disposableWithBlock:block];
	return self;
}
- (void)dealloc {
	const int result __attribute__((unused)) = pthread_mutex_destroy(&_mutex);
	NSCAssert(0 == result, @"Failed to destroy mutex with error %d", result);
}
#pragma mark Inner Disposable
- (RACDisposable *)swapInDisposable:(RACDisposable *)newDisposable {
	RACDisposable *existingDisposable;
	BOOL alreadyDisposed;
	pthread_mutex_lock(&_mutex);
	alreadyDisposed = _disposed;
	if (!alreadyDisposed) {
		existingDisposable = _disposable;
		_disposable = newDisposable;
	}
	pthread_mutex_unlock(&_mutex);
	if (alreadyDisposed) {
		[newDisposable dispose];
		return nil;
	}
	return existingDisposable;
}
#pragma mark Disposal
- (void)dispose {
	RACDisposable *existingDisposable;
	pthread_mutex_lock(&_mutex);
	if (!_disposed) {
		existingDisposable = _disposable;
		_disposed = YES;
		_disposable = nil;
	}
	pthread_mutex_unlock(&_mutex);
	[existingDisposable dispose];
}
@end
