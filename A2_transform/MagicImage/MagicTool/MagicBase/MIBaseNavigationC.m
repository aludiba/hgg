//
//  MIBaseNavigationC.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/29.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIBaseNavigationC.h"

@interface MIBaseNavigationC ()

@end

@implementation MIBaseNavigationC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count) { // 隐藏导航栏
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationController.navigationBar.hidden=NO;
        UIButton * btn  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [btn setImage:[UIImage imageNamed:@"PEBack"] forState:UIControlStateNormal];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [btn addTarget:self action:@selector(returnCustom) forControlEvents:UIControlEventTouchUpInside];
    
        // 如果自定义返回按钮后, 滑动返回可能失效, 需要添加下面的代码
        __weak typeof(viewController)Weakself = viewController;
        self.interactivePopGestureRecognizer.enabled = YES;
        self.interactivePopGestureRecognizer.delegate = (id)Weakself;
        
    }
    [super pushViewController:viewController animated:animated];
    
    
}

- (void)returnCustom{
    
    [self popViewControllerAnimated:YES];
}

@end
