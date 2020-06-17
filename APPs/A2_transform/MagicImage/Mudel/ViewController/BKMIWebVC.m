//
//  MIWebVC.m
//  MagicImage
//
//  Created by woqingke on 2019/5/2.
//  Copyright © 2019 April. All rights reserved.
//

#import "BKMIWebVC.h"
#import <WebKit/WebKit.h>
@interface BKMIWebVC ()
@property (nonatomic, strong) WKWebView *BKmywebView;
@end

@implementation BKMIWebVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.BKmywebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-NavBarHeight)];
    [self.view addSubview:self.BKmywebView];
    NSURLRequest *BKrequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.BKurlStr]];
    [self.BKmywebView loadRequest:BKrequest];
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
