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
        
        self.iconImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:self.iconImageView];
        self.iconImageView.sd_layout
        .leftSpaceToView(self.contentView, 15)
        .centerYEqualToView(self.contentView)
        .heightIs(25)
        .widthEqualToHeight();
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = FontSize(16, ScreenWidth);
        self.titleLabel.textColor = UIColor.blackColor;
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.sd_layout
        .leftSpaceToView(self.iconImageView, 10)
        .centerYEqualToView(self.iconImageView)
        .autoHeightRatio(0);
        [self.titleLabel setSingleLineAutoResizeWithMaxWidth:180];
        
        
        UIImageView * arrowView = [[UIImageView alloc] initWithImage:PEImage(@"PEArrow")];
        [self.contentView addSubview:arrowView];
        arrowView.sd_layout
        .rightSpaceToView(self.contentView, 15)
        .centerYEqualToView(self.iconImageView)
        .widthEqualToHeight()
        .heightIs(20);
        
    }
    return self;
}

@end
