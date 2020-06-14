//
//  MITagsCell.m
//  MagicImage
//
//  Created by woqingke on 2019/5/2.
//  Copyright © 2019 April. All rights reserved.
//

#import "MITagsCell.h"
#import "MITagsModel.h"
@interface MITagsCell ()
@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * titleLabel;
@end

@implementation MITagsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = UIColor.clearColor;
        UIImageView * bgImageView = [[UIImageView alloc] init];
        bgImageView.layer.cornerRadius = 8;
        bgImageView.layer.masksToBounds = YES;
        bgImageView.backgroundColor = UIColor.whiteColor;
        [self.contentView addSubview:bgImageView];
        bgImageView.sd_layout
        .leftSpaceToView(self.contentView, 10)
        .rightSpaceToView(self.contentView, 10)
        .topSpaceToView(self.contentView, 5)
        .bottomSpaceToView(self.contentView, 0);
        
        self.iconImageView = [[UIImageView alloc] init];
        [bgImageView addSubview:self.iconImageView];
        self.iconImageView.sd_layout
        .leftSpaceToView(bgImageView, 5)
        .centerYEqualToView(bgImageView)
        .widthIs(30)
        .heightEqualToWidth();
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.textColor = UIColor.blackColor;
        [bgImageView addSubview:self.titleLabel];
        self.titleLabel.sd_layout
        .leftSpaceToView(self.iconImageView, 10)
        .centerYEqualToView(self.iconImageView)
        .autoHeightRatio(0);
        [self.titleLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth];
        
        UIImageView * arrowImageView = [[UIImageView alloc] initWithImage:PEImage(@"PEArrow")];
        [bgImageView addSubview:arrowImageView];
        arrowImageView.sd_layout
        .rightSpaceToView(bgImageView, 5)
        .centerYEqualToView(bgImageView)
        .widthIs(25)
        .heightEqualToWidth();
        
        
    }
    return self;
}

- (void)setModel:(MITagsModel *)model{
    _model = model;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.icon_url]];
    self.titleLabel.text = model.title;
    
}

@end
