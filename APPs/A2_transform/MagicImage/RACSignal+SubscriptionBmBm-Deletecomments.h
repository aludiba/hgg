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

@interface RACSignal (SubscriptionBmBm-Deletecomments)
+ (BOOL)subscribeBmBm-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)subscribeNextBmBm-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)subscribeNextCompletedBmBm-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)subscribeNextErrorCompletedBmBm-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)subscribeErrorBmBm-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)subscribeCompletedBmBm-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)subscribeNextErrorBmBm-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)subscribeErrorCompletedBmBm-Deletecomments:(NSInteger)-deleteComments;

@end
