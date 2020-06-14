//
//  MIHomeVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/29.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIHomeVC.h"
#import "MIHomeView.h"
#import "QMBaseNavigationController.h"
#import "QMCameraViewController.h"

#import "MIHomeSectionOneCell.h"
#import "MIHomeSectionTowCell.h"
#import "SDCycleScrollView.h"
#import "MIHomeHeaderView.h"
#import "MIHomeModel.h"
#import "MIBaseTypeVC.h"
#import "QMPhotoEffectViewController.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "MIStickerDetailVC.h"
#import "MITagsVC.h"
#import "MIFilterDetailVC.h"
@interface MIHomeVC ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) SDCycleScrollView * bannerView;
@property (nonatomic, strong) NSArray * bannerImageArr;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSMutableArray * bannaerArray;
@end

@implementation MIHomeVC
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}

- (NSMutableArray *)bannaerArray{
    if (!_bannaerArray) {
        _bannaerArray = @[].mutableCopy;
    }
    return _bannaerArray;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.view addSubview:self.tableView];
    self.tableView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view).offset(-StatusBarHeight)
    .bottomEqualToView(self.view);
     self.bannerImageArr = @[@"http://api.ip2.club/static/pic/sticker/3/0.png",@"http://api.ip2.club/static/pic/filter/Sweet.png",@"http://api.ip2.club/static/pic/sticker/7/0.png"];
    
    [self loadData];
    
//    MIHomeView * homeView = [[MIHomeView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth)];
//    homeView.block = ^(NSInteger tag) {
//        if (tag == 0) {
//            QMCameraViewController * cmVC = [[QMCameraViewController alloc] init];
//            QMBaseNavigationController * navi = [[QMBaseNavigationController alloc] initWithRootViewController:cmVC];
//            [self presentViewController:navi animated:YES completion:nil];
//        }else if (tag == 1){
//
//        }else if (tag == 2){
//
//        }else{
//
//        }
//    };
//    [self.view addSubview:homeView];
//    homeView.sd_layout
//    .topSpaceToView(self.view, 90)
//    .centerYEqualToView(self.view)
//    .widthIs(ScreenWidth)
//    .heightIs(ScreenWidth);
    
    [self createHeaderView];
    [NotifiCenter addObserver:self selector:@selector(loadData) name:@"loginSuccess" object:nil];
    [NotifiCenter addObserver:self selector:@selector(loginOut) name:@"loginOut" object:nil];
    
}
- (void)loginOut{
    [self loadData];
}
//- (void)loginSuccess
- (void)createHeaderView{
    
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight/2-60)];
    bgView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:bgView];
    self.tableView.tableHeaderView = bgView;

    UIView * colorView = [[UIView alloc] init];
    colorView.backgroundColor = RGB(62, 85, 250);
    [bgView addSubview:colorView];
    
    colorView.sd_layout
    .leftEqualToView(bgView)
    .rightEqualToView(bgView)
    .topEqualToView(bgView)
    .bottomSpaceToView(bgView, 5);
    
    CGFloat h = 0;
    if (iphone_X || ScreenWidth == 414) {
        h = StatusBarHeight;
    }else{
        h = StatusBarHeight+15;
    }
    UILabel * contentLabel = [[UILabel alloc] init];
    contentLabel.font = FontBoldSize(27, ScreenWidth);
    contentLabel.text = @"Photo Edit";
    contentLabel.textColor = UIColor.whiteColor;
    [bgView addSubview:contentLabel];
    contentLabel.sd_layout
    .leftSpaceToView(bgView, 15)
    .topSpaceToView(bgView, h)
    .autoHeightRatio(0);
    [contentLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth];
    
    UIButton * shopBtn = [[UIButton alloc] init];
    [shopBtn setTitle:@"Shop" forState:UIControlStateNormal];
    [shopBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [shopBtn setBackgroundColor:RGB(239, 225, 148)];
    shopBtn.titleLabel.font = FontBoldSize(15, ScreenWidth);
    shopBtn.layer.cornerRadius = 8;
    shopBtn.layer.masksToBounds = YES;
    [shopBtn addTarget:self action:@selector(shopBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [bgView addSubview:shopBtn];
    shopBtn.sd_layout
    .rightSpaceToView(bgView, 15)
    .centerYEqualToView(contentLabel)
    .widthIs(50)
    .heightIs(25);
    
    _bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 70, ScreenWidth, 120) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    _bannerView.backgroundColor = UIColor.clearColor;
    _bannerView.localizationImageNamesGroup = self.bannerImageArr;
    [bgView addSubview:_bannerView];
    _bannerView.sd_layout
    .leftEqualToView(bgView)
    .rightEqualToView(bgView)
    .bottomSpaceToView(bgView, 10)
    .heightIs(ScreenHeight/2-150);

}

- (void)loadData{
    NSDictionary * dict;
    if (UserId) {
        dict = @{@"type":@(1),@"is_hot":@(2),@"user_id":UserId};
    }else{
        dict = @{@"type":@(1),@"is_hot":@(2)};
    }
    
    [MIHttpTool Post:PicList parameters:dict success:^(id responseObject) {
        if ([responseObject[@"status"] integerValue] == 1) {
            [self.dataArray removeAllObjects];
            for (NSDictionary * dict in responseObject[@"data"]) {
                MIHomeModel * model = [MIHomeModel mj_objectWithKeyValues:dict];
                [self.dataArray addObject:model];
            }
        }
        
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        MyLog(@"%@",error);
    }];
}



- (void)shopBtnClicked:(UIButton *)sender{
    MIBaseTypeVC * baseType = [[MIBaseTypeVC alloc] init];
    [self.navigationController pushViewController:baseType animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MIHomeSectionOneCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[MIHomeSectionOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.block = ^(NSInteger tag) {
            MyLog(@"%ld",tag);
            switch (tag) {
                case 0:{
                    QMCameraViewController * cmVC = [[QMCameraViewController alloc] init];
                    QMBaseNavigationController * navi = [[QMBaseNavigationController alloc] initWithRootViewController:cmVC];
                    [self presentViewController:navi animated:YES completion:nil];
                }
                    break;
                case 1:{
                    self.type = tag;
                    [self canUsePhoto];
                }
                    break;
                case 2:{
                    self.type = tag;
                    [self canUsePhoto];
                }
                    break;
                case 3:{
                    self.type = tag;
                    [self canUsePhoto];
                }
                    break;
                case 4:{
                    self.type = tag;
                    [self canUsePhoto];
                }
                    break;
                case 5:{
                    MITagsVC * tagsVC = [[MITagsVC alloc] init];
                    [self.navigationController pushViewController:tagsVC animated:YES];
                }
                    break;
                default:
                    break;
            }
            
        };
        return cell;
        
    }else{
        MIHomeSectionTowCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (!cell) {
            cell = [[MIHomeSectionTowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        }
        MIHomeModel * model = self.dataArray[indexPath.row];
        cell.model = model;
        return cell;
    }
  
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MIHomeModel * model = self.dataArray[indexPath.row];
    MIStickerDetailVC * detailVC = [[MIStickerDetailVC alloc] init];
    detailVC.model = model;
    detailVC.pId = model.id;
    [self.navigationController pushViewController:detailVC animated:YES];
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
        cmVC.type = self.type;
//        QMBaseNavigationController * navi = [[QMBaseNavigationController alloc] initWithRootViewController:cmVC];
        [self presentViewController:cmVC animated:YES completion:nil];
        
    }failureBlock:^(NSError *error){
        
        //        [NSObject alertShowWithSingleTipWithtarget:self title:@"获取相册失败" makeSureClick:nil];
        
    }];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return (ScreenWidth - 20)*3/5 + 80;
    }
    return ScreenHeight/2-110;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NSArray * titleArray = @[@"Tools",@"Sticker"];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
    view.backgroundColor = UIColor.whiteColor;
    UILabel * titileLabel = [[UILabel alloc] init];
    titileLabel.font = [UIFont boldSystemFontOfSize:16];
    titileLabel.textColor = UIColor.blackColor;
    titileLabel.text = titleArray[section];
    [view addSubview:titileLabel];
    titileLabel.sd_layout
    .leftSpaceToView(view, 15)
    .bottomSpaceToView(view, 0)
    .autoHeightRatio(0);
    [titileLabel setSingleLineAutoResizeWithMaxWidth:180];
    if (section == 1) {
        UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PEArrow"]];
        //    imageView.backgroundColor = UIColor.redColor;
        [view addSubview:imageView];
        imageView.sd_layout
        .rightSpaceToView(view, 10)
        .centerYEqualToView(view)
        .heightIs(15)
        .widthIs(15);
        
        UIButton * sender = [[UIButton alloc] init];
        sender.tag = 150+ section;
        sender.titleLabel.textAlignment = NSTextAlignmentRight;
        sender.titleLabel.font = FontSize(18, ScreenWidth);
        sender.titleLabel.textAlignment = NSTextAlignmentRight;
        [sender setTitle:@"More" forState:UIControlStateNormal];
        [sender setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
        [sender addTarget:self action:@selector(senderAction:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:sender];
        sender.sd_layout
        .rightSpaceToView(imageView, 0)
        .centerYEqualToView(imageView)
        .widthIs(50)
        .heightIs(30);
    }
    return view;
}
- (void)senderAction:(UIButton *)sender{
    MIBaseTypeVC * baseType = [[MIBaseTypeVC alloc] init];
    [self.navigationController pushViewController:baseType animated:YES];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}


- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view{
    return [MIHomeHeaderView class];
}
- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view{
    MIHomeHeaderView * homeCell = (MIHomeHeaderView*)cell;
    [homeCell.picImageView sd_setImageWithURL:[NSURL URLWithString:self.bannerImageArr[index]]];
//    MIHomeModel * model = self.bannaerArray[index];
//    [homeCell.picImageView sd_setImageWithURL:[NSURL URLWithString:model.pic_url_c]];
    //    homeCell.picImageView.userInteractionEnabled = YES;
    
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    if (index == 0) {
        MIStickerDetailVC * stickerVC = [[MIStickerDetailVC alloc] init];
        stickerVC.pId = @"3";
        [self.navigationController pushViewController:stickerVC animated:YES];
    }else if (index == 1){
        MIFilterDetailVC * filterVC = [[MIFilterDetailVC alloc] init];
        filterVC.pid = @"21";
        [self.navigationController pushViewController:filterVC animated:YES];
    }else{
        MIStickerDetailVC * stickerVC = [[MIStickerDetailVC alloc] init];
        stickerVC.pId = @"7";
        [self.navigationController pushViewController:stickerVC animated:YES];
    }
    
}

@end
