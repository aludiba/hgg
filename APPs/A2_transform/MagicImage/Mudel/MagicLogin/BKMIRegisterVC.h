//
//  MIRegisterVC.h
//  MagicImage
//
//  Created by MagicImage on 2019/5/1.
//  Copyright © 2019 April. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BKMIRegisterVC : UIViewController
@property (nonatomic, copy) void (^block)(NSString * BKusername,NSString * BKpassword);
@end

NS_ASSUME_NONNULL_END
