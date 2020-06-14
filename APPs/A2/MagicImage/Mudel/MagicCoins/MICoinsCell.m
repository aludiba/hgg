//
//  MICoinsCell.m
//  MagicImage
//
//  Created by MagicImage on 2019/5/1.
//  Copyright © 2019 April. All rights reserved.
//

#import "MICoinsCell.h"
#import "MICoinsModel.h"
@interface MICoinsCell ()
@property (nonatomic, strong) UILabel * coinsLabel;
@property (nonatomic, strong) UILabel * numberLabel;
@end

@implementation MICoinsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIView * bgView = [[UIView alloc] init];
        bgView.layer.cornerRadius = 10;
        bgView.layer.masksToBounds = YES;
        bgView.backgroundColor = UIColor.whiteColor;
        [self.contentView addSubview:bgView];
        bgView.sd_layout
        .leftSpaceToView(self.contentView, 10)
        .rightSpaceToView(self.contentView, 10)
        .topSpaceToView(self.contentView, 5)
        .bottomSpaceToView(self.contentView, 5);
        
        UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yb"]];
        [bgView addSubview:imageView];
        imageView.sd_layout
        .leftSpaceToView(bgView, 10)
        .centerYEqualToView(bgView)
        .heightIs(25)
        .widthIs(25);
        
        self.coinsLabel = [[UILabel alloc] init];
        self.coinsLabel.font = [UIFont systemFontOfSize:14];
        self.coinsLabel.textColor = [UIColor blackColor];
        [bgView addSubview:self.coinsLabel];
        self.coinsLabel.sd_layout
        .leftSpaceToView(imageView, 5)
        .centerYEqualToView(imageView)
        .autoHeightRatio(0);
        [self.coinsLabel setSingleLineAutoResizeWithMaxWidth:180];
        
        self.numberLabel = [[UILabel alloc] init];
        self.numberLabel.textColor = [UIColor orangeColor];
        self.numberLabel.font = [UIFont systemFontOfSize:14];
        [bgView addSubview:self.numberLabel];
        self.numberLabel.sd_layout
        .rightSpaceToView(bgView, 10)
        .centerYEqualToView(bgView)
        .autoHeightRatio(0);
        [self.numberLabel setSingleLineAutoResizeWithMaxWidth:180];
        
        
    }
    return self;
}

- (void)setModel:(MICoinsModel *)model{
    _model = model;
    
    self.numberLabel.text = [NSString stringWithFormat:@"$%@",model.goods_price];
    self.coinsLabel.text = [NSString stringWithFormat:@"X %ld",model.goods_num];
}

@end
