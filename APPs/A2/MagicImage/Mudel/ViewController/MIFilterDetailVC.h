//
//  MIFilterDetailVC.h
//  MagicImage
//
//  Created by MagicImage on 2019/5/1.
//  Copyright © 2019 April. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MIHomeModel;
NS_ASSUME_NONNULL_BEGIN

@interface MIFilterDetailVC : UIViewController
@property (nonatomic, strong) MIHomeModel * model;
@property (nonatomic, copy) NSString * pid;
@end

NS_ASSUME_NONNULL_END
