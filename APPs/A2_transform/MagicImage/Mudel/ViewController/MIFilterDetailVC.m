//
//  MIFilterDetailVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/5/1.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIFilterDetailVC.h"
#import "MIFilterDetialCell.h"
#import "MIHomeModel.h"
#import "QMPhotoEffectViewController.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface MIFilterDetailVC ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;

@end

@implementation MIFilterDetailVC
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
    self.title = self.model.title;
    [self.view addSubview:self.tableView];
    self.tableView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view)
    .bottomSpaceToView(self.view, 0);

    UIView * bottomView = [[UIView alloc] init];
    [self.view addSubview:bottomView];
    bottomView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomSpaceToView(self.view, 10)
    .heightIs(50);
    
    UIButton * buyBtn = [[UIButton alloc] init];
    [buyBtn setTitle:@"Apply" forState:UIControlStateNormal];
    [buyBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    buyBtn.layer.cornerRadius = 8;
    buyBtn.layer.masksToBounds = YES;
    buyBtn.backgroundColor = RGB(62, 85, 250);
    [buyBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:buyBtn];
    buyBtn.sd_layout
    .leftSpaceToView(bottomView, 15)
    .rightSpaceToView(bottomView, 15)
    .centerYEqualToView(bottomView)
    .heightIs(45);
    
     [self loadData];
    
}

- (void)btnClicked:(UIButton *)sender{
    [self canUsePhoto];
}
- (void)canUsePhoto{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted) { // 此应用程序没有被授权访问的照片数据。可能是家长控制权限。
        NSLog(@"因为系统原因, 无法访问相册");
        
    } else if (status == PHAuthorizationStatusDenied) { // 用户拒绝访问相册
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Caveat" message:@"Please go to -> [Settings - Privacy - Camera - Project Name] Open the access switch" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Setting", nil];
        [alertView show];
        
    } else if (status == PHAuthorizationStatusAuthorized) { // 用户允许访问相册
        // 放一些使用相册的代码
        UIImagePickerController *vc = [[UIImagePickerController alloc] init];
        vc.delegate = self;
        vc.allowsEditing = YES;
        vc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:vc animated:YES completion:nil];
    } else if (status == PHAuthorizationStatusNotDetermined) { // 用户还没有做出选择
        // 弹框请求用户授权
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) { // 用户点击了好
                // 放一些使用相册的代码
                UIImagePickerController *vc = [[UIImagePickerController alloc] init];
                vc.delegate = self;
                vc.allowsEditing = YES;
                vc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:vc animated:YES completion:nil];
            }
        }];
    }
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        // 系统是否大于10
        NSURL *url = nil;
        url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:url];
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSURL *url = [info objectForKey:UIImagePickerControllerReferenceURL];
    
    //导入 #import <AssetsLibrary/AssetsLibrary.h> 库
    //创建 ALAssetsLibrary 对象
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc]init];
    [library assetForURL:url resultBlock:^(ALAsset *asset){
        //获取图片
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        //获取照片名称
        QMPhotoEffectViewController * cmVC = [[QMPhotoEffectViewController alloc] initWithImage:image];
        cmVC.type = 3;
        [self presentViewController:cmVC animated:YES completion:nil];
        
    }failureBlock:^(NSError *error){
        
        //        [NSObject alertShowWithSingleTipWithtarget:self title:@"获取相册失败" makeSureClick:nil];
        
    }];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)loadData{
    
    [MIHttpTool Post:PicList parameters:@{@"type":@(2),@"id":self.pid} success:^(id responseObject) {
        if ([responseObject[@"status"] integerValue] == 1) {
//            for (NSInteger i = 0; i<[responseObject[@"data"] count]; i++) {
                NSDictionary * dict = responseObject[@"data"][0];
                MIHomeModel * model = [MIHomeModel mj_objectWithKeyValues:dict];
                [self.dataArray addObjectsFromArray:model.pic_url_detail_array];
//            }
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
//    return nil;
    MIFilterDetialCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MIFilterDetialCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.imageUrl = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ScreenHeight*3/4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView * )tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

@end
