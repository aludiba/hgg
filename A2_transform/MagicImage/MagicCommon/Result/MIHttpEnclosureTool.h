//
//  MIHttpEnclosureTool.h
//  LookScore
//
//  Created by wr on 2018/1/17.
//  Copyright © 2018年 ChongQingXunTiCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef void(^resBlock)(BOOL isSuccess,NSString *msg,id responseObject);

typedef void(^resBlock)(id responseObject);

@interface MIHttpEnclosureTool : NSObject


/**
 GET请求

 @param URLString <#URLString description#>
 @param parameters <#parameters description#>
 @param resBlock <#resBlock description#>
 */
+(void)GET:(NSString *)URLString parameters:(id)parameters resBlock:(resBlock)resBlock;



/**
 POST请求

 @param URLString <#URLString description#>
 @param parameters <#parameters description#>
 @param resBlock <#resBlock description#>
 */
+(void)POST:(NSString *)URLString parameters:(id)parameters resBlock:(resBlock)resBlock;


/**
 Upload 图片
 */
+(void)Upload:(NSString *)URLString parameters:(id)parameters uploadParamArray:(NSArray *)uploadParamArray  resBlock:(resBlock)resBlock;

/**
 更新ApiDomain
 */
//+(void)updateApiDomain;

@end
