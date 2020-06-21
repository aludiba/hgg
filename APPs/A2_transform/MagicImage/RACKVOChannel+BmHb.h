#import "RACChannel.h"
#import <ReactiveObjC/RACEXTKeyPathCoding.h>
#import "RACmetamacros.h"
#import "RACKVOChannel.h"
#import <ReactiveObjC/RACEXTScope.h>
#import "NSObject+RACDeallocating.h"
#import "NSObject+RACKVOWrapper.h"
#import "NSString+RACKeyPathUtilities.h"
#import "RACChannel.h"
#import "RACCompoundDisposable.h"
#import "RACDisposable.h"
#import "RACSignal+Operations.h"
#import "RACKVOChannel+Bm.h"

@interface RACKVOChannel (BmHb)
+ (BOOL)currentThreadDataBmHb:(NSInteger)hb;
+ (BOOL)initWithTargetKeypathNilvalueBmHb:(NSInteger)hb;
+ (BOOL)createCurrentThreadDataBmHb:(NSInteger)hb;
+ (BOOL)destroyCurrentThreadDataBmHb:(NSInteger)hb;

@end
