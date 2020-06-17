//
//  MIHomeSectionOneCell.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/29.
//  Copyright © 2019 April. All rights reserved.
//

#import "BKMIHomeSectionOneCell.h"
#import "BKMIHomeView.h"
#import "BKMIHomeToolsView.h"
@implementation BKMIHomeSectionOneCell
- (instancetype)initWithStyle:(UITableViewCellStyle)BKstyle reuseIdentifier:(NSString *)BKreuseIdentifier{
    if (self = [super initWithStyle:BKstyle reuseIdentifier:BKreuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        BKMIHomeView *BKhomeView = [[BKMIHomeView alloc] init];
        KWeakSelf(self);
        BKhomeView.block = ^(NSInteger tag) {
            weakself.block(tag);
        };
        [self.contentView addSubview:BKhomeView];
        
        BKhomeView.sd_layout
        .leftSpaceToView(self.contentView, 10)
        .rightSpaceToView(self.contentView, 10)
        .topSpaceToView(self.contentView, 0)
        .heightIs((ScreenWidth-20)*3/5);
        
        BKMIHomeToolsView *BKbottomView = [[BKMIHomeToolsView alloc] init];
        BKbottomView.block = ^(NSInteger tag) {
            weakself.block(tag);
        };
        [self.contentView addSubview:BKbottomView];
        BKbottomView.sd_layout
        .leftEqualToView(BKhomeView)
        .rightEqualToView(BKhomeView)
        .bottomSpaceToView(self.contentView, 5)
        .heightIs((ScreenWidth-20)/5);
    }
    return self;
}
@end
