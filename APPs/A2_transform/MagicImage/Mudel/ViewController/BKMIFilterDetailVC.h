//
//  MIFilterDetailVC.h
//  MagicImage
//
//  Created by MagicImage on 2019/5/1.
//  Copyright © 2019 April. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BKMIHomeModel;
NS_ASSUME_NONNULL_BEGIN

@interface BKMIFilterDetailVC : UIViewController
@property (nonatomic, strong) BKMIHomeModel * BKmodel;
@property (nonatomic, copy) NSString * BKpid;
@end

NS_ASSUME_NONNULL_END
