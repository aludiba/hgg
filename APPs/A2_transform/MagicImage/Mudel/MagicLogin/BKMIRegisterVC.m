//
//  MIRegisterVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/5/1.
//  Copyright © 2019 April. All rights reserved.
//

#import "BKMIRegisterVC.h"
#import <Masonry.h>
@interface BKMIRegisterVC ()
@property (nonatomic, strong) UITextField *BKusrName;
@property (nonatomic, strong) UITextField *BKusrPwd;
@end

@implementation BKMIRegisterVC
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
    // Do any additional setup after loading the view.
    // 蒙板
    UIImageView *BKmaskImgView = [[UIImageView alloc] init];
    BKmaskImgView.userInteractionEnabled = YES;
    [self.view addSubview:BKmaskImgView];
    [BKmaskImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
    }];
    BKmaskImgView.backgroundColor = RGB(62, 85, 250);
    
    UIButton *BKcloseBtn = [[UIButton alloc] init];
    [BKcloseBtn setImage:[UIImage imageNamed:@"Peclose"] forState:UIControlStateNormal];
    [BKcloseBtn addTarget:self action:@selector(BKcloseBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [BKmaskImgView addSubview:BKcloseBtn];
    BKcloseBtn.sd_layout
    .leftSpaceToView(BKmaskImgView, 15)
    .topSpaceToView(BKmaskImgView, StatusBarHeight+10)
    .widthIs(40)
    .heightEqualToWidth();
    
    // 登录
    UILabel *BKloginLabel = [[UILabel alloc] init];
    [BKmaskImgView addSubview:BKloginLabel];
    [BKloginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(BKmaskImgView.mas_top).with.offset(NavBarHeight+5.5);
        make.centerX.equalTo(BKmaskImgView);
        //        make.size.mas_equalTo(CGSizeMake(81, 36.5));
    }];
    BKloginLabel.font = FontSize(40, ScreenWidth);
    BKloginLabel.textColor = UIColor.whiteColor;
    BKloginLabel.textAlignment = NSTextAlignmentCenter;
    BKloginLabel.text = @"Register";
    
    // 请输入用户名
    UIView *BKuserView = [[UIImageView alloc] init];
    [BKmaskImgView addSubview:BKuserView];
    [BKuserView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(BKloginLabel.mas_bottom).with.offset(91);
        make.centerX.equalTo(BKmaskImgView);
        make.size.mas_equalTo(CGSizeMake(263, 54));
    }];
    BKuserView.userInteractionEnabled = YES;
    
    UIImageView *BKbgImgView1 = [[UIImageView alloc] init];
    [BKuserView addSubview:BKbgImgView1];
    [BKbgImgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(BKuserView.mas_left).with.offset(0);
        make.top.equalTo(BKuserView.mas_top).with.offset(0);
        make.right.equalTo(BKuserView.mas_right).with.offset(0);
        make.bottom.equalTo(BKuserView.mas_bottom).with.offset(0);
    }];
    BKbgImgView1.alpha = 1;
    BKbgImgView1.image = PEImage(@"box");
    
    UIImageView *BKiconImgView1 = [[UIImageView alloc] init];
    [BKuserView addSubview:BKiconImgView1];
    [BKiconImgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(BKuserView.mas_left).with.offset(50.5);
        make.centerY.equalTo(BKuserView);
        make.size.mas_equalTo(CGSizeMake(15.5, 18));
    }];
    BKiconImgView1.alpha = 1;
    BKiconImgView1.image = PEImage(@"user");
    
    self.BKusrName = [[UITextField alloc] init];
    [BKuserView addSubview:self.BKusrName];
    [self.BKusrName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(BKiconImgView1.mas_right).with.offset(26.5);
        make.right.equalTo(BKuserView.mas_right).with.offset(-26.5);
        make.centerY.equalTo(BKuserView);
        make.height.mas_equalTo(14);
    }];
    self.BKusrName.alpha = 1;
    self.BKusrName.font = FontSize(15, ScreenWidth);
    self.BKusrName.textColor = UIColor.whiteColor;
    self.BKusrName.textAlignment = NSTextAlignmentLeft;
    NSString *BKplaceholder1 = @"UserName";
    NSMutableAttributedString *BKattrsPlaceholder1 = [[NSMutableAttributedString alloc] initWithString:BKplaceholder1];
    [BKattrsPlaceholder1 addAttribute:NSForegroundColorAttributeName value:UIColor.whiteColor range:NSMakeRange(0, BKplaceholder1.length)];
    self.BKusrName.attributedPlaceholder = BKattrsPlaceholder1;
    self.BKusrName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    // 请输入密码
    UIView *BKpasswordView = [[UIImageView alloc] init];
    [BKmaskImgView addSubview:BKpasswordView];
    [BKpasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(BKuserView.mas_bottom).with.offset(15);
        make.centerX.equalTo(BKmaskImgView);
        make.size.mas_equalTo(CGSizeMake(263, 54));
    }];
    BKpasswordView.userInteractionEnabled = YES;
    
    UIImageView *BKbgImgView2 = [[UIImageView alloc] init];
    [BKpasswordView addSubview:BKbgImgView2];
    [BKbgImgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(BKpasswordView.mas_left).with.offset(0);
        make.top.equalTo(BKpasswordView.mas_top).with.offset(0);
        make.right.equalTo(BKpasswordView.mas_right).with.offset(0);
        make.bottom.equalTo(BKpasswordView.mas_bottom).with.offset(0);
    }];
    BKbgImgView2.alpha = 1;
    BKbgImgView2.image = PEImage(@"box");
    
    UIImageView *BKiconImgView2 = [[UIImageView alloc] init];
    [BKpasswordView addSubview:BKiconImgView2];
    [BKiconImgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(BKpasswordView.mas_left).with.offset(51);
        make.centerY.equalTo(BKpasswordView);
        make.size.mas_equalTo(CGSizeMake(16, 17));
    }];
    BKiconImgView2.alpha = 1;
    BKiconImgView2.image = PEImage(@"password");
    
    self.BKusrPwd = [[UITextField alloc] init];
    [BKpasswordView addSubview:self.BKusrPwd];
    [self.BKusrPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(BKiconImgView2.mas_right).with.offset(27.5);
        make.right.equalTo(BKpasswordView.mas_right).with.offset(-27.5);
        make.centerY.equalTo(BKpasswordView);
        make.height.mas_equalTo(14);
    }];
    self.BKusrPwd.alpha = 1;
    self.BKusrPwd.font = FontSize(15, ScreenWidth);
    self.BKusrPwd.textColor = UIColor.whiteColor;
    self.BKusrPwd.textAlignment = NSTextAlignmentLeft;
    NSString *BKplaceholder2 = @"Password";
    NSMutableAttributedString *BKattrsPlaceholder2 = [[NSMutableAttributedString alloc] initWithString:BKplaceholder2];
    [BKattrsPlaceholder2 addAttribute:NSForegroundColorAttributeName value:UIColor.whiteColor range:NSMakeRange(0, BKplaceholder2.length)];
    self.BKusrPwd.attributedPlaceholder = BKattrsPlaceholder2;
    self.BKusrPwd.secureTextEntry = YES;
    
    // 确认
    UIButton *BKloginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    BKloginBtn.layer.cornerRadius = 10;
    BKloginBtn.layer.masksToBounds = YES;
    BKloginBtn.layer.borderColor = UIColor.whiteColor.CGColor;
    BKloginBtn.layer.borderWidth = 0.5;
    [BKmaskImgView addSubview:BKloginBtn];
    [BKloginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(BKpasswordView.mas_bottom).with.offset(55);
        make.centerX.equalTo(BKmaskImgView);
        make.size.mas_equalTo(CGSizeMake(263, 45));
    }];
    BKloginBtn.alpha = 1;
    //    [loginBtn setBackgroundImage:PEImage(@"confirm") forState:UIControlStateNormal];
    //    [loginBtn setBackgroundImage:PEImage(@"confirm") forState:UIControlStateHighlighted];
    [BKloginBtn setTitle:@"SignIn" forState:UIControlStateNormal];
    
    [BKloginBtn addTarget:self action:@selector(BKregisterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 注册账号
    UIButton *BKregisterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [BKmaskImgView addSubview:BKregisterBtn];
    [BKregisterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.left.equalTo(maskImgView.mas_left).with.offset(55.5);
        make.centerX.equalTo(BKloginBtn);
        make.top.equalTo(BKloginBtn.mas_bottom).with.offset(30.5);
        //        make.size.mas_equalTo(CGSizeMake(55, 12.5));
    }];
    BKregisterBtn.alpha = 1;
    [BKregisterBtn setTitle:@"Login" forState:UIControlStateNormal];
    NSMutableAttributedString *BKattrs1 = [[NSMutableAttributedString alloc] initWithString:BKregisterBtn.currentTitle];
    [BKattrs1 addAttribute:NSFontAttributeName value:FontSize(15, ScreenWidth) range:[BKregisterBtn.currentTitle rangeOfString:BKregisterBtn.currentTitle]];
    [BKattrs1 addAttribute:NSForegroundColorAttributeName value:UIColor.whiteColor range:[BKregisterBtn.currentTitle rangeOfString:BKregisterBtn.currentTitle]];
    [BKregisterBtn setAttributedTitle:BKattrs1 forState:UIControlStateNormal];
    [BKregisterBtn addTarget:self action:@selector(BKloginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //    // 忘记密码？
    //    UIButton *resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [self.view addSubview:resetBtn];
    //    [resetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(loginBtn.mas_bottom).with.offset(30.5);
    //        make.right.equalTo(self.view.mas_right).with.offset(-56);
    //        make.size.mas_equalTo(CGSizeMake(70, 12.5));
    //    }];
    //    resetBtn.alpha = 0;
    //    [resetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    //    NSMutableAttributedString *attrs2 = [[NSMutableAttributedString alloc] initWithString:resetBtn.currentTitle];
    //    [attrs2 addAttribute:NSFontAttributeName value:AppFont(13) range:[resetBtn.currentTitle rangeOfString:resetBtn.currentTitle]];
    //    [attrs2 addAttribute:NSForegroundColorAttributeName value:AppHTMLColor(@"f5f5f5") range:[resetBtn.currentTitle rangeOfString:resetBtn.currentTitle]];
    //    [resetBtn setAttributedTitle:attrs2 forState:UIControlStateNormal];
    //    [resetBtn addTarget:self action:@selector(resetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - 登录
- (void)BKloginBtnClick:(UIButton *)BKsender {
//    NSLog(@"=====登录=====");
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 注册
- (void)BKregisterBtnClick:(UIButton *)BKsender {
//    NSLog(@"=====注册=====");
    BKsender.enabled = NO;
    if ([CommonClass isBlankString:self.BKusrName.text]) {
        [MBProgressHUD showTipMessageInWindow:@"Username cannot be empty"];
        BKsender.enabled = YES;
        return;
    }
    if ([CommonClass isBlankString:self.BKusrPwd.text]) {
        BKsender.enabled = YES;
        [MBProgressHUD showTipMessageInWindow:@"Password cannot be empty"];
        return;
    }
    [MIHttpTool Post:SHRegister parameters:@{@"user_name":self.BKusrName.text,@"password":self.BKusrPwd.text} success:^(id responseObject) {
        BKsender.enabled = YES;
        if ([responseObject[@"status"] integerValue] == 1) {
//            [MBProgressHUD showTipMessageInWindow:@"Sign In Success"];
            [self.navigationController popViewControllerAnimated:YES];
            if (self.block) {
                self.block(self.BKusrName.text, self.BKusrPwd.text);
            }
        }else{
            
        }
        [MBProgressHUD showTipMessageInWindow:responseObject[@"msg"]];
    } failure:^(NSError *error) {
        BKsender.enabled = YES;
        
    }];
}

- (void)BKcloseBtnClicked{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
