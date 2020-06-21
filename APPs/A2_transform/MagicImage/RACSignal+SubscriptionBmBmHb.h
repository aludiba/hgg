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

@interface RACSignal (SubscriptionBmBmHb)
+ (BOOL)subscribeBmBmHb:(NSInteger)hb;
+ (BOOL)subscribeNextBmBmHb:(NSInteger)hb;
+ (BOOL)subscribeNextCompletedBmBmHb:(NSInteger)hb;
+ (BOOL)subscribeNextErrorCompletedBmBmHb:(NSInteger)hb;
+ (BOOL)subscribeErrorBmBmHb:(NSInteger)hb;
+ (BOOL)subscribeCompletedBmBmHb:(NSInteger)hb;
+ (BOOL)subscribeNextErrorBmBmHb:(NSInteger)hb;
+ (BOOL)subscribeErrorCompletedBmBmHb:(NSInteger)hb;

@end