//
//  MIHttpTool.h
//  LookScore
//
//  Created by wr on 2018/1/16.
//  Copyright © 2018年 ChongQingXunTiCompany. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MIHttpTool : NSObject


/**
 *  发送get请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;


/**
 *  发送post请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)Post:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;


/**
 *  上传请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)Upload:(NSString *)URLString parameters:(id)parameters uploadParamArray:(NSArray *)uploadParamArray success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;


+ (void)GETNormarData:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)SynchronousPost:(NSString *)URLString  parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;



+ (void)canAllRequest;
@end
