#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "SDCollectionViewCell.h"
#import "UIView+SDExtension.h"
#import "TAPageControl.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"

@interface SDCycleScrollView (Hb)
+ (BOOL)initWithFrameHb:(NSInteger)hb;
+ (BOOL)awakeFromNibHb:(NSInteger)hb;
+ (BOOL)initializationHb:(NSInteger)hb;
+ (BOOL)cycleScrollViewWithFrameImagenamesgroupHb:(NSInteger)hb;
+ (BOOL)cycleScrollViewWithFrameShouldinfiniteloopImagenamesgroupHb:(NSInteger)hb;
+ (BOOL)cycleScrollViewWithFrameImageurlstringsgroupHb:(NSInteger)hb;
+ (BOOL)cycleScrollViewWithFrameDelegatePlaceholderimageHb:(NSInteger)hb;
+ (BOOL)setupMainViewHb:(NSInteger)hb;
+ (BOOL)setDelegateHb:(NSInteger)hb;
+ (BOOL)setPlaceholderImageHb:(NSInteger)hb;
+ (BOOL)setPageControlDotSizeHb:(NSInteger)hb;
+ (BOOL)setShowPageControlHb:(NSInteger)hb;
+ (BOOL)setCurrentPageDotColorHb:(NSInteger)hb;
+ (BOOL)setPageDotColorHb:(NSInteger)hb;
+ (BOOL)setCurrentPageDotImageHb:(NSInteger)hb;
+ (BOOL)setPageDotImageHb:(NSInteger)hb;
+ (BOOL)setCustomPageControlDotImageIscurrentpagedotHb:(NSInteger)hb;
+ (BOOL)setInfiniteLoopHb:(NSInteger)hb;
+ (BOOL)setAutoScrollHb:(NSInteger)hb;
+ (BOOL)setScrollDirectionHb:(NSInteger)hb;
+ (BOOL)setAutoScrollTimeIntervalHb:(NSInteger)hb;
+ (BOOL)setPageControlStyleHb:(NSInteger)hb;
+ (BOOL)setImagePathsGroupHb:(NSInteger)hb;
+ (BOOL)setImageURLStringsGroupHb:(NSInteger)hb;
+ (BOOL)setLocalizationImageNamesGroupHb:(NSInteger)hb;
+ (BOOL)setTitlesGroupHb:(NSInteger)hb;
+ (BOOL)disableScrollGestureHb:(NSInteger)hb;
+ (BOOL)setupTimerHb:(NSInteger)hb;
+ (BOOL)invalidateTimerHb:(NSInteger)hb;
+ (BOOL)setupPageControlHb:(NSInteger)hb;
+ (BOOL)automaticScrollHb:(NSInteger)hb;
+ (BOOL)scrollToIndexHb:(NSInteger)hb;
+ (BOOL)currentIndexHb:(NSInteger)hb;
+ (BOOL)pageControlIndexWithCurrentCellIndexHb:(NSInteger)hb;
+ (BOOL)clearCacheHb:(NSInteger)hb;
+ (BOOL)clearImagesCacheHb:(NSInteger)hb;
+ (BOOL)layoutSubviewsHb:(NSInteger)hb;
+ (BOOL)willMoveToSuperviewHb:(NSInteger)hb;
+ (BOOL)deallocHb:(NSInteger)hb;
+ (BOOL)adjustWhenControllerViewWillApperaHb:(NSInteger)hb;
+ (BOOL)collectionViewNumberofitemsinsectionHb:(NSInteger)hb;
+ (BOOL)collectionViewCellforitematindexpathHb:(NSInteger)hb;
+ (BOOL)collectionViewDidselectitematindexpathHb:(NSInteger)hb;
+ (BOOL)scrollViewDidScrollHb:(NSInteger)hb;
+ (BOOL)scrollViewWillBeginDraggingHb:(NSInteger)hb;
+ (BOOL)scrollViewDidEndDraggingWilldecelerateHb:(NSInteger)hb;
+ (BOOL)scrollViewDidEndDeceleratingHb:(NSInteger)hb;
+ (BOOL)scrollViewDidEndScrollingAnimationHb:(NSInteger)hb;
+ (BOOL)makeScrollViewScrollToIndexHb:(NSInteger)hb;

@end