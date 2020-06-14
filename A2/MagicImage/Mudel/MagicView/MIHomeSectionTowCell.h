//
//  MIHomeSectionTowCell.h
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MIHomeModel;
NS_ASSUME_NONNULL_BEGIN

@interface MIHomeSectionTowCell : UITableViewCell
//@property (nonatomic, copy) void (^block)(NSInteger tag);


@property (nonatomic, strong) MIHomeModel * model;
@end

NS_ASSUME_NONNULL_END
