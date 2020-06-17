//
//  MIStickerDetailVC.h
//  MagicImage
//
//  Created by MagicImage on 2019/4/30.
//  Copyright © 2019 April. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BKMIHomeModel;
NS_ASSUME_NONNULL_BEGIN

@interface BKMIStickerDetailVC : UIViewController
@property (nonatomic, strong) BKMIHomeModel *BKmodel;
@property (nonatomic, copy) NSString *BKpId;
@property (nonatomic, assign) NSInteger BKtype;
@end

NS_ASSUME_NONNULL_END
