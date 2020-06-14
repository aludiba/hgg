//
//  MIWebVC.m
//  MagicImage
//
//  Created by woqingke on 2019/5/2.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIWebVC.h"
#import <WebKit/WebKit.h>
@interface MIWebVC ()
@property (nonatomic, strong) WKWebView * mywebView;
@end

@implementation MIWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.mywebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-NavBarHeight)];
    [self.view addSubview:self.mywebView];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
    [self.mywebView loadRequest:request];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
