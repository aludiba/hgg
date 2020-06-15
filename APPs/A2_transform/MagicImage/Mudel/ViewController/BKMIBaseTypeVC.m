//
//  MIBaseTypeVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "BKMIBaseTypeVC.h"
#import "MISlideVC.h"
#import "MIFilterVC.h"
#import "BKMIStickerVC.h"
#import "MIUserModel.h"
#import "BKMIStoreVC.h"
#import "BKMILoginVC.h"
@interface BKMIBaseTypeVC ()
@property (nonatomic, strong) MIUserModel *BKmodel;
@property (nonatomic, strong) UILabel *BKcoinsLabel;
@end

@implementation BKMIBaseTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"SHOP";
    MISlideVC *BKslideMenu = [[MISlideVC alloc] init];
    BKMIStickerVC *BKstickerVC = [[BKMIStickerVC alloc] init];
    MIFilterVC *BKfilterVC = [[MIFilterVC alloc] init];
    BKslideMenu.showBottomLine = NO;
    BKslideMenu.titleSelectColor = RGB(62, 85, 250);
    BKslideMenu.bottomLineColor = RGB(62, 85, 250);
    BKslideMenu.titles = @[@"Sticker",@"Filter"];
    BKslideMenu.controllers = @[BKstickerVC,BKfilterVC];
//    slideMenu.currentItem = self.jumpType;
    [self.view addSubview:BKslideMenu.view];
    [self addChildViewController:BKslideMenu];
    if (UserId) {
        [self BKloadUserInfo];
    }
    [self BKcreateCoinsView];
    
    [NotifiCenter addObserver:self selector:@selector(BKloadUserInfo) name:@"loginSuccess" object:nil];
    [NotifiCenter addObserver:self selector:@selector(BKloginOut) name:@"loginOut" object:nil];
}

- (void)BKloginOut{
    self.BKcoinsLabel.text = @"";
}

- (void)BKcreateCoinsView{
    
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
- (void)BKloadUserInfo{
    [MIHttpTool Post:SHUserDetail parameters:@{@"user_id":UserId} success:^(id responseObject) {
        if ([responseObject[@"status"] integerValue] == 1) {
            MIUserModel *BKmodel = [MIUserModel mj_objectWithKeyValues:responseObject[@"data"]];
            self.BKmodel = BKmodel;
            self.BKcoinsLabel.text = BKmodel.peanut_num;
        }
    } failure:^(NSError *error) {
        
    }];
}

- (void)BKtapAction:(UITapGestureRecognizer *)BKtap{
    if (!UserId) {
        BKMILoginVC *BKlogVC = [[BKMILoginVC alloc] init];
        UINavigationController *BKnavi = [[UINavigationController alloc] initWithRootViewController:BKlogVC];
        [self presentViewController:BKnavi animated:YES completion:nil];
        return;
    }
    BKMIStoreVC *BKstoreVC = [[BKMIStoreVC alloc] init];
    [self.navigationController pushViewController:BKstoreVC animated:YES];
    
}
- (void)dealloc{
    [NotifiCenter removeObserver:self];
}
@end
