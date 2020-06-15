//
//  MIStickerVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "BKMIStickerVC.h"
#import "MIHomeSectionTowCell.h"
#import "MIHomeModel.h"
#import "MIStickerDetailVC.h"
@interface BKMIStickerVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * BKtableView;
@property (nonatomic, strong) NSMutableArray * BKdataArray;
@property (nonatomic, strong) UIImageView * BKpicImageView;
@property (nonatomic, strong) MIHomeModel * BKmodel;
@end

@implementation BKMIStickerVC
- (NSMutableArray *)BKdataArray{
    if (!_BKdataArray) {
        _BKdataArray = @[].mutableCopy;
    }
    return _BKdataArray;
}

- (UITableView *)BKtableView{
    if (!_BKtableView){
        _BKtableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _BKtableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _BKtableView.dataSource = self;
        _BKtableView.delegate = self;
    }
    return _BKtableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.BKtableView];
    self.BKtableView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view)
    .bottomSpaceToView(self.view, 64);
    
    
//    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, (ScreenWidth - 30)/2)];
//    imageView.userInteractionEnabled = YES;
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//    [imageView addGestureRecognizer:tap];
//    self.picImageView = imageView;
//    self.tableView.tableHeaderView = imageView;
    
    [self BKloadData];
    [NotifiCenter addObserver:self selector:@selector(BKupdatePrice) name:@"loginSuccess" object:nil];
    [NotifiCenter addObserver:self selector:@selector(BKloginOut) name:@"loginOut" object:nil];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!self.BKdataArray.count) {
        [self BKloadData];
    }
}
- (void)updatePrice{
    [self BKloadData];
//    [self load]
}

- (void)BKloginOut{
    [self BKloadData];
}

- (void)BKtapAction:(UITapGestureRecognizer *)BKtap{
    MIStickerDetailVC *BKdetailVC = [[MIStickerDetailVC alloc] init];
    BKdetailVC.model = self.BKmodel;
    [self.navigationController pushViewController:BKdetailVC animated:YES];
}
- (void)BKloadData{
    NSDictionary *BKdict;
    if (UserId) {
        BKdict = @{@"type":@(1),@"user_id":UserId};
    }else{
        BKdict = @{@"type":@(1)};
    }
    
    [MIHttpTool Post:PicList parameters:BKdict success:^(id BKresponseObject) {
        if ([BKresponseObject[@"status"] integerValue] == 1) {
            [self.BKdataArray removeAllObjects];
            for (NSInteger BKi = 0; BKi<[BKresponseObject[@"data"] count]; BKi++) {
                NSDictionary *BKdict = BKresponseObject[@"data"][BKi];
                MIHomeModel *BKmodel = [MIHomeModel mj_objectWithKeyValues:BKdict];
                    [self.BKdataArray addObject:BKmodel];
            }
        }
        [self.BKtableView reloadData];
    } failure:^(NSError *error) {
        MyLog(@"%@",error);
    }];
}
#pragma mark --UITableViewdelegate & Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.BKdataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MIHomeSectionTowCell *BKcell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!BKcell) {
        BKcell = [[MIHomeSectionTowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    BKcell.model = self.BKdataArray[indexPath.row];
    return BKcell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MIHomeModel *BKmodel = self.BKdataArray[indexPath.row];
    MIStickerDetailVC * BKdetailVC = [[MIStickerDetailVC alloc] init];
    BKdetailVC.model = BKmodel;
    BKdetailVC.pId = BKmodel.id;
    [self.navigationController pushViewController:BKdetailVC animated:YES];
}

- (void)buyStickersWithFilterModel:(MIHomeModel *)BKmodel{
    UIAlertController *BKalert = [UIAlertController alertControllerWithTitle:@"Prompt" message:@"Determine to buy?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *BKcancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull BKaction) {
    }];
    [BKalert addAction:BKcancel];
    UIAlertAction *BKsure = [UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull BKaction) {
        
//        MIIPAPurchase * maneger =  [MIIPAPurchase manager];
//        //                maneger.order_sn = responseObject[@"order_sn"];
//        [maneger startManager];
//        [maneger buyProductWithProductID:@"" payResult:^(BOOL isSuccess, NSString *certificate, NSString *errorMsg) {
//            if (isSuccess) {
//                [SaveLocalTool saveEventWith:model.id];
//
//                [self.myTableView reloadData];
//            }
//        }];
    }];
    
    
    [BKalert addAction:BKsure];
    [self presentViewController:BKalert animated:YES completion:nil];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  ScreenHeight/2-110;
}
- (void)slideMenuController:(MISlideVC *)slideMenuController didViewDidLoad:(NSInteger)index{
    
    
}

- (void)dealloc{
    [NotifiCenter removeObserver:self];
}


@end
