//
//  MIHomeSectionTowCell.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "BKMIHomeSectionTowCell.h"
#import "BKMIHomeModel.h"
@interface BKMIHomeSectionTowCell ()
@property (nonatomic, strong) UIImageView * BKiconImageView;
@property (nonatomic, strong) UILabel *BKtitleLabel;
@property (nonatomic, strong) UILabel *BKpriceLabel;
@property (nonatomic, strong) UIImageView *BKcoinsImageView;
@end


@implementation BKMIHomeSectionTowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)BKstyle reuseIdentifier:(NSString *)BKreuseIdentifier{
    if (self = [super initWithStyle:BKstyle reuseIdentifier:BKreuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.BKiconImageView = [[UIImageView alloc] init];
        self.BKiconImageView.layer.cornerRadius = 10;
        self.BKiconImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.BKiconImageView];
        self.BKiconImageView.sd_layout
        .leftSpaceToView(self.contentView, 15)
        .topSpaceToView(self.contentView, 10)
        .rightSpaceToView(self.contentView, 15)
        .bottomSpaceToView(self.contentView, 30);
        
        self.BKtitleLabel = [[UILabel alloc] init];
        self.BKtitleLabel.font = FontBoldSize(16, ScreenWidth);
        self.BKtitleLabel.textColor = UIColor.blackColor;
        [self.contentView addSubview:self.BKtitleLabel];
        self.BKtitleLabel.sd_layout
        .leftEqualToView(self.BKiconImageView)
        .topSpaceToView(self.BKiconImageView, 5)
        .autoHeightRatio(0);
        [self.BKtitleLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth];
        
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


- (void)setBKmodel:(BKMIHomeModel *)BKmodel{
    _BKmodel = BKmodel;
    [self.BKiconImageView sd_setImageWithURL:[NSURL URLWithString:BKmodel.BKpic_url_c]];
    self.BKtitleLabel.text = BKmodel.BKtitle;
    
}

@end
