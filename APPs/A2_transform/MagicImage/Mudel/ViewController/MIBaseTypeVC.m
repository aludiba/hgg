//
//  MIBaseTypeVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIBaseTypeVC.h"
#import "MISlideVC.h"
#import "MIFilterVC.h"
#import "MIStickerVC.h"
#import "MIUserModel.h"
#import "MIStoreVC.h"
#import "MILoginVC.h"
@interface MIBaseTypeVC ()
@property (nonatomic, strong) MIUserModel * model;
@property (nonatomic, strong) UILabel * coinsLabel;
@end

@implementation MIBaseTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"SHOP";
    MISlideVC * slideMenu = [[MISlideVC alloc] init];
    MIStickerVC * stickerVC = [[MIStickerVC alloc] init];
    MIFilterVC * filterVC = [[MIFilterVC alloc] init];
    slideMenu.showBottomLine = NO;
    slideMenu.titleSelectColor = RGB(62, 85, 250);
    slideMenu.bottomLineColor = RGB(62, 85, 250);
    slideMenu.titles = @[@"Sticker",@"Filter"];
    slideMenu.controllers = @[stickerVC,filterVC];
//    slideMenu.currentItem = self.jumpType;
    [self.view addSubview:slideMenu.view];
    [self addChildViewController:slideMenu];
    if (UserId) {
        [self loadUserInfo];
    }
    [self createCoinsView];
    
    [NotifiCenter addObserver:self selector:@selector(loadUserInfo) name:@"loginSuccess" object:nil];
    [NotifiCenter addObserver:self selector:@selector(loginOut) name:@"loginOut" object:nil];
}

- (void)loginOut{
    self.coinsLabel.text = @"";
}

- (void)createCoinsView{
    
//    UIView * rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 25)];
//    rightView.userInteractionEnabled = YES;
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//    [rightView addGestureRecognizer:tap];
//    rightView.layer.cornerRadius = 5;
//    
//    UILabel * label = [[UILabel alloc] init];
//    label.font = [UIFont boldSystemFontOfSize:13];
//    label.textColor = UIColor.orangeColor;
//    self.coinsLabel = label;
//    [rightView addSubview:label];
//    label.sd_layout
//    .rightSpaceToView(rightView, 5)
//    .centerYEqualToView(rightView)
//    .autoHeightRatio(0);
//    [label setSingleLineAutoResizeWithMaxWidth:80];
//    
//    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yb"]];
//    [rightView addSubview:imageView];
//    imageView.sd_layout
//    .rightSpaceToView(label, 5)
//    .centerYEqualToView(label)
//    .widthIs(20)
//    .heightIs(20);
//    UIBarButtonItem * rigthBtn = [[UIBarButtonItem alloc] initWithCustomView:rightView];
//    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    spaceItem.width = -10;
//    self.navigationItem.rightBarButtonItems = @[spaceItem,rigthBtn];
}
- (void)loadUserInfo{
    [MIHttpTool Post:SHUserDetail parameters:@{@"user_id":UserId} success:^(id responseObject) {
        if ([responseObject[@"status"] integerValue] == 1) {
            MIUserModel * model = [MIUserModel mj_objectWithKeyValues:responseObject[@"data"]];
            self.model = model;
            self.coinsLabel.text = model.peanut_num;
        }
    } failure:^(NSError *error) {
        
    }];
}

- (void)tapAction:(UITapGestureRecognizer *)tap{
    if (!UserId) {
        MILoginVC * logVC = [[MILoginVC alloc] init];
        UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:logVC];
        [self presentViewController:navi animated:YES completion:nil];
        return;
    }
    MIStoreVC * storeVC = [[MIStoreVC alloc] init];
    [self.navigationController pushViewController:storeVC animated:YES];
    
}
- (void)dealloc{
    [NotifiCenter removeObserver:self];
}
@end
