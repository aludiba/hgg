//
//  MIFilterCell.m
//  MagicImage
//
//  Created by MagicImage on 2019/5/1.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIFilterCell.h"
#import "MIHomeModel.h"
@interface MIFilterCell ()
@property (nonatomic, strong) UIImageView * bgImageView;
@property (nonatomic, strong) UILabel * titleLabel;
@end

@implementation MIFilterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.bgImageView = [[UIImageView alloc] init];
        self.bgImageView.layer.cornerRadius = 10;
        self.bgImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.bgImageView];
        self.bgImageView.sd_layout
        .leftSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 10)
        .rightSpaceToView(self.contentView, 15)
        .bottomSpaceToView(self.contentView, 30);
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = FontBoldSize(16, ScreenWidth);
        self.titleLabel.textColor = UIColor.blackColor;
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.sd_layout
        .leftEqualToView(self.bgImageView)
        .topSpaceToView(self.bgImageView, 5)
        .autoHeightRatio(0);
        [self.titleLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth];
        
//        self.priceLabel = [[UILabel alloc] init];
//        self.priceLabel.font = FontBoldSize(15, ScreenWidth);
//        self.priceLabel.textColor = UIColor.orangeColor;
//        [self.contentView addSubview:self.priceLabel];
//        self.priceLabel.sd_layout
//        .rightEqualToView(self.iconImageView)
//        .centerYEqualToView(self.titleLabel)
//        .autoHeightRatio(0);
//        [self.priceLabel setSingleLineAutoResizeWithMaxWidth:180];
//        
//        self.coinsImageView = [[UIImageView alloc] initWithImage:PEImage(@"yb")];
//        [self.contentView addSubview:self.coinsImageView];
//        self.coinsImageView.sd_layout
//        .rightSpaceToView(self.priceLabel, 2)
//        .centerYEqualToView(self.priceLabel)
//        .heightIs(20)
//        .widthEqualToHeight();
        
        
    }
    return self;
}

- (void)setModel:(MIHomeModel *)model{
    _model = model;
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:model.pic_url_z]];
    self.titleLabel.text = model.title;
}

@end
