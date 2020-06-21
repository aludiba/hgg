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
#import "RACSignal+Bm.h"

@interface RACSignal (Bm-Deletecomments)
+ (BOOL)createSignalBm-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)errorBm-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)neverBm-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)startEagerlyWithSchedulerBlockBm-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)startLazilyWithSchedulerBlockBm-Deletecomments:(NSInteger)-deleteComments;
+ (BOOL)descriptionBm-Deletecomments:(NSInteger)-deleteComments;

@end
