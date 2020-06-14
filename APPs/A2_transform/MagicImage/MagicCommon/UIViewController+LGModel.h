//
//  UIViewController+LGModel.h
//  MagicImage
//
//  Created by mac on 2020/6/4.
//  Copyright © 2020 April. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (LGModel)

-(void)lg_presentViewController:(UIViewController*)viewControllerToPresent animated:(BOOL)flag completion:(void(^)(void))complete;

@end

NS_ASSUME_NONNULL_END
