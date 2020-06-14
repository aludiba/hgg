//
//  MIFilterDetialCell.m
//  MagicImage
//
//  Created by woqingke on 2019/5/2.
//  Copyright © 2019 April. All rights reserved.
//

#import "MIFilterDetialCell.h"

@interface MIFilterDetialCell ()
@property (nonatomic, strong) UIImageView * iconImageView;
@end

@implementation MIFilterDetialCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconImageView];
        
        self.iconImageView.sd_layout
        .leftEqualToView(self.contentView)
        .topEqualToView(self.contentView)
        .rightEqualToView(self.contentView)
        .bottomEqualToView(self.contentView);
        
    }
    return self;
}

- (void)setImageUrl:(NSString *)imageUrl{
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
}

@end
