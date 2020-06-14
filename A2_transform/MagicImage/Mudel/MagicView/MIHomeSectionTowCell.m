//
//  MIHomeSectionTowCell.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIHomeSectionTowCell.h"
#import "MIHomeModel.h"
@interface MIHomeSectionTowCell ()

@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * priceLabel;
@property (nonatomic, strong) UIImageView * coinsImageView;
@end


@implementation MIHomeSectionTowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.iconImageView = [[UIImageView alloc] init];
        self.iconImageView.layer.cornerRadius = 10;
        self.iconImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.iconImageView];
        self.iconImageView.sd_layout
        .leftSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 10)
        .rightSpaceToView(self.contentView, 15)
        .bottomSpaceToView(self.contentView, 30);
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = FontBoldSize(16, ScreenWidth);
        self.titleLabel.textColor = UIColor.blackColor;
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.sd_layout
        .leftEqualToView(self.iconImageView)
        .topSpaceToView(self.iconImageView, 5)
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
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.pic_url_c]];
    self.titleLabel.text = model.title;
    
//    if (model.peanut_num.floatValue>0) {
//        self.priceLabel.text = model.peanut_num;
//        self.coinsImageView.hidden = NO;
//    }else{
//        self.priceLabel.text = @"Free";
//        self.coinsImageView.hidden = YES;
//    }
    
}

@end
