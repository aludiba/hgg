#import <Foundation/Foundation.h>
#import "NSObject+RACKVOWrapper.h"
#import <ReactiveObjC/RACEXTRuntimeExtensions.h>
#import <ReactiveObjC/RACEXTScope.h>
#import "NSObject+RACDeallocating.h"
#import "NSString+RACKeyPathUtilities.h"
#import "RACCompoundDisposable.h"
#import "RACDisposable.h"
#import "RACKVOTrampoline.h"
#import "RACSerialDisposable.h"

@interface NSObject (RACKVOWrapperBm)
+ (BOOL)rac_observeKeyPathOptionsObserverBlockBm:(NSInteger)BM;

@end
