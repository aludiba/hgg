//
//  MITagsDetailCell.m
//  MagicImage
//
//  Created by woqingke on 2019/5/2.
//  Copyright © 2019 April. All rights reserved.
//

#import "MITagsDetailCell.h"
#import "MITagsModel.h"
@interface MITagsDetailCell ()
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * contentLabel;
@end

@implementation MITagsDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = UIColor.clearColor;
        UIImageView * bgImageView = [[UIImageView alloc] init];
        bgImageView.backgroundColor = UIColor.whiteColor;
        bgImageView.layer.cornerRadius = 10;
        bgImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:bgImageView];
        bgImageView.sd_layout
        .leftSpaceToView(self.contentView, 5)
        .rightSpaceToView(self.contentView, 5)
        .topSpaceToView(self.contentView, 5)
        .bottomSpaceToView(self.contentView, 5);
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = UIColor.blackColor;
        self.titleLabel.font = FontBoldSize(18, ScreenWidth);
        [self.contentView addSubview:self.titleLabel];
        self.titleLabel.sd_layout
        .leftSpaceToView(self.contentView, 15)
        .autoHeightRatio(0)
        .rightSpaceToView(self.contentView, 80)
        .topSpaceToView(self.contentView, 15);
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.textColor = UIColor.grayColor;
        self.contentLabel.font = FontBoldSize(16, ScreenWidth);
        [self.contentView addSubview:self.contentLabel];
        self.contentLabel.sd_layout
        .leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .topSpaceToView(self.titleLabel, 10)
        .autoHeightRatio(0);
        
        UIButton * copyBtn = [[UIButton alloc] init];
        copyBtn.tag = 300;
        [copyBtn setTitle:@"Copy" forState:UIControlStateNormal];
        [copyBtn setTitleColor:UIColor.orangeColor forState:UIControlStateNormal];
        [copyBtn addTarget:self action:@selector(copyBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        copyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        copyBtn.layer.borderColor = UIColor.orangeColor.CGColor;
        copyBtn.layer.borderWidth = 0.5;
        copyBtn.layer.cornerRadius = 8;
        copyBtn.layer.masksToBounds = YES;
        [self.contentView addSubview:copyBtn];
        copyBtn.sd_layout
        .rightSpaceToView(self.contentView, 15)
        .centerYEqualToView(self.titleLabel)
        .widthIs(60)
        .heightIs(25);
        
        UIButton * sharBtn = [[UIButton alloc] init];
        [sharBtn setTitle:@"Share" forState:UIControlStateNormal];
        sharBtn.tag = 300+1;
        [sharBtn setTitleColor:UIColor.orangeColor forState:UIControlStateNormal];
        [sharBtn addTarget:self action:@selector(copyBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        sharBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        sharBtn.layer.borderColor = UIColor.orangeColor.CGColor;
        sharBtn.layer.borderWidth = 0.5;
        sharBtn.layer.cornerRadius = 8;
        sharBtn.layer.masksToBounds = YES;
        [self.contentView addSubview:sharBtn];
        sharBtn.sd_layout
        .rightSpaceToView(copyBtn, 5)
        .centerYEqualToView(self.titleLabel)
        .widthIs(60)
        .heightIs(25);
        
        
        UIView * lineView = [[UIView alloc] init];
        lineView.backgroundColor = UIColor.groupTableViewBackgroundColor;
        [self.contentView addSubview:lineView];
        lineView.sd_layout
        .leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .bottomEqualToView(self.contentView)
        .heightIs(1);
        
        [self setupAutoHeightWithBottomView:self.contentLabel bottomMargin:10];
        
    }
    return self;
}

- (void)copyBtnClicked:(UIButton *)sender{
    if (self.block) {
        self.block(sender.tag -300);
    }
}

- (void)setModel:(MITagsModel *)model{
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.content;
}

@end
