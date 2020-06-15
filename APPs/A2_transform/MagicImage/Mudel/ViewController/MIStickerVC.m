//
//  MIStickerVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIStickerVC.h"
#import "MIHomeSectionTowCell.h"
#import "MIHomeModel.h"
#import "MIStickerDetailVC.h"
@interface MIStickerVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) UIImageView * picImageView;
@property (nonatomic, strong) MIHomeModel * model;
@end

@implementation MIStickerVC
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}

- (UITableView *)tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableView.sd_layout
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
    
    [self loadData];
    [NotifiCenter addObserver:self selector:@selector(updatePrice) name:@"loginSuccess" object:nil];
    [NotifiCenter addObserver:self selector:@selector(loginOut) name:@"loginOut" object:nil];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!self.dataArray.count) {
        [self loadData];
    }
}
- (void)updatePrice{
    [self loadData];
//    [self load]
}

- (void)loginOut{
    [self loadData];
}

- (void)tapAction:(UITapGestureRecognizer *)tap{
    MIStickerDetailVC * detailVC = [[MIStickerDetailVC alloc] init];
    detailVC.model = self.model;
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (void)loadData{
    NSDictionary * dict;
    if (UserId) {
        dict = @{@"type":@(1),@"user_id":UserId};
    }else{
        dict = @{@"type":@(1)};
    }
    
    [MIHttpTool Post:PicList parameters:dict success:^(id responseObject) {
        if ([responseObject[@"status"] integerValue] == 1) {
            [self.dataArray removeAllObjects];
            for (NSInteger i = 0; i<[responseObject[@"data"] count]; i++) {
                NSDictionary * dict = responseObject[@"data"][i];
                MIHomeModel * model = [MIHomeModel mj_objectWithKeyValues:dict];
                    [self.dataArray addObject:model];
            }
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        MyLog(@"%@",error);
    }];
}
#pragma mark --UITableViewdelegate & Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MIHomeSectionTowCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MIHomeSectionTowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MIHomeModel * model = self.dataArray[indexPath.row];
    MIStickerDetailVC * detailVC = [[MIStickerDetailVC alloc] init];
    MyLog(@"%@",model.pic_url_c);
    MyLog(@"%@",model.id);
    detailVC.model = model;
    detailVC.pId = model.id;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)buyStickersWithFilterModel:(MIHomeModel *)model{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Prompt" message:@"Determine to buy?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:cancel];
    UIAlertAction * sure = [UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
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
    
    
    [alert addAction:sure];
    [self presentViewController:alert animated:YES completion:nil];
    
    
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
