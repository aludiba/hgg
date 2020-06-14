//
//  MIHttpTool.m
//  LookScore
//
//  Created by wr on 2018/1/16.
//  Copyright © 2018年 ChongQingXunTiCompany. All rights reserved.
//

#import "MIHttpTool.h"

#import "AFNetworking.h"
#import "MJExtension.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "GSKeyChainDataManager.h"

static const NSUInteger REQUEST_TIME = 30;

#define BoundID @"com.photoeditai.myphoto"

@implementation MIHttpTool

+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    // 创建请求管理者
    AFHTTPSessionManager *Manager = [self createManager];
    
    KWeakSelf(self);
    //加密参数
    NSDictionary * parm = [weakself installGetRequestParameters:parameters];
    
    NSString *urlRealString = [NSString stringWithFormat:@"%@/api/%@",LSBaseUrl,URLString];
    
    [Manager GET:urlRealString parameters:parm headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success ? success(responseObject) :nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
  
}

//15223290883  @Qwe123

+ (void)Post:(NSString *)URLString  parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    // 创建请求管理者
    AFHTTPSessionManager *Manager = [self createManager];
    KWeakSelf(self);
    //加密参数
    NSDictionary *parm = [weakself installPostRequestParameters:parameters];
    NSString *urlRealString=[NSString stringWithFormat:@"%@/api/%@",LSBaseUrl,URLString];
//    MyLog(@"%@",urlRealString);
    [Manager POST:urlRealString parameters:parm headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success ? success(responseObject) :nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        MyLog(@"%@",error);
    }];
    [UIColor whiteColor];
}

+ (void)SynchronousPost:(NSString *)URLString  parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    // 创建请求管理者
    AFHTTPSessionManager *Manager = [self createManager];
    
    KWeakSelf(self);
    Manager.completionQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //加密参数
    NSDictionary *parm = [weakself installPostRequestParameters:parameters];
    
    NSString *urlRealString=[NSString stringWithFormat:@"%@/api/%@",LSBaseUrl,URLString];
    
    //    urlRealString=[NSString stringWithFormat:@"%@?%@",urlRealString,[CommonClass stringFromParameters:parm]];
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0); //创建信号量
    [Manager POST:urlRealString parameters:parm headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success ? success(responseObject) :nil;
        
        if ([responseObject isKindOfClass:[NSData class]]) {
            NSString * str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            MyLog(@"%@",str);
        }
        dispatch_semaphore_signal(semaphore);//不管请求状态是什么，都得发送信号，否则会一直卡着进程
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
//        MyLog(@"%@",error);
        dispatch_semaphore_signal(semaphore);//不管请求状态是什么，都得发送信号，否则会一直卡着进程

    }];
    dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);  //等待
}

/**
 *  上传请求,支持批量上传, 各个MXUploadParam 装进uploadParamArray 里面传入
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */

+ (void)Upload:(NSString *)URLString parameters:(id)parameters uploadParamArray:(NSArray *)uploadParamArray success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{

    // 创建请求管理者
    AFHTTPSessionManager *Manager = [self createManager];
    //加密参数
    NSDictionary *parm=[self installPostRequestParameters:parameters];
    
    NSString *urlRealString=[NSString stringWithFormat:@"%@/api/%@",LSBaseUrl,URLString];

    urlRealString=[NSString stringWithFormat:@"%@?%@",urlRealString,[CommonClass stringFromParameters:parm]];
    
    [Manager POST:urlRealString parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for(NSInteger i = 0; i < uploadParamArray.count; i++)
        {
            NSData *data = [self compressOriginalImage:uploadParamArray[i] toMaxDataSizeKBytes:300];
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            //            formatter.dateFormat = @"yyyyMMddHHmmss";
            [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
            
            NSString *imageName = [formatter stringFromDate:[NSDate date]];
            
            // 上传的参数名，在服务器端保存文件的文件夹名
            NSString * Name = [NSString stringWithFormat:@"%@%ld", imageName,i+1];
            // 上传filename
            NSString * fileName = [NSString stringWithFormat:@"%@.jpeg", Name];
            
            [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:@"image/jpeg"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success ? success(responseObject) :nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
   
}

/**
 *  压缩图片到指定文件大小
 *
 *  @param image 目标图片
 *  @param size  目标大小（最大值）
 *
 *  @return 返回的图片文件
 */
+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size{
    NSData * data = UIImageJPEGRepresentation(image, 1.0);
    CGFloat dataKBytes = data.length/1000.0;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > size && maxQuality > 0.01f) {
        maxQuality = maxQuality - 0.01f;
        data = UIImageJPEGRepresentation(image, maxQuality);
        dataKBytes = data.length / 1000.0;
        if (lastData == dataKBytes) {
            break;
        }else{
            lastData = dataKBytes;
        }
    }
    return data;
}

#pragma mark -- 不拼接  不加密的网络请求
+ (void)GETNormarData:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    
    AFHTTPSessionManager * Manager = [self createManager];

    [Manager GET:URLString parameters:parameters headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success ? success(responseObject) :nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
+ (void)canAllRequest{
    AFHTTPSessionManager *Manager = [AFHTTPSessionManager manager];
    [Manager.operationQueue cancelAllOperations];
}
//初始化基本网络请求参数
+ (AFHTTPSessionManager *)createManager{
    
    // 创建请求管理者
    AFHTTPSessionManager *Manager = [AFHTTPSessionManager manager];
    
    [Manager.requestSerializer setTimeoutInterval:REQUEST_TIME]; //设置请求的超时时间
    
    Manager.responseSerializer = [AFJSONResponseSerializer serializer]; //设置服务器返回结果的类型:JSON
//    AFJSONResponseSerializer
    //    Manager.requestSerializer=[AFJSONRequestSerializer serializer];//设置服务器请求类型:JSON
    
    Manager.operationQueue.maxConcurrentOperationCount = 5; //请求队列的最大并发数
    
    Manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    
    return Manager;
}


/**
 组装基础参数
 @param parameters 业务参数
 @return 组合值
 */
+(NSDictionary *)installGetRequestParameters:(NSDictionary *)parameters{
    //组合参数
    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
    
    //客户端类型
    parms[@"platform"] = @"ios";//0 web 1 wap 2 andriod 3 ios
    
    //客户端包名字
    parms[@"package_name"] = BoundID;//主包
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    parms[@"version"] = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    parms[@"is_aes"] = @"delaes123456";
    
    return parms;
}

/**
 组装基础参数
 @param parameters 业务参数
 @return 组合值
 */
+(NSDictionary *)installPostRequestParameters:(NSDictionary *)parameters{
    
    //41D6FD12-2F1D-457C-8812-54886B7062F0
    //组合参数
    NSMutableDictionary *parms = parameters.mutableCopy;
    parms[@"platform"] = @"ios";
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"fid"]) {
        parms[@"fid"] = [[NSUserDefaults standardUserDefaults] objectForKey:@"fid"];
    }
    MyLog(@"%@",[GSKeyChainDataManager readUUID]);
    if ([CommonClass isBlankString:[GSKeyChainDataManager readUUID]]) {
        NSString * idfv = [[UIDevice currentDevice].identifierForVendor UUIDString];
        if ([CommonClass isBlankString:idfv]) {
            parms[@"equipment_id"] = @"ios_71F1F9AD-1473-4346-9AC1-9A5D6C0BE4CC";
        }else{
            parms[@"equipment_id"] = [NSString stringWithFormat:@"ios_%@",idfv];
            [GSKeyChainDataManager saveUUID:[NSString stringWithFormat:@"ios_%@",idfv]];
        }
    }else{
        parms[@"equipment_id"] = [GSKeyChainDataManager readUUID];
        
    }
    //客户端包名字
    parms[@"package_name"] = BoundID;//主包
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    parms[@"version"] = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    parms[@"is_aes"] = @"delaes123456";//
    return parms;
}
@end
