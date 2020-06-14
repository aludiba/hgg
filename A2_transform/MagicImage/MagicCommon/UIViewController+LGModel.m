//
//  UIViewController+LGModel.m
//  MagicImage
//
//  Created by mac on 2020/6/4.
//  Copyright © 2020 April. All rights reserved.
///Users/mac/Desktop/A10/PhotosOption/PhotosOption

#import "UIViewController+LGModel.h"

#import <objc/runtime.h>

@implementation UIViewController (LGModel)

+(void)load{
    [super load];
    
    SEL exchangeSel = @selector(lg_presentViewController: animated: completion:);
    SEL originalSel = @selector(presentViewController: animated: completion:);
    method_exchangeImplementations(class_getInstanceMethod(self.class, originalSel), class_getInstanceMethod(self.class, exchangeSel));
}

-(void)lg_presentViewController:(UIViewController*)viewControllerToPresent animated:(BOOL)flag completion:(void(^)(void))completion{
    viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
    [self lg_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
