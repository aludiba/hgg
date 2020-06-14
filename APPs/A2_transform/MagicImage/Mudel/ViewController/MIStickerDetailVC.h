//
//  MIStickerDetailVC.h
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MIHomeModel;
NS_ASSUME_NONNULL_BEGIN

@interface MIStickerDetailVC : UIViewController
@property (nonatomic, strong) MIHomeModel * model;
@property (nonatomic, copy) NSString * pId;
@property (nonatomic, assign) NSInteger type;
@end

NS_ASSUME_NONNULL_END
