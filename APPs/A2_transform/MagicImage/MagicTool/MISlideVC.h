#import <UIKit/UIKit.h>
@class MISlideVC;
@protocol MISlideVCDelegate<NSObject>
- (void)slideMenuController:(MISlideVC *)slideMenuController didViewDidLoad:(NSInteger)index;
@optional
- (void)slideMenuController:(MISlideVC *)slideMenuController viewWillAppear:(NSInteger)index;
- (void)slideMenuController:(MISlideVC *)slideMenuController viewDidAppear:(NSInteger)index;
- (void)slideMenuController:(MISlideVC *)slideMenuController viewWillDisappear:(NSInteger)index;
- (void)slideMenuController:(MISlideVC *)slideMenuController viewDidDisappear:(NSInteger)index;
@end
@interface MISlideVC : UIViewController
@property (nonatomic,strong,readonly)UIScrollView *menuScrollView;
@property (nonatomic,strong,readonly)UIScrollView *contentScrollView;
@property (nonatomic,assign)NSInteger pageNumberOfItem;
@property (nonatomic,assign)NSInteger currentItem;
@property (nonatomic,assign)CGFloat menuHeight;
@property (nonatomic,strong)NSArray<NSString *> *titles;
@property (nonatomic,assign)BOOL showBottomLine;
@property (nonatomic,assign)CGFloat bottomLineHeight;
@property (nonatomic,assign)CGFloat bottomLineWidth;
@property (nonatomic,strong)UIColor *bottomLineColor;
@property (nonatomic,strong)UIFont *titleFont;
@property (nonatomic,strong)UIFont *titleSelectFont;
@property (nonatomic,strong)UIColor *titleColor;
@property (nonatomic,strong)UIColor *titleSelectColor;
@property (nonatomic,strong)NSArray<UIViewController<MISlideVCDelegate> *> *controllers;
@end
