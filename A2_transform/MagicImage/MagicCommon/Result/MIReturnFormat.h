//
//  MIReturnFormat.h
//  LookScore
//
//  Created by wr on 2018/1/17.
//  Copyright © 2018年 ChongQingXunTiCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface MIReturnFormat : NSObject<MJKeyValue>

/**
 回复状态
 Success=0, //成功
 Fail=1, //失败
 */
@property (nonatomic,assign) float status;

/**
 回复状态文本信息
 */
@property(copy,nonatomic)NSString * msg;


/**
 业务数据
 */
@property(strong,nonatomic)id data;


/**
 userToken
 */
@property(copy,nonatomic)NSString *server_time;

@end
