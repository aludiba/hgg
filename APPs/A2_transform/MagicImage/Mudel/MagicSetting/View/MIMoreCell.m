//
//  MIMoreCell.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIMoreCell.h"

@interface MIMoreCell ()

@end

@implementation MIMoreCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = FontSize(16, ScreenWidth);
        self.titleLabel.textColor = UIColor.blackColor;
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.sd_layout
        .leftSpaceToView(self.contentView, 10)
        .centerYEqualToView(self.contentView)
        .autoHeightRatio(0);
        [self.titleLabel setSingleLineAutoResizeWithMaxWidth:180];
        
        
        UIImageView * arrowView = [[UIImageView alloc] initWithImage:PEImage(@"PEArrow")];
        [self.contentView addSubview:arrowView];
        arrowView.sd_layout
        .rightSpaceToView(self.contentView, 15)
        .centerYEqualToView(self.contentView)
        .widthEqualToHeight()
        .heightIs(20);
        
    }
    return self;
}

@end
