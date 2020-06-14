//
//  MIFilterVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIFilterVC.h"
#import "MIFilterCell.h"
#import "MIHomeModel.h"
#import "MIFilterDetailVC.h"
@interface MIFilterVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;

@end

@implementation MIFilterVC

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
    
    [self.view addSubview:self.tableView];
    self.tableView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view)
    .bottomSpaceToView(self.view, 64);
    [self loadData];
    
}

- (void)loadData{
    
    [MIHttpTool Post:PicList parameters:@{@"type":@(2)} success:^(id responseObject) {
        if ([responseObject[@"status"] integerValue] == 1) {
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MIFilterCell * cell  = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MIFilterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.model = self.dataArray[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return ScreenHeight/2-110;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MIFilterDetailVC * filterVC = [[MIFilterDetailVC alloc] init];
    MIHomeModel * model = self.dataArray[indexPath.row];
    filterVC.model = model;
    filterVC.pid = model.id;
    [self.navigationController pushViewController:filterVC animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

- (void)slideMenuController:(MISlideVC *)slideMenuController didViewDidLoad:(NSInteger)index{
    
    
}

@end
