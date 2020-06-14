//
//  MIMoreHeaderView.h
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MIMoreHeaderView : UIView
@property (nonatomic, copy) void (^block)(void);

- (void)updateViews;

@end

NS_ASSUME_NONNULL_END
