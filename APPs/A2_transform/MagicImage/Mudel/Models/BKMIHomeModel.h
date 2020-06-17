//
//  MIHomeModel.h
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BKMIHomeModel : UIView
@property (nonatomic, copy) NSString *BKid;
@property (nonatomic, assign) NSInteger BKtype;
@property (nonatomic, copy) NSString *BKtitle;
@property (nonatomic, copy) NSString *BKpic_url_z;
@property (nonatomic, copy) NSString *BKpic_url_c;
@property (nonatomic, strong) NSArray *BKpic_url_detail_array;
@property (nonatomic, copy) NSString *BKpeanut_num;
@property (nonatomic, copy) NSString *BKproduct_id;
@end

NS_ASSUME_NONNULL_END
