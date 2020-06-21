#import <UIKit/UIKit.h>
#import "UIBarButtonItem+RACCommandSupport.h"
#import <ReactiveObjC/RACEXTKeyPathCoding.h>
#import "RACCommand.h"
#import "RACDisposable.h"
#import "RACSignal+Operations.h"
#import <objc/runtime.h>

@interface UIBarButtonItem (RACCommandSupportHb)
+ (BOOL)rac_commandHb:(NSInteger)hb;
+ (BOOL)setRac_commandHb:(NSInteger)hb;
+ (BOOL)rac_hijackActionAndTargetIfNeededHb:(NSInteger)hb;
+ (BOOL)rac_commandPerformActionHb:(NSInteger)hb;

@end