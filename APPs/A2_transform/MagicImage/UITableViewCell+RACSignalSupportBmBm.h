#import <UIKit/UIKit.h>
#import "UITableViewCell+RACSignalSupport.h"
#import "NSObject+RACDescription.h"
#import "NSObject+RACSelectorSignal.h"
#import "RACSignal+Operations.h"
#import "RACUnit.h"
#import <objc/runtime.h>
#import "UITableViewCell+RACSignalSupportBm.h"

@interface UITableViewCell (RACSignalSupportBmBm)
+ (BOOL)rac_prepareForReuseSignalBmBm:(NSInteger)BM;

@end