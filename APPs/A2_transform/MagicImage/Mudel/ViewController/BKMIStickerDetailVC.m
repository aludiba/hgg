//
//  MIStickerDetailVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "BKMIStickerDetailVC.h"
#import "BKMIStickerDetailCell.h"
#import "BKMIHomeModel.h"
#import "YWebDataHandle.h"
#import "YWebDownManager.h"
#import "BKMIUserModel.h"
#import "BKMILoginVC.h"
#import "BKMIStoreVC.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "QMPhotoEffectViewController.h"
#import "SDProgressView.h"
@interface BKMIStickerDetailVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UICollectionView *BKcollectionView;
@property (nonatomic, strong) NSMutableArray *BKdataArray;
@property (nonatomic, strong) BKMIUserModel *BKuserModel;
@property (nonatomic, strong) UILabel *BKcoinsLabel;
@property (nonatomic, strong) UIButton *BKbuyBtn;
@property (nonatomic, strong) UILabel *BKpriceLabel;
@property (nonatomic, strong) UIImageView *BKheaderImageView;
@property (nonatomic, strong) UILabel *BKtitleLabel;
@end

@implementation BKMIStickerDetailVC
- (NSMutableArray *)BKdataArray{
    if (!_BKdataArray) {
        _BKdataArray = @[].mutableCopy;
    }
    return _BKdataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Sticker";
    self.view.backgroundColor = UIColor.whiteColor;
    [self BKaddTopView];
    //初始化CollectionView
    UICollectionViewFlowLayout *BKlayout = [[UICollectionViewFlowLayout alloc] init];
    self.BKcollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, ScreenHeight/4, ScreenWidth, ScreenHeight*3/4-NavBarHeight) collectionViewLayout:BKlayout];
    self.BKcollectionView.delegate = self;
    self.BKcollectionView.dataSource = self;
    self.BKcollectionView.backgroundColor = [UIColor whiteColor];
    [self.BKcollectionView registerClass:[BKMIStickerDetailCell class] forCellWithReuseIdentifier:@"cellId1"];
    [self.view addSubview:self.BKcollectionView];
    self.BKcollectionView.backgroundColor = UIColor.groupTableViewBackgroundColor;
    [self.BKdataArray addObjectsFromArray:self.BKmodel.BKpic_url_detail_array];
    
    if (UserId) {
        [self BKloadUserModel];
    }
    [self BKcreateRightView];
    [self BKloadDataWithType:1];
    [NotifiCenter addObserver:self selector:@selector(BKloginSuccess) name:@"loginSuccess" object:nil];
}

- (void)BKaddTopView{
    UIView *BKtopView =  [[UIView alloc] init];
    BKtopView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:BKtopView];
    BKtopView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topSpaceToView(self.view, 0)
    .heightIs(ScreenHeight/4);
    UIImageView *BKheaderImageView = [[UIImageView alloc] init];
    self.BKheaderImageView = BKheaderImageView;
    BKheaderImageView.layer.cornerRadius = 8;
    BKheaderImageView.layer.masksToBounds = YES;
    if (self.BKtype == 1 ) {
        [BKheaderImageView sd_setImageWithURL:[NSURL URLWithString:self.BKmodel.BKpic_url_z]];
    }
    [BKtopView addSubview:BKheaderImageView];
    BKheaderImageView.sd_layout
    .leftSpaceToView(BKtopView, 15)
    .topSpaceToView(BKtopView, 10)
    .widthIs(60)
    .heightEqualToWidth();
    
    UILabel *BKtitleLabel = [[UILabel alloc] init];
    if (self.BKtype == 1) {
       BKtitleLabel.text = self.BKmodel.BKtitle;
    }
    self.BKtitleLabel = BKtitleLabel;
    BKtitleLabel.font = FontSize(18, ScreenWidth);
    BKtitleLabel.textColor = UIColor.blackColor;
    [BKtopView addSubview:BKtitleLabel];
    BKtitleLabel.sd_layout
    .leftSpaceToView(BKheaderImageView, 10)
    .centerYEqualToView(BKheaderImageView)
    .autoHeightRatio(0);
    [BKtitleLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth/2];
    
    UILabel *BKpriceLabel = [[UILabel alloc] init];
    BKpriceLabel.textColor = UIColor.orangeColor;
    self.BKpriceLabel = BKpriceLabel;
    BKpriceLabel.font = FontSize(15, ScreenWidth);
    [BKtopView addSubview:BKpriceLabel];
    BKpriceLabel.sd_layout
    .rightSpaceToView(BKtopView, 15)
    .centerYEqualToView(BKheaderImageView)
    .autoHeightRatio(0);
    [BKpriceLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth/2];
    
    UIButton *BKbuyBtn = [[UIButton alloc] init];
    self.BKbuyBtn = BKbuyBtn;
    [BKbuyBtn setTitle:@"DownLoad" forState:UIControlStateNormal];
    [BKbuyBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    
    
    BKbuyBtn.layer.cornerRadius = 8;
    BKbuyBtn.layer.masksToBounds = YES;
    [BKbuyBtn addTarget:self action:@selector(BKbtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [BKtopView addSubview:BKbuyBtn];
    BKbuyBtn.sd_layout
    .leftSpaceToView(BKtopView, 15)
    .rightSpaceToView(BKtopView, 15)
    .topSpaceToView(BKheaderImageView, 15)
//    42 134 250
    .heightIs(45);
    NSFileManager *BKfileManager = [NSFileManager new];
    NSString *BKsource = [YWebDataHandle documentYWebImageFileWithFolder:self.BKpId];
    self.BKmodel.BKpeanut_num = @"0";
    if (BKsource&& [BKfileManager fileExistsAtPath:BKsource]) {
        NSArray *BKfiles = [BKfileManager contentsOfDirectoryAtPath:BKsource error:nil];
        NSMutableArray *BKnewFiles = [@[] mutableCopy];
        for (NSString *BKfileName in BKfiles) {
            [BKnewFiles addObject:BKfileName];
        }
        if (BKnewFiles.count>0) {
            [BKbuyBtn setTitle:@"Apply" forState:UIControlStateNormal];
            BKbuyBtn.backgroundColor = RGB(62, 85, 250);
        }else{
            
            [BKbuyBtn setTitle:@"Download" forState:UIControlStateNormal];
            BKbuyBtn.backgroundColor = RGB(42, 134, 250);
        }
    }else{
        
        if (self.BKmodel.BKpeanut_num.integerValue>0) {
           [BKbuyBtn setTitle:@"Buy" forState:UIControlStateNormal];
            BKbuyBtn.backgroundColor = RGB(42, 134, 250);
        }else{
            [BKbuyBtn setTitle:@"Download" forState:UIControlStateNormal];
            BKbuyBtn.backgroundColor = RGB(42, 134, 250);
        }
    }
}

- (void)BKloadDataWithType:(NSInteger)BKtype{
    NSString *BKuser_id;
    if (UserId) {
        BKuser_id  = UserId;
    }else{
        BKuser_id = @"";
    }
    [MIHttpTool Post:PicList parameters:@{@"type":@(BKtype),@"id":self.BKpId,@"user_id":BKuser_id} success:^(id BKresponseObject) {
        if ([BKresponseObject[@"status"] integerValue] == 1) {
            for (NSDictionary *BKdict in BKresponseObject[@"data"]) {
                BKMIHomeModel *BKmodel = [BKMIHomeModel mj_objectWithKeyValues:BKdict];
                self.BKmodel = BKmodel;
                BKmodel.BKpeanut_num = @"0";
                if (BKmodel.BKpeanut_num.floatValue>0) {
                    [self.BKbuyBtn setTitle:@"Buy" forState:UIControlStateNormal];
                    self.BKpriceLabel.text = BKmodel.BKpeanut_num;
                }
                [self.BKheaderImageView sd_setImageWithURL:[NSURL URLWithString:self.BKmodel.BKpic_url_z] placeholderImage:nil];
                self.BKtitleLabel.text = BKmodel.BKtitle;
                [self.BKdataArray addObjectsFromArray:BKmodel.BKpic_url_detail_array];
            }
            
        }
        [self.BKcollectionView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
}


- (void)BKcreateRightView{
    
//    UIView * rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 25)];
//    rightView.userInteractionEnabled = YES;
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
//    [rightView addGestureRecognizer:tap];
//    rightView.layer.cornerRadius = 5;
//
//    UILabel * label = [[UILabel alloc] init];
//    label.font = FontSize(13, ScreenWidth);
//    label.textColor = UIColor.orangeColor;
//
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
//
//    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//
//    spaceItem.width = -10;
//    self.navigationItem.rightBarButtonItems = @[spaceItem,rigthBtn];
//
    
}

- (void)BKloginSuccess{
    [self BKloadUserModel];
    
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
- (void)BKbtnClicked:(UIButton *)BKsender{
    if ([BKsender.titleLabel.text isEqualToString:@"Download"]) {
        __block float i = 0;
        SDLoopProgressView *BKloop = [SDLoopProgressView progressView];
        BKloop.backgroundColor = UIColor.blueColor;
        BKloop.frame = CGRectMake(0, 0, 100, 100);
        BKloop.center = CGPointMake(self.view.centerX, self.view.centerY - 50);
        [self.view addSubview:BKloop];
        
        for (NSString *BKimgUrl in self.BKmodel.BKpic_url_detail_array) {
            YWebDownManager *BKwebDownManager = [[YWebDownManager alloc] init];
            BKwebDownManager.folder = self.BKpId;
            //开始下载
            [BKwebDownManager startDownImagePath:BKimgUrl];
            //设置下载完毕的回调
            [BKwebDownManager downManagerFinishBlockHandle:^(NSString *BKpath) {
                i++;
                if (i == self.BKmodel.BKpic_url_detail_array.count) {
                    [self.BKbuyBtn setTitle:@"Apply" forState:UIControlStateNormal];
                    self.BKbuyBtn.backgroundColor = RGB(62, 85, 250);
                   
                }
                BKloop.progress = i/self.BKmodel.BKpic_url_detail_array.count;
            }];
            //设置下载过程的回调
            [BKwebDownManager downManagerProgressBlockHandle:^(CGFloat didFinish, CGFloat didFinishTotal, CGFloat Total) {
            }];
            
        }
        
    }else{
        [self BKcanUsePhoto];
    }

}

- (void)BKcanUsePhoto{
    PHAuthorizationStatus BKstatus = [PHPhotoLibrary authorizationStatus];
    if (BKstatus == PHAuthorizationStatusRestricted) { // 此应用程序没有被授权访问的照片数据。可能是家长控制权限。
        NSLog(@"因为系统原因, 无法访问相册");
        
    } else if (BKstatus == PHAuthorizationStatusDenied) { // 用户拒绝访问相册
        UIAlertView *BKalertView = [[UIAlertView alloc] initWithTitle:@"Caveat" message:@"Please go to -> [Settings - Privacy - Camera - Project Name] Open the access switch" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Setting", nil];
        [BKalertView show];
    } else if (BKstatus == PHAuthorizationStatusAuthorized) { // 用户允许访问相册
        // 放一些使用相册的代码
        UIImagePickerController *BKvc = [[UIImagePickerController alloc] init];
        BKvc.delegate = self;
        BKvc.allowsEditing = YES;
        BKvc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:BKvc animated:YES completion:nil];
    } else if (BKstatus == PHAuthorizationStatusNotDetermined) { // 用户还没有做出选择
        // 弹框请求用户授权
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) { // 用户点击了好
                // 放一些使用相册的代码
                UIImagePickerController *BKvc = [[UIImagePickerController alloc] init];
                BKvc.delegate = self;
                BKvc.allowsEditing = YES;
                BKvc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:BKvc animated:YES completion:nil];
            }
        }];
    }
}
#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)BKalertView clickedButtonAtIndex:(NSInteger)BKbuttonIndex{
    if (BKbuttonIndex == 1) {
        // 系统是否大于10
        NSURL *BKurl = nil;
        BKurl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:BKurl];
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)BKpicker{
    [BKpicker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)BKpicker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)BKinfo{
    NSURL *BKurl = [BKinfo objectForKey:UIImagePickerControllerReferenceURL];
    ALAssetsLibrary *BKlibrary = [[ALAssetsLibrary alloc] init];
    [BKlibrary assetForURL:BKurl resultBlock:^(ALAsset *BKasset){
        //获取图片
        UIImage *BKimage = BKinfo[UIImagePickerControllerOriginalImage];
        //获取照片名称
        QMPhotoEffectViewController *BKcmVC = [[QMPhotoEffectViewController alloc] initWithImage:BKimage];
        BKcmVC.type = 1;
        BKcmVC.resourcePath = [YWebDataHandle documentYWebImageFileWithFolder:self.BKpId];
        [self presentViewController:BKcmVC animated:YES completion:nil];
    }failureBlock:^(NSError *error){
        
    }];
    [BKpicker dismissViewControllerAnimated:YES completion:nil];
    
}



- (void)BKloadUserModel{
    [MIHttpTool Post:SHUserDetail parameters:@{@"user_id":UserId} success:^(id BKresponseObject) {
        if ([BKresponseObject[@"status"] integerValue] == 1) {
            BKMIUserModel *BKmodel = [BKMIUserModel mj_objectWithKeyValues:BKresponseObject[@"data"]];
            self.BKuserModel = BKmodel;
            self.BKcoinsLabel.text = BKmodel.BKpeanut_num;
        }
    } failure:^(NSError *error) {
        
    }];
}
#pragma mark --UICollectionViewdelegate& DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.BKdataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)BKcollectionView cellForItemAtIndexPath:(NSIndexPath *)BKindexPath{
    static NSString *BKidentify = @"cellId1";
    BKMIStickerDetailCell *BKcell = [BKcollectionView dequeueReusableCellWithReuseIdentifier:BKidentify forIndexPath:BKindexPath];
    BKcell.backgroundColor = UIColor.groupTableViewBackgroundColor;
    BKcell.BKpicUrl = self.BKdataArray[BKindexPath.row];
    return BKcell;
}
#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)BKcollectionView layout:(UICollectionViewLayout *)BKcollectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)BKindexPath{
    NSInteger BKnumPreRow = 5;
    CGFloat BKwidth = (ScreenWidth - 5 * (BKnumPreRow +1)) /BKnumPreRow;
    return CGSizeMake(BKwidth, BKwidth);
}


#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)BKcollectionView layout:(UICollectionViewLayout *)BKcollectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)BKsection{
    return 5;
}

#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)BKcollectionView layout:(UICollectionViewLayout*)BKcollectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)BKsection{
    return 5;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)BKcollectionView layout:(UICollectionViewLayout *)BKcollectionViewLayout insetForSectionAtIndex:(NSInteger)BKsection{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


@end
