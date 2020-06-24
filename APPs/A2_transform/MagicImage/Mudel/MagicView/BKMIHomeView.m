#import "BKMIHomeView.h"
#import "UIImage+GradientColor.h"
#import "UIColor+Hex.h"
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
            
            UIColor *BKColor = [UIColor colorWithHexString:@"#FEB692"];
            UIColor *BKColor1 = [UIColor colorWithHexString:@"#EA5455"];
            UIColor *BKColor2 = [UIColor colorWithHexString:@"#CE9FFC"];
            UIColor *BKColor3 = [UIColor colorWithHexString:@"#7367F0"];
            UIColor *BKColor4 = [UIColor colorWithHexString:@"#CE9FFC"];
            UIColor *BKColor5 = [UIColor colorWithHexString:@"#7367F0"];
            UIColor *BKColor6 = [UIColor colorWithHexString:@"#43CBFF"];
            UIColor *BKColor7 = [UIColor colorWithHexString:@"#9708CC"];
            UIColor *BKColor8 = [UIColor colorWithHexString:@"#FCCF31"];
            UIColor *BKColor9 = [UIColor colorWithHexString:@"#F55555"];
            UIColor *BKColor10 = [UIColor colorWithHexString:@"#65FDF0"];
            UIColor *BKColor11 = [UIColor colorWithHexString:@"#1D6FA3"];
            UIImage *bgImg = [UIImage gradientColorImageFromColors:@[BKColor,BKColor1,BKColor2,BKColor3,BKColor4,BKColor5,BKColor6,BKColor7,BKColor8,BKColor9,BKColor10,BKColor11,] gradientType:GradientTypeLeftToRight imgSize:CGSizeMake(ScreenWidth - 10,(ScreenWidth-20)*3/5)];
            [BKiconImageView setBackgroundColor:[UIColor colorWithPatternImage:bgImg]];
            
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
- (void)BKtap:(UITapGestureRecognizer *)tap{
    if (self.block) {
        self.block(tap.view.tag-100);
    }
}
@end
