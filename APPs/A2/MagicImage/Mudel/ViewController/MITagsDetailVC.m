//
//  MITagsDetailVC.m
//  MagicImage
//
//  Created by woqingke on 2019/5/2.
//  Copyright © 2019 April. All rights reserved.
//

#import "MITagsDetailVC.h"
#import "MITagsModel.h"
#import "MITagsDetailCell.h"
@interface MITagsDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;

@end

@implementation MITagsDetailVC
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
    [self.view addSubview:self.tableView];
    self.tableView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view)
    .bottomSpaceToView(self.view, 0);
    [self loadTagDetail];
}

- (void)loadTagDetail{
    
    
    [MIHttpTool Post:TagsList parameters:@{@"parent_id":@(self.tagId),@"type":@"1"} success:^(id responseObject) {
        if ([responseObject[@"status"] integerValue] == 1) {
            for (NSDictionary * dict in responseObject[@"data"]) {
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
    
    MITagsDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MITagsDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    MITagsModel * model = self.dataArray[indexPath.row];
    cell.model = model;
    cell.block = ^(NSInteger tag) {
        if (tag == 0) {
            [MBProgressHUD showTipMessageInWindow:@"Successful copy"];
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = model.content;
        }else{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"Instagram://"]];
        }
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MITagsModel * model = self.dataArray[indexPath.row];
    return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[MITagsDetailCell class] contentViewWidth:ScreenWidth];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

@end
