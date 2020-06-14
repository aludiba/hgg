//
//  MIMoreHeaderView.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIMoreHeaderView.h"

@interface MIMoreHeaderView ()
@property (nonatomic, strong) UIImageView * iconImageView;
@property (nonatomic, strong) UILabel * nickLabel;
@property (nonatomic, strong) UIImageView * arrowImageView;
@end

@implementation MIMoreHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.iconImageView = [[UIImageView alloc] initWithImage:PEImage(@"")];
        self.iconImageView.layer.cornerRadius = 30;
        self.iconImageView.layer.masksToBounds = YES;
        [self addSubview:self.iconImageView];
        self.iconImageView.sd_layout
        .centerXEqualToView(self)
        .centerYEqualToView(self)
        .widthIs(60)
        .heightEqualToWidth();
        self.iconImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self.iconImageView addGestureRecognizer:tap];
        
        self.nickLabel = [[UILabel alloc] init];
        self.nickLabel.text = @"No login";
        self.nickLabel.hidden = YES;
        self.nickLabel.userInteractionEnabled = YES;
        [self.nickLabel addGestureRecognizer:tap];
        self.nickLabel.textColor = UIColor.whiteColor;
        self.nickLabel.font = FontSize(18, ScreenWidth);
        [self addSubview:self.nickLabel];
        self.nickLabel.sd_layout
        .leftSpaceToView(self.iconImageView, 13)
        .centerYEqualToView(self.iconImageView)
        .autoHeightRatio(0)
        .rightSpaceToView(self, 50);

        self.arrowImageView = [[UIImageView alloc] initWithImage:PEImage(@"PEArrow")];
        self.arrowImageView.hidden = YES;
        [self addSubview:self.arrowImageView];
        self.arrowImageView.sd_layout
        .rightSpaceToView(self, 15)
        .centerYEqualToView(self.iconImageView)
        .heightEqualToWidth()
        .widthIs(20);
    }
    return self;
}

- (void)tap:(UITapGestureRecognizer *)tap{
    if (self.block) {
        self.block();
    }
}

- (void)updateViews{
    if (UserId) {
        self.nickLabel.text = [UserDefaults objectForKey:@"nickName"];
        self.iconImageView.image = PEImage(@"logo");
        self.arrowImageView.hidden = YES;
    }else{
        self.nickLabel.text = @"No Login";
//        self.iconImageView.image = PEImage(@"Header");
        self.iconImageView.image = PEImage(@"logo");
        self.arrowImageView.hidden = YES;
    }
    
}

@end
