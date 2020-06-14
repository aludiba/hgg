//
//  MICoinsModel.h
//  MagicImage
//
//  Created by MagicImage on 2019/5/1.
//  Copyright © 2019 April. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MICoinsModel : NSObject
@property (nonatomic, copy) NSString * goods_id;
@property (nonatomic, assign) NSInteger goods_num;
@property (nonatomic, copy) NSString * goods_price;
@property (nonatomic, assign) NSInteger is_hot;
@property (nonatomic, copy) NSString * remark;
@property (nonatomic, copy) NSString * product_id;
@end

NS_ASSUME_NONNULL_END
