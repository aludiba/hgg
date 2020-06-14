//
//  MIHomeSectionOneCell.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/29.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIHomeSectionOneCell.h"
#import "MIHomeView.h"
#import "MIHomeToolsView.h"
@implementation MIHomeSectionOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        MIHomeView * homeView = [[MIHomeView alloc] init];
        KWeakSelf(self);
        homeView.block = ^(NSInteger tag) {
            weakself.block(tag);
        };
        [self.contentView addSubview:homeView];
        
        homeView.sd_layout
        .leftSpaceToView(self.contentView, 10)
        .rightSpaceToView(self.contentView, 10)
        .topSpaceToView(self.contentView, 0)
        .heightIs((ScreenWidth-20)*3/5);
        
        MIHomeToolsView * bottomView = [[MIHomeToolsView alloc] init];
        bottomView.block = ^(NSInteger tag) {
            weakself.block(tag);
        };
        [self.contentView addSubview:bottomView];
        bottomView.sd_layout
        .leftEqualToView(homeView)
        .rightEqualToView(homeView)
        .bottomSpaceToView(self.contentView, 5)
        .heightIs((ScreenWidth-20)/5);
        
    }
    return self;
}



@end
