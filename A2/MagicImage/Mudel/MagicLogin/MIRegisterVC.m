//
//  MIRegisterVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/5/1.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIRegisterVC.h"
#import <Masonry.h>
@interface MIRegisterVC ()
@property (nonatomic, strong) UITextField *usrName;
@property (nonatomic, strong) UITextField *usrPwd;
@end

@implementation MIRegisterVC
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
    UIImageView *maskImgView = [[UIImageView alloc] init];
    maskImgView.userInteractionEnabled = YES;
    [self.view addSubview:maskImgView];
    [maskImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
    }];
    maskImgView.backgroundColor = RGB(62, 85, 250);
    
    UIButton * closeBtn = [[UIButton alloc] init];
    [closeBtn setImage:[UIImage imageNamed:@"Peclose"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [maskImgView addSubview:closeBtn];
    closeBtn.sd_layout
    .leftSpaceToView(maskImgView, 15)
    .topSpaceToView(maskImgView, StatusBarHeight+10)
    .widthIs(40)
    .heightEqualToWidth();
    
    // 登录
    UILabel *loginLabel = [[UILabel alloc] init];
    [maskImgView addSubview:loginLabel];
    [loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(maskImgView.mas_top).with.offset(NavBarHeight+5.5);
        make.centerX.equalTo(maskImgView);
        //        make.size.mas_equalTo(CGSizeMake(81, 36.5));
    }];
    loginLabel.font = FontSize(40, ScreenWidth);
    loginLabel.textColor = UIColor.whiteColor;
    loginLabel.textAlignment = NSTextAlignmentCenter;
    loginLabel.text = @"Register";
    
    // 请输入用户名
    UIView *userView = [[UIImageView alloc] init];
    [maskImgView addSubview:userView];
    [userView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginLabel.mas_bottom).with.offset(91);
        make.centerX.equalTo(maskImgView);
        make.size.mas_equalTo(CGSizeMake(263, 54));
    }];
    userView.userInteractionEnabled = YES;
    
    UIImageView *bgImgView1 = [[UIImageView alloc] init];
    [userView addSubview:bgImgView1];
    [bgImgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userView.mas_left).with.offset(0);
        make.top.equalTo(userView.mas_top).with.offset(0);
        make.right.equalTo(userView.mas_right).with.offset(0);
        make.bottom.equalTo(userView.mas_bottom).with.offset(0);
    }];
    bgImgView1.alpha = 1;
    bgImgView1.image = PEImage(@"box");
    
    UIImageView *iconImgView1 = [[UIImageView alloc] init];
    [userView addSubview:iconImgView1];
    [iconImgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userView.mas_left).with.offset(50.5);
        make.centerY.equalTo(userView);
        make.size.mas_equalTo(CGSizeMake(15.5, 18));
    }];
    iconImgView1.alpha = 1;
    iconImgView1.image = PEImage(@"user");
    
    self.usrName = [[UITextField alloc] init];
    [userView addSubview:self.usrName];
    [self.usrName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImgView1.mas_right).with.offset(26.5);
        make.right.equalTo(userView.mas_right).with.offset(-26.5);
        make.centerY.equalTo(userView);
        make.height.mas_equalTo(14);
    }];
    self.usrName.alpha = 1;
    self.usrName.font = FontSize(15, ScreenWidth);
    self.usrName.textColor = UIColor.whiteColor;
    self.usrName.textAlignment = NSTextAlignmentLeft;
    NSString *placeholder1 = @"UserName";
    NSMutableAttributedString *attrsPlaceholder1 = [[NSMutableAttributedString alloc] initWithString:placeholder1];
    [attrsPlaceholder1 addAttribute:NSForegroundColorAttributeName value:UIColor.whiteColor range:NSMakeRange(0, placeholder1.length)];
    self.usrName.attributedPlaceholder = attrsPlaceholder1;
    self.usrName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    // 请输入密码
    UIView *passwordView = [[UIImageView alloc] init];
    [maskImgView addSubview:passwordView];
    [passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userView.mas_bottom).with.offset(15);
        make.centerX.equalTo(maskImgView);
        make.size.mas_equalTo(CGSizeMake(263, 54));
    }];
    passwordView.userInteractionEnabled = YES;
    
    UIImageView *bgImgView2 = [[UIImageView alloc] init];
    [passwordView addSubview:bgImgView2];
    [bgImgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passwordView.mas_left).with.offset(0);
        make.top.equalTo(passwordView.mas_top).with.offset(0);
        make.right.equalTo(passwordView.mas_right).with.offset(0);
        make.bottom.equalTo(passwordView.mas_bottom).with.offset(0);
    }];
    bgImgView2.alpha = 1;
    bgImgView2.image = PEImage(@"box");
    
    UIImageView *iconImgView2 = [[UIImageView alloc] init];
    [passwordView addSubview:iconImgView2];
    [iconImgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passwordView.mas_left).with.offset(51);
        make.centerY.equalTo(passwordView);
        make.size.mas_equalTo(CGSizeMake(16, 17));
    }];
    iconImgView2.alpha = 1;
    iconImgView2.image = PEImage(@"password");
    
    self.usrPwd = [[UITextField alloc] init];
    [passwordView addSubview:self.usrPwd];
    [self.usrPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImgView2.mas_right).with.offset(27.5);
        make.right.equalTo(passwordView.mas_right).with.offset(-27.5);
        make.centerY.equalTo(passwordView);
        make.height.mas_equalTo(14);
    }];
    self.usrPwd.alpha = 1;
    self.usrPwd.font = FontSize(15, ScreenWidth);
    self.usrPwd.textColor = UIColor.whiteColor;
    self.usrPwd.textAlignment = NSTextAlignmentLeft;
    NSString *placeholder2 = @"Password";
    NSMutableAttributedString *attrsPlaceholder2 = [[NSMutableAttributedString alloc] initWithString:placeholder2];
    [attrsPlaceholder2 addAttribute:NSForegroundColorAttributeName value:UIColor.whiteColor range:NSMakeRange(0, placeholder2.length)];
    self.usrPwd.attributedPlaceholder = attrsPlaceholder2;
    self.usrPwd.secureTextEntry = YES;
    
    // 确认
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.layer.cornerRadius = 10;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.borderColor = UIColor.whiteColor.CGColor;
    loginBtn.layer.borderWidth = 0.5;
    [maskImgView addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordView.mas_bottom).with.offset(55);
        make.centerX.equalTo(maskImgView);
        make.size.mas_equalTo(CGSizeMake(263, 45));
    }];
    loginBtn.alpha = 1;
    //    [loginBtn setBackgroundImage:PEImage(@"confirm") forState:UIControlStateNormal];
    //    [loginBtn setBackgroundImage:PEImage(@"confirm") forState:UIControlStateHighlighted];
    [loginBtn setTitle:@"SignIn" forState:UIControlStateNormal];
    
    [loginBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 注册账号
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [maskImgView addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.left.equalTo(maskImgView.mas_left).with.offset(55.5);
        make.centerX.equalTo(loginBtn);
        make.top.equalTo(loginBtn.mas_bottom).with.offset(30.5);
        //        make.size.mas_equalTo(CGSizeMake(55, 12.5));
    }];
    registerBtn.alpha = 1;
    [registerBtn setTitle:@"Login" forState:UIControlStateNormal];
    NSMutableAttributedString *attrs1 = [[NSMutableAttributedString alloc] initWithString:registerBtn.currentTitle];
    [attrs1 addAttribute:NSFontAttributeName value:FontSize(15, ScreenWidth) range:[registerBtn.currentTitle rangeOfString:registerBtn.currentTitle]];
    [attrs1 addAttribute:NSForegroundColorAttributeName value:UIColor.whiteColor range:[registerBtn.currentTitle rangeOfString:registerBtn.currentTitle]];
    [registerBtn setAttributedTitle:attrs1 forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
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
- (void)loginBtnClick:(UIButton *)sender {
//    NSLog(@"=====登录=====");
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 注册
- (void)registerBtnClick:(UIButton *)sender {
//    NSLog(@"=====注册=====");
    sender.enabled = NO;
    if ([CommonClass isBlankString:self.usrName.text]) {
        [MBProgressHUD showTipMessageInWindow:@"Username cannot be empty"];
        sender.enabled = YES;
        return;
    }
    if ([CommonClass isBlankString:self.usrPwd.text]) {
        sender.enabled = YES;
        [MBProgressHUD showTipMessageInWindow:@"Password cannot be empty"];
        return;
    }
    [MIHttpTool Post:SHRegister parameters:@{@"user_name":self.usrName.text,@"password":self.usrPwd.text} success:^(id responseObject) {
        sender.enabled = YES;
        if ([responseObject[@"status"] integerValue] == 1) {
//            [MBProgressHUD showTipMessageInWindow:@"Sign In Success"];
            [self.navigationController popViewControllerAnimated:YES];
            if (self.block) {
                self.block(self.usrName.text, self.usrPwd.text);
            }
        }else{
            
        }
        [MBProgressHUD showTipMessageInWindow:responseObject[@"msg"]];
    } failure:^(NSError *error) {
        sender.enabled = YES;
        
    }];
}

- (void)closeBtnClicked{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
