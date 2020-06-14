//
//  MIStickerDetailCell.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIStickerDetailCell.h"
@interface MIStickerDetailCell ()
@property (nonatomic, strong) UIImageView * iconImageView;
@end
@implementation MIStickerDetailCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.iconImageView = [[UIImageView alloc] init];
        [self addSubview:self.iconImageView];
        self.iconImageView.sd_layout
        .leftEqualToView(self)
        .rightEqualToView(self)
        .topEqualToView(self)
        .bottomEqualToView(self);
        
    }
    return self;
}
- (void)setPicUrl:(NSString *)picUrl{
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:picUrl] placeholderImage:nil];
}
@end
