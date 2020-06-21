#import "BKMIHomeToolsView.h"
@implementation BKMIHomeToolsView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        CGFloat BKw = (ScreenWidth - 20)/2;
        CGFloat BKh = BKw * 2/5;
        NSArray * BKimageArray = @[@"a",@"b"];
        NSArray * BKtitleArray = @[@"Photo",@"Hottags"];
        NSArray * BKcontentArray = @[@"Beautiful you",@"Hot post tag"];
        for (NSInteger BKi = 0; BKi < 2; BKi++) {
            UIView *BKbgView = [[UIView alloc] init];
            BKbgView.userInteractionEnabled = YES;
            BKbgView.tag = 104 + BKi;
            UITapGestureRecognizer *BKtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BKtap:)];
            [BKbgView addGestureRecognizer:BKtap];
            [self addSubview:BKbgView];
            BKbgView.sd_layout
            .leftSpaceToView(self, BKi * BKw)
            .topEqualToView(self)
            .widthIs(BKw)
            .heightIs(BKh);
            UIView * BKoneView = [[UIView alloc] init];
            [BKbgView addSubview:BKoneView];
            BKoneView.sd_layout
            .leftSpaceToView(BKbgView, 0)
            .topEqualToView(BKbgView)
            .rightSpaceToView(BKbgView, 0)
            .bottomEqualToView(BKbgView);
            UIImageView * BKiconImageView = [[UIImageView  alloc] initWithImage:PEImage(BKimageArray[BKi])];
            [BKoneView addSubview:BKiconImageView];
            BKiconImageView.sd_layout
            .rightSpaceToView(BKoneView, 15)
            .centerYEqualToView(BKoneView)
            .widthIs(55)
            .heightIs(50);
            UILabel * BKtitleLabel = [[UILabel alloc] init];
            BKtitleLabel.font = FontBoldSize(17, ScreenWidth);
            BKtitleLabel.textColor = UIColor.blackColor;
            BKtitleLabel.text = BKtitleArray[BKi];
            [BKoneView addSubview:BKtitleLabel];
            BKtitleLabel.sd_layout
            .leftSpaceToView(BKoneView, 15)
            .centerYEqualToView(BKoneView).offset(-10)
            .autoHeightRatio(0);
            [BKtitleLabel setSingleLineAutoResizeWithMaxWidth:180];
            UILabel * BKcontentLabel = [[UILabel alloc] init];
            BKcontentLabel.font = FontSize(13, ScreenWidth);
            BKcontentLabel.textColor = UIColor.grayColor;
            BKcontentLabel.text = BKcontentArray[BKi];
            [BKoneView addSubview:BKcontentLabel];
            BKcontentLabel.sd_layout
            .leftEqualToView(BKtitleLabel)
            .centerYEqualToView(BKoneView).offset(10)
            .autoHeightRatio(0);
            [BKcontentLabel setSingleLineAutoResizeWithMaxWidth:190];
        }
    }
    return self;
}
- (void)BKtap:(UITapGestureRecognizer *)BKtap{
    if (self.block) {
        self.block(BKtap.view.tag-100);
    }
}
@end
