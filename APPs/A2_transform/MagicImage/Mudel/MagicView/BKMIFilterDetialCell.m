//
//  MIFilterDetialCell.m
//  MagicImage
//
//  Created by woqingke on 2019/5/2.
//  Copyright © 2019 April. All rights reserved.
//

#import "BKMIFilterDetialCell.h"

@interface BKMIFilterDetialCell ()
@property (nonatomic, strong) UIImageView *BKiconImageView;
@end

@implementation BKMIFilterDetialCell


- (instancetype)initWithStyle:(UITableViewCellStyle)BKstyle reuseIdentifier:(NSString *)BKreuseIdentifier{
    if (self = [super initWithStyle:BKstyle reuseIdentifier:BKreuseIdentifier]) {
        
        self.BKiconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.BKiconImageView];
        
        self.BKiconImageView.sd_layout
        .leftEqualToView(self.contentView)
        .topEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .bottomEqualToView(self.contentView);
        
    }
    return self;
}

- (void)setBKimageUrl:(NSString *)BKimageUrl{
    [self.BKiconImageView sd_setImageWithURL:[NSURL URLWithString:BKimageUrl]];
}

@end
