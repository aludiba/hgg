//
//  MIHomeToolsView.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/29.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIHomeToolsView.h"

@implementation MIHomeToolsView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor cyanColor];
        CGFloat w = (ScreenWidth-20)/2;
        CGFloat h = w*2/5;
        
        NSArray * imageArray = @[@"a",@"b"];
        NSArray * titleArray = @[@"Photo",@"Hottags"];
        NSArray * contentArray = @[@"Beautiful you",@"Hot post tag"];
        
        for (NSInteger i = 0; i<2; i++) {
            UIView * bgView = [[UIView alloc] init];
            bgView.userInteractionEnabled = YES;
            bgView.tag = 104+i;
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            [bgView addGestureRecognizer:tap];
            [self addSubview:bgView];
            bgView.sd_layout
            .leftSpaceToView(self, i*w)
            .topEqualToView(self)
            .widthIs(w)
            .heightIs(h);
            
            UIView * oneView = [[UIView alloc] init];
            [bgView addSubview:oneView];
            oneView.sd_layout
            .leftSpaceToView(bgView, 0)
            .topEqualToView(bgView)
            .rightSpaceToView(bgView, 0)
            .bottomEqualToView(bgView);
            
            UIImageView * iconImageView = [[UIImageView  alloc] initWithImage:PEImage(imageArray[i])];
            [oneView addSubview:iconImageView];
            iconImageView.sd_layout
            .rightSpaceToView(oneView, 15)
            .centerYEqualToView(oneView)
            .widthIs(55)
            .heightIs(50);
            
            UILabel * titleLabel = [[UILabel alloc] init];
            titleLabel.font = FontBoldSize(17, ScreenWidth);
            titleLabel.textColor = UIColor.blackColor;
            titleLabel.text = titleArray[i];
            [oneView addSubview:titleLabel];
            titleLabel.sd_layout
            .leftSpaceToView(oneView, 15)
            .centerYEqualToView(oneView).offset(-10)
            .autoHeightRatio(0);
            [titleLabel setSingleLineAutoResizeWithMaxWidth:180];
            
            UILabel * contentLabel = [[UILabel alloc] init];
            contentLabel.font = FontSize(13, ScreenWidth);
            contentLabel.textColor = UIColor.grayColor;
            contentLabel.text = contentArray[i];
            [oneView addSubview:contentLabel];
            contentLabel.sd_layout
            .leftEqualToView(titleLabel)
            .centerYEqualToView(oneView).offset(10)
            .autoHeightRatio(0);
            [contentLabel setSingleLineAutoResizeWithMaxWidth:190];
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
