//
//  MITagsDetailCell.h
//  MagicImage
//
//  Created by woqingke on 2019/5/2.
//  Copyright © 2019 April. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MITagsModel;
NS_ASSUME_NONNULL_BEGIN

@interface MITagsDetailCell : UITableViewCell
@property (nonatomic, strong) MITagsModel * model;
@property (nonatomic, copy) void (^block)(NSInteger tag);
@end

NS_ASSUME_NONNULL_END
