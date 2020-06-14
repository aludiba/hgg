//
//  MIHomeHeaderView.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIHomeHeaderView.h"

@implementation MIHomeHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.picImageView = [[UIImageView alloc] init];
        self.picImageView.layer.cornerRadius = 8;
        self.picImageView.layer.masksToBounds = YES;
        [self addSubview:self.picImageView];
        self.picImageView.sd_layout
        .leftSpaceToView(self, 10)
        .rightSpaceToView(self, 10)
        .topSpaceToView(self, 5)
        .bottomSpaceToView(self, 5);
    }
    return self;
}
@end
