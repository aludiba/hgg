//
//  MITagsModel.h
//  MagicImage
//
//  Created by MagicImage on 2019/5/1.
//  Copyright © 2019 April. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BKMITagsModel : NSObject
@property (nonatomic, copy) NSString * BKid;
@property (nonatomic, copy) NSString * BKtitle;
@property (nonatomic, copy) NSString * BKicon_url;
@property (nonatomic, copy) NSString * BKcontent;
@property (nonatomic, copy) NSString * BKtags_count;
@property (nonatomic, copy) NSString * BKparent_id;
@property (nonatomic, copy) NSString * BKpeanut_num;
@property (nonatomic, copy) NSString * BKcreate_time;
@end

NS_ASSUME_NONNULL_END
