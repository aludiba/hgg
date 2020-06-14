//
//  MITagsVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/5/1.
//  Copyright © 2019 April. All rights reserved.
//

#import "MITagsVC.h"
#import "MITagsCell.h"
#import "MITagsModel.h"
#import "MITagsDetailVC.h"
@interface MITagsVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;

@end

@implementation MITagsVC
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
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"Hot Tags";
    self.tableView.backgroundColor = UIColor.groupTableViewBackgroundColor;
    [self.view addSubview:self.tableView];
    self.tableView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view)
    .bottomSpaceToView(self.view, 0);

    // Do any additional setup after loading the view.
    [self loadData];
}


- (void)loadData{
    [MIHttpTool Post:SHTagsList parameters:@{@"type":@"1"} success:^(id responseObject) {
        if ([responseObject[@"status"] integerValue] == 1) {
            [self.dataArray removeAllObjects];
            for (NSInteger i = [responseObject[@"data"] count]-1; i>=0; i--) {
                NSDictionary * dict = responseObject[@"data"][i];
                MITagsModel * model = [MITagsModel mj_objectWithKeyValues:dict];
                [self.dataArray addObject:model];
            }
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MITagsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MITagsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MITagsModel * model = self.dataArray[indexPath.row];
    MITagsDetailVC * detailVC = [[MITagsDetailVC alloc] init];
    detailVC.tagId = model.id.integerValue;
    detailVC.title = model.title;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
@end
