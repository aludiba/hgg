#import <UIKit/UIKit.h>
#import "MJRefreshConst.h"
#import "UIScrollView+MJRefresh.h"
#import "MJRefreshHeader.h"
#import "MJRefreshFooter.h"
#import <objc/runtime.h>
#import "UICollectionView+MJRefreshBm.h"

@interface UICollectionView (MJRefreshBmBm)
+ (BOOL)loadBmBm:(NSInteger)BM;
+ (BOOL)mj_reloadDataBmBm:(NSInteger)BM;

@end
