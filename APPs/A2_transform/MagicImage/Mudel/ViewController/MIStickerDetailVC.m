//
//  MIStickerDetailVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIStickerDetailVC.h"
#import "MIStickerDetailCell.h"
#import "MIHomeModel.h"
#import "YWebDataHandle.h"
#import "YWebDownManager.h"
#import "MIUserModel.h"
#import "BKMILoginVC.h"
#import "BKMIStoreVC.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "QMPhotoEffectViewController.h"
#import "SDProgressView.h"
@interface MIStickerDetailVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, strong) MIUserModel * userModel;
@property (nonatomic, strong) UILabel *coinsLabel;
@property (nonatomic, strong) UIButton * buyBtn;
@property (nonatomic, strong) UILabel * priceLabel;
@property (nonatomic, strong) UIImageView * headerImageView;
@property (nonatomic, strong) UILabel * titleLabel;
@end

@implementation MIStickerDetailVC
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Sticker";
    self.view.backgroundColor = UIColor.whiteColor;
    [self addTopView];
    //初始化CollectionView
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, ScreenHeight/4, ScreenWidth, ScreenHeight*3/4-NavBarHeight) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[MIStickerDetailCell class] forCellWithReuseIdentifier:@"cellId1"];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = UIColor.groupTableViewBackgroundColor;
    [self.dataArray addObjectsFromArray:self.model.pic_url_detail_array];
    
    if (UserId) {
        [self loadUserModel];
    }
    [self createRightView];
    [self loadDataWithType:1];
    [NotifiCenter addObserver:self selector:@selector(loginSuccess) name:@"loginSuccess" object:nil];
}

- (void)addTopView{
    UIView * topView =  [[UIView alloc] init];
    topView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:topView];
    topView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topSpaceToView(self.view, 0)
    .heightIs(ScreenHeight/4);
    UIImageView * headerImageView = [[UIImageView alloc] init];
    self.headerImageView = headerImageView;
    headerImageView.layer.cornerRadius = 8;
    headerImageView.layer.masksToBounds = YES;
    if (self.type == 1 ) {
       [headerImageView sd_setImageWithURL:[NSURL URLWithString:self.model.pic_url_z]];
    }
    [topView addSubview:headerImageView];
    headerImageView.sd_layout
    .leftSpaceToView(topView, 15)
    .topSpaceToView(topView, 10)
    .widthIs(60)
    .heightEqualToWidth();
    
    UILabel * titleLabel = [[UILabel alloc] init];
    if (self.type == 1) {
       titleLabel.text = self.model.title;
    }
    self.titleLabel = titleLabel;
    titleLabel.font = FontSize(18, ScreenWidth);
    titleLabel.textColor = UIColor.blackColor;
    [topView addSubview:titleLabel];
    titleLabel.sd_layout
    .leftSpaceToView(headerImageView, 10)
    .centerYEqualToView(headerImageView)
    .autoHeightRatio(0);
    [titleLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth/2];
    
    UILabel * priceLabel = [[UILabel alloc] init];
    priceLabel.textColor = UIColor.orangeColor;
    self.priceLabel = priceLabel;
    priceLabel.font = FontSize(15, ScreenWidth);
//    if (self.model.peanut_num.integerValue>0) {
//        priceLabel.text = self.model.peanut_num;
//    }else{
//        priceLabel.text = @"Free";
//    }
    [topView addSubview:priceLabel];
    priceLabel.sd_layout
    .rightSpaceToView(topView, 15)
    .centerYEqualToView(headerImageView)
    .autoHeightRatio(0);
    [priceLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth/2];
    
    UIButton * buyBtn = [[UIButton alloc] init];
    self.buyBtn = buyBtn;
    [buyBtn setTitle:@"DownLoad" forState:UIControlStateNormal];
    [buyBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    
    
    buyBtn.layer.cornerRadius = 8;
    buyBtn.layer.masksToBounds = YES;
    [buyBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:buyBtn];
    buyBtn.sd_layout
    .leftSpaceToView(topView, 15)
    .rightSpaceToView(topView, 15)
    .topSpaceToView(headerImageView, 15)
//    42 134 250
    .heightIs(45);
    NSFileManager *fileManager = [NSFileManager new];
    NSString * source = [YWebDataHandle documentYWebImageFileWithFolder:self.pId];
    self.model.peanut_num = @"0";
    if (source&& [fileManager fileExistsAtPath:source]) {
        NSArray *files = [fileManager contentsOfDirectoryAtPath:source error:nil];
        NSMutableArray *newFiles = [@[] mutableCopy];
        for (NSString *fileName in files) {
            [newFiles addObject:fileName];
        }
        if (newFiles.count>0) {
            [buyBtn setTitle:@"Apply" forState:UIControlStateNormal];
            buyBtn.backgroundColor = RGB(62, 85, 250);
        }else{
            
            [buyBtn setTitle:@"Download" forState:UIControlStateNormal];
            buyBtn.backgroundColor = RGB(42, 134, 250);
        }
    }else{
        
        if (self.model.peanut_num.integerValue>0) {
           [buyBtn setTitle:@"Buy" forState:UIControlStateNormal];
            buyBtn.backgroundColor = RGB(42, 134, 250);
        }else{
            [buyBtn setTitle:@"Download" forState:UIControlStateNormal];
            buyBtn.backgroundColor = RGB(42, 134, 250);
        }
    }
}

- (void)loadDataWithType:(NSInteger)type{
    NSString * user_id;
    if (UserId) {
        user_id  = UserId;
    }else{
        user_id = @"";
    }
    [MIHttpTool Post:PicList parameters:@{@"type":@(type),@"id":self.pId,@"user_id":user_id} success:^(id responseObject) {
        if ([responseObject[@"status"] integerValue] == 1) {
            for (NSDictionary * dict in responseObject[@"data"]) {
                MIHomeModel * model = [MIHomeModel mj_objectWithKeyValues:dict];
                self.model = model;
                model.peanut_num = @"0";
                if (model.peanut_num.floatValue>0) {
                    [self.buyBtn setTitle:@"Buy" forState:UIControlStateNormal];
                    self.priceLabel.text = model.peanut_num;
                }
                [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:self.model.pic_url_z] placeholderImage:nil];
                self.titleLabel.text = model.title;
                [self.dataArray addObjectsFromArray:model.pic_url_detail_array];
            }
            
        }
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
}


- (void)createRightView{
    
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

- (void)loginSuccess{
    [self loadUserModel];
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap{
    if (!UserId) {
        BKMILoginVC * logVC = [[BKMILoginVC alloc] init];
        UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:logVC];
        [self presentViewController:navi animated:YES completion:nil];
        return;
    }
    
    BKMIStoreVC * storeVC = [[BKMIStoreVC alloc] init];
    [self.navigationController pushViewController:storeVC animated:YES];
}


- (void)btnClicked:(UIButton *)sender{
    
//    if (!UserId) {
//        MILoginVC * logVC = [[MILoginVC alloc] init];
//        UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:logVC];
//        [self presentViewController:navi animated:YES completion:nil];
//        return;
//    }
//
//    if (self.model.peanut_num.integerValue>0) {
//        if (self.model.peanut_num.integerValue <= self.userModel.peanut_num.integerValue) {
//            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"prompt" message:@"Determine to buy?" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//            }];
//            [alert addAction:cancel];
//            UIAlertAction * sure = [UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                [MIHttpTool Post:AddUserPeanut parameters:@{@"peanut_num":[NSString stringWithFormat:@"-%@",self.model.peanut_num],@"type":@"2",@"object_id":self.model.id,@"user_id":UserId} success:^(id responseObject) {
//                    [MBProgressHUD showTipMessageInWindow:responseObject[@"msg"]];
//                    if ([responseObject[@"status"] integerValue] == 1) {
//                        //购买成功
//                        //                            musicDownLoadView.placeholderBtnText = @"Download";
//                        [self.buyBtn setTitle:@"Download" forState:UIControlStateNormal];
//                         self.buyBtn.backgroundColor = RGB(42, 134, 250);
//                        self.model.peanut_num = @"0";
//                        self.priceLabel.text = @"Free";
//                        [NotifiCenter postNotificationName:@"loginSuccess" object:nil];
//                    }else if ([responseObject[@"status"] integerValue] == -200){
//                        //金币不足
//
//                    }else{
//
//
//                    }
//                } failure:^(NSError *error) {
//
//                }];
//            }];
//            [alert addAction:sure];
//            [self presentViewController:alert animated:YES completion:nil];
//        }else{
//
//            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Insufficient Coins" message:@"You don't have enough coins for the item. Would you like to get the more?" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//            }];
//            [alert addAction:cancel];
//            UIAlertAction * sure = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                MIStoreVC * store = [[MIStoreVC alloc] init];
//                [self.navigationController pushViewController:store animated:YES];
//            }];
//            [alert addAction:sure];
//            [self presentViewController:alert animated:YES completion:nil];
//
//
//        }
//    }else{
//        if ([sender.titleLabel.text isEqualToString:@"Download"]) {
//            __block float i = 0;
//            SDLoopProgressView * loop = [SDLoopProgressView progressView];
//            loop.backgroundColor = UIColor.blueColor;
//            loop.frame = CGRectMake(0, 0, 100, 100);
//            loop.center = CGPointMake(self.view.centerX, self.view.centerY-50);
//            [self.view addSubview:loop];
//
//            for (NSString * imgUrl in self.model.pic_url_detail_array) {
//
//                YWebDownManager * webDownManager = [[YWebDownManager alloc]init];
//                webDownManager.folder = self.pId;
//                //开始下载
//                [webDownManager startDownImagePath:imgUrl];
//                //设置下载完毕的回调
//                [webDownManager downManagerFinishBlockHandle:^(NSString *path) {
//                    i++;
//                    if (i == self.model.pic_url_detail_array.count) {
//                        [self.buyBtn setTitle:@"Apply" forState:UIControlStateNormal];
//                        self.buyBtn.backgroundColor = RGB(62, 85, 250);
//
//                    }
//                    loop.progress = i/self.model.pic_url_detail_array.count;
//                }];
//
//                //设置下载过程的回调
//                [webDownManager downManagerProgressBlockHandle:^(CGFloat didFinish, CGFloat didFinishTotal, CGFloat Total) {
//                }];
//
//                MyLog(@"222");
//            }
//
//        }else{
//            [self canUsePhoto];
//        }
//    }
    if ([sender.titleLabel.text isEqualToString:@"Download"]) {
        __block float i = 0;
        SDLoopProgressView * loop = [SDLoopProgressView progressView];
        loop.backgroundColor = UIColor.blueColor;
        loop.frame = CGRectMake(0, 0, 100, 100);
        loop.center = CGPointMake(self.view.centerX, self.view.centerY-50);
        [self.view addSubview:loop];
        
        for (NSString * imgUrl in self.model.pic_url_detail_array) {
            
            YWebDownManager * webDownManager = [[YWebDownManager alloc]init];
            webDownManager.folder = self.pId;
            //开始下载
            [webDownManager startDownImagePath:imgUrl];
            //设置下载完毕的回调
            [webDownManager downManagerFinishBlockHandle:^(NSString *path) {
                i++;
                if (i == self.model.pic_url_detail_array.count) {
                    [self.buyBtn setTitle:@"Apply" forState:UIControlStateNormal];
                    self.buyBtn.backgroundColor = RGB(62, 85, 250);
                   
                }
                loop.progress = i/self.model.pic_url_detail_array.count;
            }];
            
            //设置下载过程的回调
            [webDownManager downManagerProgressBlockHandle:^(CGFloat didFinish, CGFloat didFinishTotal, CGFloat Total) {
            }];
            
            MyLog(@"222");
        }
        
    }else{
        [self canUsePhoto];
    }

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
        cmVC.type = 1;
        cmVC.resourcePath = [YWebDataHandle documentYWebImageFileWithFolder:self.pId];
        //        QMBaseNavigationController * navi = [[QMBaseNavigationController alloc] initWithRootViewController:cmVC];
        [self presentViewController:cmVC animated:YES completion:nil];
        
    }failureBlock:^(NSError *error){
    }];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}



- (void)loadUserModel{
    [MIHttpTool Post:SHUserDetail parameters:@{@"user_id":UserId} success:^(id responseObject) {
        if ([responseObject[@"status"] integerValue] == 1) {
            MIUserModel * model = [MIUserModel mj_objectWithKeyValues:responseObject[@"data"]];
            self.userModel = model;
            self.coinsLabel.text = model.peanut_num;
        }
        
    } failure:^(NSError *error) {
        
    }];
}


#pragma mark --UICollectionViewdelegate& DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataArray.count;
    //    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"cellId1";
    MIStickerDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.backgroundColor = UIColor.groupTableViewBackgroundColor;
    cell.picUrl = self.dataArray[indexPath.row];
    return cell;
}


#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger numPreRow = 5;
    CGFloat width = (ScreenWidth - 5*(numPreRow +1)) /numPreRow;
    return CGSizeMake(width, width);
}


#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}

#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


@end
