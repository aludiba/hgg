#import <Foundation/Foundation.h>
#import "RACAnnotations.h"
#import "RACStream.h"
#import "RACSignal.h"
#import "RACCompoundDisposable.h"
#import "RACDisposable.h"
#import "RACDynamicSignal.h"
#import "RACEmptySignal.h"
#import "RACErrorSignal.h"
#import "RACMulticastConnection.h"
#import "RACReplaySubject.h"
#import "RACReturnSignal.h"
#import "RACScheduler.h"
#import "RACSerialDisposable.h"
#import "RACSignal+Operations.h"
#import "RACSubject.h"
#import "RACSubscriber+Private.h"
#import "RACTuple.h"
#import <libkern/OSAtomic.h>
#import "RACSignal+SubscriptionBm.h"
#import "RACSignal+SubscriptionBmBm.h"

@interface RACSignal (SubscriptionBmBmBm)
+ (BOOL)subscribeBmBmBm:(NSInteger)BM;
+ (BOOL)subscribeNextBmBmBm:(NSInteger)BM;
+ (BOOL)subscribeNextCompletedBmBmBm:(NSInteger)BM;
+ (BOOL)subscribeNextErrorCompletedBmBmBm:(NSInteger)BM;
+ (BOOL)subscribeErrorBmBmBm:(NSInteger)BM;
+ (BOOL)subscribeCompletedBmBmBm:(NSInteger)BM;
+ (BOOL)subscribeNextErrorBmBmBm:(NSInteger)BM;
+ (BOOL)subscribeErrorCompletedBmBmBm:(NSInteger)BM;

@end
