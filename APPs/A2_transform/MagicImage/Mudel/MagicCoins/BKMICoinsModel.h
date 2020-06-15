//
//  MICoinsModel.h
//  MagicImage
//
//  Created by MagicImage on 2019/5/1.
//  Copyright © 2019 April. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BKMICoinsModel : NSObject
@property (nonatomic, copy) NSString * BKgoods_id;
@property (nonatomic, assign) NSInteger BKgoods_num;
@property (nonatomic, copy) NSString * BKgoods_price;
@property (nonatomic, assign) NSInteger BKis_hot;
@property (nonatomic, copy) NSString * BKremark;
@property (nonatomic, copy) NSString * BKproduct_id;
@end

NS_ASSUME_NONNULL_END
