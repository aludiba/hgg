//
//  MIHomeView.h
//  MagicImage
//
//  Created by MagicImage on 2019/4/29.
//  Copyright © 2019 April. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BKMIHomeView : UIView
@property (nonatomic, copy) void (^block)(NSInteger tag);
@end

NS_ASSUME_NONNULL_END
