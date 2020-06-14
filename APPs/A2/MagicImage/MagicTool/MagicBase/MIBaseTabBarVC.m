//
//  MIBaseTabBarVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIBaseTabBarVC.h"
#import "MIBaseNavigationC.h"
#import "MIHomeVC.h"
#import "MIMoreVC.h"
@interface MIBaseTabBarVC ()
@property(strong,nonatomic)NSMutableArray *childArray;



@property(strong,nonatomic)NSMutableArray *tabBarButtonArray;
@end

@implementation MIBaseTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.backgroundColor=[UIColor whiteColor];
    self.childArray=[NSMutableArray array];
    self.tabBarButtonArray=[NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews){
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [self.tabBarButtonArray addObject:tabBarButton];
        }
    }
    
    [self initWithChildController];
}

- (void)initWithChildController{
    
    
    MIHomeVC * homeVC = [[MIHomeVC alloc] init];
    [homeVC.tabBarItem setTitle:@"Home"];
    [homeVC.tabBarItem setImage:[UIImage imageNamed:@"PEHome"]];
    [homeVC.tabBarItem setSelectedImage:[[UIImage imageNamed:@"PEHome_s"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    MIBaseNavigationC  *homeNV = [[MIBaseNavigationC alloc] initWithRootViewController:homeVC];
    [homeNV.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [self.childArray addObject:homeNV];
    
   
    
    MIMoreVC * moreVC = [[MIMoreVC alloc] init];
    [moreVC.tabBarItem setTitle:@"More"];
    [moreVC.tabBarItem setImage:[UIImage imageNamed:@"PEMore"]];
    [moreVC.tabBarItem setSelectedImage:[[UIImage imageNamed:@"PEMore_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    MIBaseNavigationC *moreNV = [[MIBaseNavigationC alloc] initWithRootViewController:moreVC];
    [moreNV.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [self.childArray addObject:moreNV];
    
    [self setViewControllers:self.childArray];
}

@end
