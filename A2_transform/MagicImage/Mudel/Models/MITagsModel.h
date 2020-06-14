//
//  MITagsModel.h
//  MagicImage
//
//  Created by MagicImage on 2019/5/1.
//  Copyright © 2019 April. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MITagsModel : NSObject
@property (nonatomic, copy) NSString * id;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * icon_url;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * tags_count;
@property (nonatomic, copy) NSString * parent_id;
@property (nonatomic, copy) NSString * peanut_num;
@property (nonatomic, copy) NSString * create_time;
@end

NS_ASSUME_NONNULL_END
