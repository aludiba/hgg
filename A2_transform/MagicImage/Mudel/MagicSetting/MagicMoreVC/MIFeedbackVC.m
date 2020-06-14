//
//  MIFeedbackVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIFeedbackVC.h"
#import "FSTextView.h"
@interface MIFeedbackVC ()
@property (nonatomic, strong) FSTextView * textView;
@end

@implementation MIFeedbackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FeedBack";
    self.view.backgroundColor = UIColor.whiteColor;
    [self creatUI];
}

-(void)creatUI{
    
    self.textView=[FSTextView new];
    self.textView.backgroundColor=RGB(240, 240, 240);
    self.textView.placeholder=@"Please enter what you want to say.";
    self.textView.layer.cornerRadius=5;
    self.textView.clipsToBounds=YES;
    [self.view addSubview: self.textView];
    self.textView.sd_layout
    .leftSpaceToView(self.view, 15)
    .rightSpaceToView(self.view, 15)
    .topSpaceToView(self.view, 20)
    .heightIs(250);
    
    UIButton * sendBtn = [[UIButton alloc] init];
    [sendBtn setTitle:@"Submit" forState:UIControlStateNormal];
    [sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sendBtn.backgroundColor = RGB(62, 85, 250);
    sendBtn.layer.cornerRadius = 10;
    sendBtn.clipsToBounds = YES;
    [self.view addSubview:sendBtn];
    [sendBtn addTarget:self action:@selector(sendrFeedBackClicked) forControlEvents:UIControlEventTouchUpInside];
    sendBtn.sd_layout
    .leftSpaceToView(self.view, 30)
    .rightSpaceToView(self.view, 30)
    .topSpaceToView(self.textView, 20)
    .heightIs(40);
}

-(void)sendrFeedBackClicked{
    if (self.textView.text.length==0) {
        
        [MBProgressHUD showTipMessageInWindow:@"Please enter your feedback"];
        return ;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD showTipMessageInWindow:@"Feedback success"];
        [self.navigationController popViewControllerAnimated:YES];
    });
    
}

@end
