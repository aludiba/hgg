//
//  MIHttpEnclosureTool.m
//  LookScore
//
//  Created by wr on 2018/1/17.
//  Copyright © 2018年 ChongQingXunTiCompany. All rights reserved.
//

#import "MIHttpEnclosureTool.h"
#import "MIHttpTool.h"
//#import "MBProgressHUD+MJ.h"
#import "MIReturnFormat.h"
//#import "LSAccountArchive.h"
//#import "LSHttpParameter.h"

//static CFAbsoluteTime start;
//static CFAbsoluteTime end;
@implementation MIHttpEnclosureTool
{
    CFAbsoluteTime end;
}

/**
 GET请求
 
 @param URLString URLString description
 @param parameters <#parameters description#>
 @param resBlock <#resBlock description#>
 */
+(void)GET:(NSString *)URLString parameters:(id)parameters resBlock:(resBlock)resBlock{

//    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
////    hud.label.text=@"正在请求中...";
//    hud.mode=MBProgressHUDModeIndeterminate;
//    [hud showAnimated:YES];
    
    
    //CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    // do something
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [MIHttpTool GET:URLString parameters:parameters success:^(id responseObject) {
        //[hud hideAnimated:YES];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        MIReturnFormat *format=[MIReturnFormat mj_objectWithKeyValues:responseObject];
        if (format.status==1) {
            NSArray *array=format.data;
            if (array==nil) {
                //[MBProgressHUD showOnlyMessage:format.msg afterDelay:1.5f];
                resBlock(array);
            }else{
                resBlock(format.data);
            }
        }else{
            //[MBProgressHUD showOnlyMessage:format.msg afterDelay:1.5f];
            resBlock(nil);
        }
        //CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
        // MyLog(@"请求耗时 -- %f", end - start);
    } failure:^(NSError *error) {
        //[hud hideAnimated:YES];
//        MyLog(@"%@",error);
        resBlock(nil);
        //[MBProgressHUD showOnlyMessage:error.localizedDescription afterDelay:1.5f];
        //CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
        //MyLog(@"请求耗时 -- %f", end - start);
    }];
    
   
}



/**
 POST请求
 
 @param URLString <#URLString description#>
 @param parameters <#parameters description#>
 @param resBlock <#resBlock description#>
 */
+(void)POST:(NSString *)URLString parameters:(id)parameters resBlock:(resBlock)resBlock{
    
//    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
////    hud.label.text=@"正在请求中...";
//    hud.mode=MBProgressHUDModeIndeterminate;
//    [hud showAnimated:YES];
    
    //CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    
    [MIHttpTool Post:URLString parameters:parameters success:^(id responseObject) {
        //[hud hideAnimated:YES];
        MIReturnFormat *format=[MIReturnFormat mj_objectWithKeyValues:responseObject];
        if (format.status==1) {
            NSArray *array=format.data;
            if (array==nil) {
                // [MBProgressHUD showOnlyMessage:format.msg afterDelay:1.5f];
                
                resBlock(array);
            }else{
                resBlock(format.data);
            }
        }else{
            [MBProgressHUD showTipMessageInWindow:format.msg];
            resBlock(nil);
        }
        
        //CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
        //MyLog(@"请求耗时 -- %f", end - start);
       
    } failure:^(NSError *error) {
        //[hud hideAnimated:YES];
        
       // CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
        //MyLog(@"请求耗时 -- %f", end - start);
        MyLog(@"%@",error);
        resBlock(nil);
        //[MBProgressHUD showOnlyMessage:error.localizedDescription afterDelay:1.5f];
    }];
}

/**
 Upload 图片

 */
+(void)Upload:(NSString *)URLString parameters:(id)parameters uploadParamArray:(NSArray *)uploadParamArray  resBlock:(resBlock)resBlock{
   // MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
   // hud.label.text=@"正在上传中...";
   // hud.mode=MBProgressHUDModeIndeterminate;
    
   // CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
    
   // [hud showAnimated:YES];
    [MIHttpTool Upload:URLString parameters:parameters uploadParamArray:uploadParamArray success:^(id responseObject) {
        //[hud hideAnimated:YES];
        MIReturnFormat *format=[MIReturnFormat mj_objectWithKeyValues:responseObject];
        if (format.status==1) {
            NSArray *array=format.data;
            if (array==nil) {
                //[MBProgressHUD showOnlyMessage:format.msg afterDelay:1.5f];
                resBlock(array);
            }else{
                //[MBProgressHUD showOnlyMessage:format.msg afterDelay:1.5f];
                resBlock(format.data);
            }
        }else{
            //[MBProgressHUD showOnlyMessage:format.msg afterDelay:1.5f];
            resBlock(nil);
        }
        
        //CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
       // MyLog(@"请求耗时 -- %f", end - start);
        
    } failure:^(NSError *error) {
       // [hud hideAnimated:YES];
        
        //CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
        //MyLog(@"请求耗时 -- %f", end - start);
        
        resBlock(nil);
        //[MBProgressHUD showOnlyMessage:error.localizedDescription afterDelay:1.5f];
    }];
}
#pragma mark 🔥 更新ApiDomain
//+(void)updateApiDomain{
//    [LSAccountArchive saveApiDomain:LSBaseUrl];
//    [MIHttpEnclosureTool GET:LSApiDomain parameters:nil resBlock:^(id responseObject) {
//        if (responseObject) {
//            NSString *apiDomainString=(NSString *)responseObject;
//            [LSAccountArchive saveApiDomain:apiDomainString];
//        }
//    }];
//}



@end
