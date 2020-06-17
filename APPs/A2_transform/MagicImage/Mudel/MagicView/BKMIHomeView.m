//
//  MIHomeView.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/29.
//  Copyright © 2019 April. All rights reserved.
//

#import "BKMIHomeView.h"

@implementation BKMIHomeView

- (instancetype)initWithFrame:(CGRect)BKframe{
    if (self = [super initWithFrame:BKframe]) {
        CGFloat BKw = (ScreenWidth-20)/2;
        CGFloat BKh = BKw * 3/5-5;
        NSArray *BKtitleArray = @[@"Camera",@"Sticker",@"Tailor",@"Filter"];
        NSArray *BKimageArray = @[@"CAMERA",@"STICKER",@"TAILOR",@"FILTER"];
        NSArray *BKcolorArray = @[[UIColor redColor],[UIColor orangeColor],[UIColor blueColor],[UIColor greenColor]];
        NSArray *BKcontentArray = @[@"Quick beautiful",@"Rapid concise",@"Optional size",@"Scene change"];
        
        for (NSInteger BKi = 0; BKi < 4; BKi++) {
            UIView * BKbgView = [[UIView alloc] initWithFrame:CGRectMake((BKi%2) * BKw, (BKi / 2) * BKh, BKw, BKh)];
            [self addSubview:BKbgView];
            
            UIImageView *BKiconImageView = [[UIImageView alloc] initWithImage:PEImage(@"")];
            BKiconImageView.backgroundColor = BKcolorArray[BKi];
            BKiconImageView.layer.cornerRadius = 6;
            BKiconImageView.tag = 100 + BKi;
            BKiconImageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *BKtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BKtap:)];
            [BKiconImageView addGestureRecognizer:BKtap];
            [BKbgView addSubview:BKiconImageView];
            BKiconImageView.sd_layout
            .leftSpaceToView(BKbgView, 5)
            .rightSpaceToView(BKbgView, 5)
            .bottomSpaceToView(BKbgView, 0)
            .topSpaceToView(BKbgView, 18);
            
            UILabel *BKtitleLabel = [[UILabel alloc] init];
            BKtitleLabel.font = FontBoldSize(18, ScreenWidth);
            BKtitleLabel.textColor = UIColor.whiteColor;
            BKtitleLabel.text = BKtitleArray[BKi];
            [BKiconImageView addSubview:BKtitleLabel];
            BKtitleLabel.sd_layout
            .leftSpaceToView(BKiconImageView, ScareValue(10, ScreenWidth))
            .centerYEqualToView(BKiconImageView).offset(-10)
            .autoHeightRatio(0);
            [BKtitleLabel setSingleLineAutoResizeWithMaxWidth:180];
            
            UILabel *BKcontentLabel = [[UILabel alloc] init];
            BKcontentLabel.textColor = UIColor.whiteColor;
            BKcontentLabel.text = BKcontentArray[BKi];
            BKcontentLabel.font = FontSize(12, ScreenWidth);
            [BKiconImageView addSubview:BKcontentLabel];
            BKcontentLabel.sd_layout
            .leftEqualToView(BKtitleLabel)
            .centerYEqualToView(BKiconImageView).offset(10)
            .autoHeightRatio(0);
            [BKcontentLabel setSingleLineAutoResizeWithMaxWidth:180];
            
            UIImageView *BKleftImageView = [[UIImageView alloc] initWithImage:PEImage(BKimageArray[BKi])];
            BKleftImageView.layer.cornerRadius = 5;
            BKleftImageView.layer.masksToBounds = YES;
            [BKiconImageView addSubview:BKleftImageView];
            BKleftImageView.sd_layout
            .rightSpaceToView(BKiconImageView, 7)
            .centerYEqualToView(BKiconImageView)
            .widthIs(ScareValue(55, ScreenWidth))
            .heightEqualToWidth();
            
            if (BKi == 0) {
                UIImageView *BKhotImageView = [[UIImageView alloc] initWithImage:PEImage(@"c")];
                [BKbgView addSubview:BKhotImageView];
                BKhotImageView.sd_layout
                .rightSpaceToView(BKbgView, 7)
                .topEqualToView(BKiconImageView).offset(-18)
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
