//
//  MIHomeView.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/29.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIHomeView.h"

@implementation MIHomeView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        CGFloat w = (ScreenWidth-20)/2;
        CGFloat h = w*3/5-5;
        NSArray * titleArray = @[@"CAMERA",@"STICKER",@"TAILOR",@"FILTER"];
        NSArray * imageArray = @[@"CAMERA",@"STICKER",@"TAILOR",@"FILTER"];
        NSArray * colorArray = @[RGB(237, 164, 61),RGB(232, 111, 73),RGB(62, 85, 250),RGB(51, 35, 201)];
        NSArray * contentArray = @[@"Instant beauty",@"Simple fastt",@"Any size",@"Switch scene"];
        
        for (NSInteger i = 0; i<4; i++) {
            UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake((i%2)*w, (i/2)*h, w, h)];
//            bgView.backgroundColor = UIColor.redColor;
            [self addSubview:bgView];
            
            UIImageView * iconImageView = [[UIImageView alloc] initWithImage:PEImage(@"")];
            iconImageView.backgroundColor = colorArray[i];
            iconImageView.layer.cornerRadius = 6;
//            iconImageView.layer.masksToBounds = YES;
            iconImageView.tag = 100+i;
            iconImageView.userInteractionEnabled = YES;
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            [iconImageView addGestureRecognizer:tap];
            [bgView addSubview:iconImageView];
            iconImageView.sd_layout
            .leftSpaceToView(bgView, 5)
            .rightSpaceToView(bgView, 5)
            .bottomSpaceToView(bgView, 0)
            .topSpaceToView(bgView, 18);
            UILabel * titleLabel = [[UILabel alloc] init];
            titleLabel.font = FontBoldSize(18, ScreenWidth);
            titleLabel.textColor = UIColor.whiteColor;
            titleLabel.text = titleArray[i];
            [iconImageView addSubview:titleLabel];
            titleLabel.sd_layout
            .leftSpaceToView(iconImageView, ScareValue(10, ScreenWidth))
            .centerYEqualToView(iconImageView).offset(-10)
            .autoHeightRatio(0);
            [titleLabel setSingleLineAutoResizeWithMaxWidth:180];
            
            UILabel * contentLabel = [[UILabel alloc] init];
            contentLabel.textColor = UIColor.whiteColor;
            contentLabel.text = contentArray[i];
            contentLabel.font = FontSize(12, ScreenWidth);
            [iconImageView addSubview:contentLabel];
            contentLabel.sd_layout
            .leftEqualToView(titleLabel)
            .centerYEqualToView(iconImageView).offset(10)
            .autoHeightRatio(0);
            [contentLabel setSingleLineAutoResizeWithMaxWidth:180];
            
            UIImageView * leftImageView = [[UIImageView alloc] initWithImage:PEImage(imageArray[i])];
            leftImageView.layer.cornerRadius = 5;
            leftImageView.layer.masksToBounds = YES;
            [iconImageView addSubview:leftImageView];
            leftImageView.sd_layout
            .rightSpaceToView(iconImageView, 7)
            .centerYEqualToView(iconImageView)
            .widthIs(ScareValue(55, ScreenWidth))
            .heightEqualToWidth();
            
            if (i == 0) {
                UIImageView * hotImageView = [[UIImageView alloc] initWithImage:PEImage(@"c")];
                [bgView addSubview:hotImageView];
                hotImageView.sd_layout
                .rightSpaceToView(bgView, 7)
                .topEqualToView(iconImageView).offset(-18)
                .widthIs(ScareValue(40, ScreenWidth))
                .heightIs(ScareValue(25, ScreenWidth));
            }
            
        }
        
        
    }
    return self;
}
- (void)tap:(UITapGestureRecognizer *)tap{
    if (self.block) {
        self.block(tap.view.tag-100);
    }
    
}
@end
