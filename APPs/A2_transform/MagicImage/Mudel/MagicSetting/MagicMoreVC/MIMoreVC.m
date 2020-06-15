//
//  MIMoreVC.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIMoreVC.h"
#import "MIMoreHeaderView.h"
#import "MIMoreCell.h"
#import "MIFeedbackVC.h"
#import "MILoginVC.h"
@interface MIMoreVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * titleArray;
@property (nonatomic, strong) NSArray * imageArray;
@property (nonatomic, strong) MIMoreHeaderView * headerView;
@end

@implementation MIMoreVC

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = RGB(242, 242, 242);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
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
    self.view.backgroundColor = RGB(242, 242, 242);

    [self.view addSubview:self.tableView];
    self.tableView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .topEqualToView(self.view).offset(-StatusBarHeight)
    .bottomEqualToView(self.view);
    
    
    MIMoreHeaderView * headerView = [[MIMoreHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScareValue(160, ScreenWidth))];
    self.headerView = headerView;
    [headerView updateViews];
    if (@available(iOS 9.0, *)) {
        headerView.backgroundColor = [UIColor systemGreenColor];
    } else {
        headerView.backgroundColor = [UIColor greenColor];
    }
    headerView.block = ^{
        if (!UserId) {
            MILoginVC * logVC = [[MILoginVC alloc] init];
            UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:logVC];
            [self presentViewController:navi animated:YES completion:nil];
            
        }
    };
    self.tableView.tableHeaderView = headerView;
    
    UILabel * bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    bottomLabel.textColor = UIColor.grayColor;
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    bottomLabel.font = [UIFont systemFontOfSize:12];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    bottomLabel.text = [NSString stringWithFormat:@"Version:%@",[infoDictionary objectForKey:@"CFBundleShortVersionString"]];
    self.tableView.tableFooterView = bottomLabel;
    
    
    
    
//    self.titleArray = @[@[@"Feed Back",@"Contact Us",@"Share"],@[@"Terms Of Service",@"Privacy Policy",@"Login Out"]];
    self.titleArray = @[@[@"Feed Back",@"Contact Us",@"Share"],@[@"Terms Of Service",@"Privacy Policy"]];

//    self.imageArray = @[@[@"feed",@"contact",@"share"],@[@"termsOfService",@"privacyPolicy",@"loginOut"]];
    self.imageArray = @[@[@"feed",@"contact",@"share"],@[@"termsOfService",@"privacyPolicy"]];

    [NotifiCenter addObserver:self selector:@selector(loadData) name:@"loginSuccess" object:nil];
    
}

- (void)loadData{
    [self.headerView updateViews];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.imageArray[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MIMoreCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MIMoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.titleLabel.text = self.titleArray[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            MIFeedbackVC * feedback = [[MIFeedbackVC alloc] init];
            [self.navigationController pushViewController:feedback animated:YES];
            
            
        }else if (indexPath.row == 1){
            
            NSString *mailStr = [NSString stringWithFormat:@"mailto://%@",@"photoedit7a@163.com"];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailStr]];
        }else{
            [self share];
        }
    }else{
        if (indexPath.row == 0) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/index/newp.picphotopicda2a/termsDetail",LSBaseUrl]] ];
        }else if (indexPath.row == 1){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/index/newp.picphotopicda2a/privacyDetail",LSBaseUrl]] ];
        }else{
            [UserDefaults removeObjectForKey:@"user_id"];
            [UserDefaults synchronize];
            [[NSNotificationCenter  defaultCenter] postNotificationName:@"loginOut" object:nil];
            MILoginVC * logVC = [[MILoginVC alloc] init];
            UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:logVC];
            [self presentViewController:navi animated:YES completion:nil];
            [self.headerView updateViews];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (void)share{
    
    NSString *textToShare;
    NSString * contextShare;
    UIImage *imageToShare;
    textToShare = @"Get More Pic Collage Edit";
    contextShare = @"https://www.apple.com/cn/itunes";
    imageToShare = [UIImage imageNamed:@"AppIcon"];
    NSURL *urlToShare = [NSURL URLWithString:contextShare];
    NSArray *activityItems = @[textToShare,imageToShare,urlToShare];
    

    NSArray *activities = @[];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:activities];

    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0){
        //初始化回调方法
        UIActivityViewControllerCompletionWithItemsHandler myBlock = ^(NSString *activityType,BOOL completed,NSArray *returnedItems,NSError *activityError)
        {
            NSLog(@"activityType :%@", activityType);
            if (completed)
            {
                NSLog(@"completed");
            }
            else
            {
                NSLog(@"cancel");
            }
            
        };
        
        // 初始化completionHandler，当post结束之后（无论是done还是cancell）该blog都会被调用
        activityVC.completionWithItemsHandler = myBlock;
    }else{
        
        UIActivityViewControllerCompletionHandler myBlock = ^(NSString *activityType,BOOL completed)
        {
            NSLog(@"activityType :%@", activityType);
            if (completed)
            {
                NSLog(@"completed");
            }
            else
            {
                NSLog(@"cancel");
            }
            
        };
        // 初始化completionHandler，当post结束之后（无论是done还是cancell）该blog都会被调用
        activityVC.completionHandler = myBlock;
    }

    activityVC.excludedActivityTypes = @[];
    
    //在展现view controller时，必须根据当前的设备类型，使用适当的方法。在iPad上，必须通过popover来展现view controller。在iPhone和iPodtouch上，必须以模态的方式展现。
    [self presentViewController:activityVC animated:YES completion:nil];
    
}
@end

