//
//  MIStickerDetailCell.m
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import "BKMIStickerDetailCell.h"
@interface BKMIStickerDetailCell ()
@property (nonatomic, strong) UIImageView * BKiconImageView;
@end
@implementation BKMIStickerDetailCell
- (instancetype)initWithFrame:(CGRect)BKframe{
    if (self = [super initWithFrame:BKframe]) {
        
        self.BKiconImageView = [[UIImageView alloc] init];
        [self addSubview:self.BKiconImageView];
        self.BKiconImageView.sd_layout
        .leftEqualToView(self)
        .rightEqualToView(self)
        .topEqualToView(self)
        .bottomEqualToView(self);
        
    }
    return self;
}
- (void)setBKpicUrl:(NSString *)BKpicUrl{
    [self.BKiconImageView sd_setImageWithURL:[NSURL URLWithString:BKpicUrl] placeholderImage:nil];
}
@end
