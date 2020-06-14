//
//  MIIPAPurchase.m
//  Summer
//
//  Created by MagicImage on 2018/11/4.
//  Copyright © 2018年 nicecheo. All rights reserved.
//

#import "MIIPAPurchase.h"
#import <StoreKit/StoreKit.h>
#import <StoreKit/SKPaymentTransaction.h>
//#import "SandBoxHelper.h"
//#import "NSString+category.h"
static NSString * const receiptKey = @"823e2ab151fd49738ad02fd778a2a7e8";

dispatch_queue_t iap_queue1(){
    static dispatch_queue_t as_iap_queue1;
    static dispatch_once_t onceToken_iap_queue1;
    dispatch_once(&onceToken_iap_queue1, ^{
        as_iap_queue1 = dispatch_queue_create("com.iap1.queue", DISPATCH_QUEUE_CONCURRENT);
    });
    
    return as_iap_queue1;
    
}
@interface MIIPAPurchase()<SKPaymentTransactionObserver,SKProductsRequestDelegate>{
    SKProductsRequest *request;
}
//购买凭证
@property (nonatomic,copy)NSString *receipt;//存储base64编码的交易凭证

//产品ID
@property (nonnull,copy)NSString * profductId;


@property (nonatomic, assign) BOOL isHaveLocalTransationId;

@end

static MIIPAPurchase * manager = nil;
@implementation MIIPAPurchase
#pragma mark -- 单例方法
+ (instancetype)manager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (!manager) {
            manager = [[MIIPAPurchase alloc] init];
        }
    });
    
    return manager;
}

#pragma mark -- 添加内购监听者
-(void)startManager{
    
    dispatch_sync(iap_queue1(), ^{
        
        [[SKPaymentQueue defaultQueue] addTransactionObserver:manager];
        
    });
    
}

#pragma mark -- 移除内购监听者
-(void)stopManager{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
        
    });
    
}

#pragma mark -- 发起购买的方法
-(void)buyProductWithProductID:(NSString *)productID payResult:(payResult)payResult{
    
    [self removeAllUncompleteTransactionsBeforeNewPurchase];
    
    self.payResultBlock = payResult;
    
    //    [RRHUD showWithContainerView:RR_keyWindow status:NSLocalizedString(@"Buying...", @"")];
    
    self.profductId = productID;
    
    if (!self.profductId.length) {
        
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"Warm prompt" message:@"There is no corresponding product." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alertView show];
    }
    
    if ([SKPaymentQueue canMakePayments]) {
        
        [self requestProductInfo:self.profductId];
        
    }else{
        
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"Warm prompt" message:@"Please turn on the in-app paid purchase function first." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alertView show];
        
    }
    
}

#pragma mark -- 结束上次未完成的交易
-(void)removeAllUncompleteTransactionsBeforeNewPurchase{
    
    NSArray* transactions = [SKPaymentQueue defaultQueue].transactions;
//    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    if (transactions.count >= 1) {
        
        for (NSInteger count = transactions.count; count > 0; count--) {
            
            SKPaymentTransaction* transaction = [transactions objectAtIndex:count-1];
            
            if (transaction.transactionState == SKPaymentTransactionStatePurchased||transaction.transactionState == SKPaymentTransactionStateRestored) {
                
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                //                [self startManager];
            }
        }
        
    }else{
        
        NSLog(@"没有历史未消耗订单");
    }
    
}


#pragma mark -- 发起购买请求
-(void)requestProductInfo:(NSString *)productID{
    
    NSArray * productArray = [[NSArray alloc]initWithObjects:productID,nil];
    
    NSSet * IDSet = [NSSet setWithArray:productArray];
    
    request = [[SKProductsRequest alloc]initWithProductIdentifiers:IDSet];
    
    request.delegate = self;
    
    [request start];
    
}

#pragma mark -- SKProductsRequestDelegate 查询成功后的回调
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    NSArray *myProduct = response.products;
    
    if (myProduct.count == 0) {
        
        //        [RRHUD hide];
        //        [RRHUD showErrorWithContainerView:UL_rootVC.view status:NSLocalizedString(@"No Product Info", @"")];
        
        if (self.payResultBlock) {
            self.payResultBlock(NO, nil, @"无法获取产品信息，购买失败");
        }
        
        return;
    }
    
    SKProduct * product = nil;
    
    for(SKProduct * pro in myProduct){
        
        NSLog(@"SKProduct 描述信息%@", [pro description]);
        NSLog(@"产品标题 %@" , pro.localizedTitle);
        NSLog(@"产品描述信息: %@" , pro.localizedDescription);
        NSLog(@"价格: %@" , pro.price);
        NSLog(@"Product id: %@" , pro.productIdentifier);
        
        if ([pro.productIdentifier isEqualToString:self.profductId]) {
            
            product = pro;
            
            break;
        }
    }
    
    if (product) {
        
        SKMutablePayment * payment = [SKMutablePayment paymentWithProduct:product];
        //使用苹果提供的属性,将平台订单号复制给这个属性作为透传参数
        //        payment.applicationUsername = self.order_sn;
        //        MyLog(@"ooooooo%@",self.order_sn);
        [[SKPaymentQueue defaultQueue] addPayment:payment];
        
    }else{
        
        NSLog(@"没有此商品信息");
    }
}

//查询失败后的回调
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error {
    
    if (self.payResultBlock) {
        self.payResultBlock(NO, nil, [error localizedDescription]);
    }
}

//如果没有设置监听购买结果将直接跳至反馈结束；
-(void)requestDidFinish:(SKRequest *)request{
    
}

#pragma mark -- 监听结果
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions{
    
    //当用户购买的操作有结果时，就会触发下面的回调函数，
    for (SKPaymentTransaction * transaction in transactions) {
        
        switch (transaction.transactionState) {
                
            case SKPaymentTransactionStatePurchased:{
                
                [self completeTransaction:transaction];
                
            }break;
                
            case SKPaymentTransactionStateFailed:{
                
                [self failedTransaction:transaction];
                
            }break;
                
            case SKPaymentTransactionStateRestored:{//已经购买过该商品
                
                [self restoreTransaction:transaction];
                
            }break;
                
            case SKPaymentTransactionStatePurchasing:{
                
                NSLog(@"正在购买中...");
                
            }break;
                
            case SKPaymentTransactionStateDeferred:{
                
                NSLog(@"最终状态未确定");
                
            }break;
                
            default:
                break;
        }
    }
    
    
    
}

//完成交易
#pragma mark -- 交易完成的回调
- (void)completeTransaction:(SKPaymentTransaction *)transaction
{
    [self getAndSaveReceipt:transaction]; //获取交易成功后的购买凭证
    
}

#pragma mark -- 处理交易失败回调
- (void)failedTransaction:(SKPaymentTransaction *)transaction{
    
    //    [RRHUD hide];
    
    NSString * error = nil;
    
    if(transaction.error.code != SKErrorPaymentCancelled) {
        error = [NSString stringWithFormat:@"%d",transaction.error.code];
        
        MyLog(@"--------%@",[transaction.error localizedDescription]);
        
    } else {
        error = [NSString stringWithFormat:@"%d",transaction.error.code];
        
    }
    
    if (self.payResultBlock) {
        self.payResultBlock(NO, nil, error);
    }
    
    [[SKPaymentQueue defaultQueue]finishTransaction:transaction];
    
}

- (void)restoreTransaction:(SKPaymentTransaction *)transaction{
    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].delegate.window animated:YES];
    //    [MBProgressHUD hideHUD];
    if (self.payResultBlock) {
        self.payResultBlock(NO, @"no", @"");
    }
    //    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
}


#pragma mark -- 获取购买凭证
-(void)getAndSaveReceipt:(SKPaymentTransaction *)transaction{
    
    //获取交易凭证
    NSURL * receiptUrl = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData * receiptData = [NSData dataWithContentsOfURL:receiptUrl];
    NSString * base64String = [receiptData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    NSString * order;
//    NSString *fileName = [NSString UUID];
    NSString * userId;
    if (self.userid) {
        
        userId = self.userid;
        [[NSUserDefaults standardUserDefaults]setObject:userId forKey:@"unlock_iap_userId"];
        
    }else{
        
        userId = [[NSUserDefaults standardUserDefaults]
                  objectForKey:@"unlock_iap_userId"];
    }
    
    order = self.order_sn;
    //初始化字典
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
#pragma mark -- 获取订单返回nil
    //如果这个返回为nil
    NSLog(@"后台订单号为订单号为%@",order);
    [dic setValue: base64String forKey:receiptKey];
    [dic setValue: order forKey:@"order"];
    [dic setValue:[self getCurrentZoneTime] forKey:@"time"];
    [dic setValue:transaction.transactionIdentifier forKey:@"transactionId"];
    
    if (userId == nil||[userId length] == 0) {
        
        userId = @"走漏单流程未传入userId";
    }
    
    if (order == nil||[order length] == 0) {
        
        order = @"苹果返回透传参数为nil";
    }
    
    [self sendAppStoreRequestBuyWithReceipt:base64String userId:userId paltFormOrder:order trans:transaction with:NO];
    

    
    
    
    
}

-(void)getPlatformAmountInfoWithOrder:(NSString *)transOrcer{
   
    
}


#pragma mark -- 获取系统时间的方法
-(NSString *)getCurrentZoneTime{

    NSDate * date = [NSDate date];
    NSDateFormatter*formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString*dateTime = [formatter stringFromDate:date];
    return dateTime;

}

#pragma mark -- 去服务器验证购买
-(void)sendAppStoreRequestBuyWithReceipt:(NSString *)receipt userId:(NSString *)userId paltFormOrder:(NSString * )order trans:(SKPaymentTransaction *)transaction with:(BOOL)isSaved{
    [[SKPaymentQueue defaultQueue]finishTransaction:transaction];

    NSData * data = [NSData dataWithContentsOfFile:[[[NSBundle mainBundle] appStoreReceiptURL] path]];
    NSString *result = [data base64EncodedStringWithOptions:0];

    if (self.payResultBlock) {
        self.payResultBlock(YES, result, nil);
    }


}

@end
