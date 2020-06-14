//
//  MIStoreVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIStoreVC.h"
#import "MIUserModel.h"
#import "MICoinsModel.h"
#import "MICoinsCell.h"
#import "MIIPAPurchase.h"
//#import ""
@interface MIStoreVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) UILabel * coinsLabel;
@end

@implementation MIStoreVC
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Recharge";
    self.view.backgroundColor = UIColor.whiteColor;
    self.tableView.backgroundColor = UIColor.groupTableViewBackgroundColor;
     [self.view addSubview:self.tableView];
    self.tableView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view)
    .bottomEqualToView(self.view);
    [self loadData];
    
    
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50)];
    headerView.backgroundColor = UIColor.whiteColor;
    
    UILabel * textLabel = [[UILabel alloc] init];
    textLabel.text = @"Current account:";
    textLabel.font = [UIFont systemFontOfSize:15];
    textLabel.textColor = UIColor.blackColor;
    [headerView addSubview:textLabel];
    textLabel.sd_layout
    .leftSpaceToView(headerView, 15)
    .centerYEqualToView(headerView)
    .autoHeightRatio(0);
    [textLabel setSingleLineAutoResizeWithMaxWidth:180];
    
    UILabel * coinsLabel = [[UILabel alloc] init];
    self.coinsLabel = coinsLabel;
    coinsLabel.textColor = UIColor.orangeColor;
    coinsLabel.font = [UIFont systemFontOfSize:15];
    [headerView addSubview:coinsLabel];
    coinsLabel.sd_layout
    .leftSpaceToView(textLabel, 2)
    .centerYEqualToView(textLabel)
    .autoHeightRatio(0);
    [coinsLabel setSingleLineAutoResizeWithMaxWidth:180];
    
    self.tableView.tableHeaderView = headerView;
    
    
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 90)];
    footerView.userInteractionEnabled = YES;
    
    UILabel * TermsOfServiceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 25)];
    TermsOfServiceLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(contactUs:)];
    TermsOfServiceLabel.textAlignment = NSTextAlignmentCenter;
    TermsOfServiceLabel.textColor = UIColor.orangeColor;
    TermsOfServiceLabel.font = [UIFont systemFontOfSize:13];
    TermsOfServiceLabel.text = @"Terms of service";
    TermsOfServiceLabel.tag = 102;
    [TermsOfServiceLabel addGestureRecognizer:tap2];
    [footerView addSubview:TermsOfServiceLabel];
    
    UILabel * privacyPolicyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, ScreenWidth, 25)];
    UITapGestureRecognizer * tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(contactUs:)];
    privacyPolicyLabel.userInteractionEnabled = YES;
    privacyPolicyLabel.textAlignment = NSTextAlignmentCenter;
    privacyPolicyLabel.textColor = UIColor.orangeColor;
    privacyPolicyLabel.font = [UIFont systemFontOfSize:13];
    privacyPolicyLabel.text = @"Privacy policy";
    privacyPolicyLabel.tag = 103;
    [privacyPolicyLabel addGestureRecognizer:tap3];
    [footerView addSubview:privacyPolicyLabel];
    
    
    self.tableView.tableFooterView = footerView;
    
    [self loadUserData];
}
- (void)contactUs:(UITapGestureRecognizer *)tap{
    if (tap.view.tag == 101) {
        //        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto://%@",self.model.contact_us_eamil]]];
    }else if (tap.view.tag == 102){
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/index/newp.picphotopicda2a/termsDetail",LSBaseUrl]]];
        
        
    }else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/index/newp.picphotopicda2a/privacyDetail",LSBaseUrl]]];
        
    }
    
}

- (void)loadData{
    NSArray * array = @[
                        @{@"goods_id":@"1",@"goods_price":@"0.99",@"goods_num":@"100",@"is_hot":@(1),@"remark":@"65% off",@"product_id":@"com.picphotopicda2a.ua099"},
                        @{@"goods_id":@"3",@"goods_price":@"2.99",@"goods_num":@"400",@"is_hot":@(1),@"remark":@"40% off",@"product_id":@"com.picphotopicda2a.ua299"},
                        @{@"goods_id":@"4",@"goods_price":@"4.99",@"goods_num":@"700",@"is_hot":@(1),@"remark":@"50% off",@"product_id":@"com.picphotopicda2a.ua499"},
                        @{@"goods_id":@"5",@"goods_price":@"9.99",@"goods_num":@"2000",@"is_hot":@(1),@"remark":@"70% off",@"product_id":@"com.picphotopicda2a.ua999"},
                        @{@"goods_id":@"2",@"goods_price":@"13.99",@"goods_num":@"3000",@"is_hot":@(1),@"remark":@"20% off",@"product_id":@"com.picphotopicda2a.ua1399"},
                        @{@"goods_id":@"6",@"goods_price":@"19.99",@"goods_num":@"5000",@"is_hot":@(1),@"remark":@"75% off",@"product_id":@"com.picphotopicda2a.ua1999"},
                        @{@"goods_id":@"7",@"goods_price":@"49.99",@"goods_num":@"15000",@"is_hot":@(1),@"remark":@"80% off",@"product_id":@"com.picphotopicda2a.ua4999"}];
    for (NSDictionary * dict in array) {
        MICoinsModel  * model = [MICoinsModel mj_objectWithKeyValues:dict];
        [self.dataArray addObject:model];
    }
    [self.tableView reloadData];
}

- (void)loadUserData{
    
    [MIHttpTool Post:SHUserDetail parameters:@{@"user_id":UserId} success:^(id responseObject) {
        if ([responseObject[@"status"] integerValue] == 1) {
            MIUserModel * model = [MIUserModel mj_objectWithKeyValues:responseObject[@"data"]];
            self.coinsLabel.text = model.peanut_num;
        }
    } failure:^(NSError *error) {
        
    }];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MICoinsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[MICoinsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.backgroundColor = UIColor.clearColor;
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    if (![SHUserDefaults objectForKey:@"user_id"]) {
//        ScLoginViewController * scLoginVc = [[ScLoginViewController alloc] init];
//        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:scLoginVc];
//        [self presentViewController:nav animated:YES completion:nil];
//        return;
//    }
    
    [MBProgressHUD showActivityMessageInWindow:@"Loading....."];
    MICoinsModel * model = self.dataArray[indexPath.row];
    
    MIIPAPurchase * maneger =  [MIIPAPurchase manager];
    //                maneger.order_sn = responseObject[@"order_sn"];
    [maneger startManager];
    [maneger buyProductWithProductID:model.product_id payResult:^(BOOL isSuccess, NSString *certificate, NSString *errorMsg) {
        MyLog(@"%@",errorMsg);
        if (isSuccess) {
            
            [MIHttpTool Post:AddUserPeanut parameters:@{@"peanut_num":[NSString stringWithFormat:@"%ld",model.goods_num],@"type":@"3",@"object_id":model.product_id,@"user_id":UserId} success:^(id responseObject) {
                [MBProgressHUD showTipMessageInWindow:responseObject[@"msg"]];
                if ([responseObject[@"status"] integerValue] == 1) {
                    //购买成功
                    [self loadUserData];
                    [NotifiCenter postNotificationName:@"loginSuccess" object:nil];
                    [self.navigationController popViewControllerAnimated:YES];
                    
                }else if ([responseObject[@"status"] integerValue] == -200){
                    //金币不足
                    
                }else{
                    
                    
                }
            } failure:^(NSError *error) {
                
            }];
        }
        [MBProgressHUD hideHUD];
    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

@end
