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

@interface RACSignal (-Deletecomments)
+ (BOOL)createSignal-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)error-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)never-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)startEagerlyWithSchedulerBlock-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)startLazilyWithSchedulerBlock-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)description-Deletecomments:(NSInteger)-deleteComments;

@end
