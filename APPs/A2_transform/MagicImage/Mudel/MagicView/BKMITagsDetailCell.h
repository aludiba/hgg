//
//  MITagsDetailCell.h
//  MagicImage
//
//  Created by woqingke on 2019/5/2.
//  Copyright © 2019 April. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BKMITagsModel;
NS_ASSUME_NONNULL_BEGIN

@interface BKMITagsDetailCell : UITableViewCell
@property (nonatomic, strong) BKMITagsModel * BKmodel;
@property (nonatomic, copy) void (^block)(NSInteger tag);
@end

NS_ASSUME_NONNULL_END
