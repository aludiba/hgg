//
//  PEMoreViewController.m
//  PhotoEditing
//
//  Created by woqingke on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "PEMoreViewController.h"

@interface PEMoreViewController ()

@end

@implementation PEMoreViewController

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
   
    
    
}


@end
