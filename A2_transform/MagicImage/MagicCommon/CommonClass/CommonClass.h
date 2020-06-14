//
//  CommonClass.h
//  LookScore
//
//  Created by wr on 2017/12/4.
//  Copyright © 2017年 ChongQingXunTiCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonClass : NSObject
+ (void)deleteAllCacheAndCookie;
+ (void)deleteWebCache;
//+ (void)jumpToLogin

+ (NSMutableAttributedString *)htmlStrTraslateNormalStrWithHtml:(NSString *)htmlStr Withfont:(UIFont *)font withColor:(UIColor *)color;
+ (void)endRefreshing:(UITableView *)tableView;

/**
 字符串去除空格
 */
+ (NSString *)noWhiteSpaceString:(NSString *)oldStr;
/**
 字典转json字符串
 */
+ (NSString *)convertToJsonData:(NSDictionary *)dict;
/**
 json字符串转字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 使用贝塞尔曲线画圆角
 */
+ (UIImageView *)clipImageView:(UIImageView * )imageView withCornerType:(UIRectCorner)cornerType WithSize:(CGSize)size;

/**
 判断字符串中是否含有Emoj表情
 */
+ (BOOL)stringContrainsEmoji:(NSString *)string;


/**
 使用贝塞尔曲线UIBezierPath和Core Graphics框架画出一个圆角
 */
+(UIImage *)clipImage:(UIImage *)image scaleToSize:(CGSize)size;

/**
 秒转换日期函数
 */
+ (NSString *)timeFormatted:(long long)totalSeconds;

/**
 获取当前时间的 时间戳
 @return 时间戳字符串
 */
+(NSString *)readStampTimeString;

/**获取当前日期是星期几*/
+(NSString *)readWeekDay;


+ (NSString *)readWeekDayWith:(NSDate *)date;
/**获取当前日期的年月日字符串格式*/

+ (NSString *)readCurrentTimeString;
/**获取当前日期字符串YYYY-MM-dd HH:mm:ss格式*/
+ (NSString *)getCurrentTimes;

/**获取当前时间和前6天所有年月日的字符串*/

+ (NSArray *)readBeforeSevenTimeStringCurrenTimeWithType:(NSInteger)type;
/**获取当前时间和后6天所有年月日的字符串*/

+ (NSArray *)readAfterSevenTimeStringWithCurrentTimeWithzType:(NSInteger)type;
/**获取2个时间的天数差*/
+ (NSInteger)getDaysFrom:(NSDate *)serverDate To:(NSDate *)endDate;

+ (NSDate *)StringTODate:(NSString *)sender;

/**时间戳转时间 01-01 12：20格式*/
+ (NSString *)timestampToString:(long long)timestamp;
/**时间戳转时间 2010/01/01 12:20格式*/
+ (NSString *)timesTampMaxToString:(long)timestamp;

/**
 字典多级转换 MD5加密
 
 @param parameters 多个参数
 
 */
+(NSString *)stringFromParameters:(NSDictionary *)parameters;

/**
 MD5 */
+(id)MD5:(NSString *)MD5String;

/** 十六进制的颜色转换为UIColor*/

+ (UIColor *)colorWithHexString: (NSString *)color;

/** 判断字符串是否为空 */
+ (BOOL)isBlankString:(NSString *)string;

/**
 *  把颜色绘制成图片
 */
+(UIImage *)getImageWithBgColor:(UIColor *)color;

/**
 计算字符串宽度

 @param calculatorString 需要计算的字符串
 @param font 字符串size
 @param spaceWidth 需要加的空间
 */

+(float)textWidthByString:(NSString *)calculatorString sizeFont:(NSInteger )font layoutWidth:(CGFloat)layoutWidth spaceWidth:(CGFloat)spaceWidth;
/**
 *  拼接label的文本颜色
 *
 *  @param basicTitle  自定义字符串
 *  @param homeTitle  后缀字符串
 *  @param changeTitle 改变字符
 *  @param getColor    改变颜色
 *  @param sizeW       字号大小
 *
 *  @return att
 */
+(NSMutableAttributedString *)setBasicTitle:(NSString *)basicTitle homeTitle:(NSString *)homeTitle changeTitle:(NSString *)changeTitle  color:(UIColor *)getColor size:(NSInteger )sizeW isBold:(BOOL)isBold;

/**
 下划线 */

+(NSMutableAttributedString *)setTitle:(NSString *)title color:(UIColor *)color;

/**
 行间距*/
+(NSMutableAttributedString *)setTitle:(NSString *)title lineSpace:(CGFloat )lineSpace textSpace:(CGFloat )textSpace;

+(UIViewController *)getTopCurrentViewController;


+ (NSData *)compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;
+ (UIViewController *)getCurrentVC;
@end
