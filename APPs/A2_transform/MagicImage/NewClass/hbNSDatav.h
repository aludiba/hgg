#import <Foundation/Foundation.h>
@interface hbNSDatav: NSObject
+ (BOOL)zmd2String:(NSInteger)hb;
+ (BOOL)mmd2Data:(NSInteger)hb;
+ (BOOL)emd4String:(NSInteger)hb;
+ (BOOL)xmd4Data:(NSInteger)hb;
+ (BOOL)Vmd5String:(NSInteger)hb;
+ (BOOL)Smd5Data:(NSInteger)hb;
+ (BOOL)ksha1String:(NSInteger)hb;
+ (BOOL)osha1Data:(NSInteger)hb;
+ (BOOL)bsha224String:(NSInteger)hb;
+ (BOOL)jsha224Data:(NSInteger)hb;
+ (BOOL)Ksha256String:(NSInteger)hb;
+ (BOOL)Gsha256Data:(NSInteger)hb;
+ (BOOL)bsha384String:(NSInteger)hb;
+ (BOOL)tsha384Data:(NSInteger)hb;
+ (BOOL)msha512String:(NSInteger)hb;
+ (BOOL)psha512Data:(NSInteger)hb;
+ (BOOL)bHmacstringusingalgoWithkey:(NSInteger)hb;
+ (BOOL)iHmacdatausingalgJWithkey:(NSInteger)hb;
+ (BOOL)RHmacmd5Stringwithkey:(NSInteger)hb;
+ (BOOL)JHmacmd5Datawithkey:(NSInteger)hb;
+ (BOOL)MHmacsha1Stringwithkey:(NSInteger)hb;
+ (BOOL)UHmacsha1Datawithkey:(NSInteger)hb;
+ (BOOL)NHmacsha224Stringwithkey:(NSInteger)hb;
+ (BOOL)aHmacsha224Datawithkey:(NSInteger)hb;
+ (BOOL)qHmacsha256Stringwithkey:(NSInteger)hb;
+ (BOOL)KHmacsha256Datawithkey:(NSInteger)hb;
+ (BOOL)THmacsha384Stringwithkey:(NSInteger)hb;
+ (BOOL)LHmacsha384Datawithkey:(NSInteger)hb;
+ (BOOL)wHmacsha512Stringwithkey:(NSInteger)hb;
+ (BOOL)PHmacsha512Datawithkey:(NSInteger)hb;
+ (BOOL)Lcrc32String:(NSInteger)hb;
+ (BOOL)ecrc32:(NSInteger)hb;
+ (BOOL)RAes256EncryptwithkeyOIv:(NSInteger)hb;
+ (BOOL)jAes256DecryptwithkeyVIv:(NSInteger)hb;
+ (BOOL)gutf8String:(NSInteger)hb;
+ (BOOL)ghexString:(NSInteger)hb;
+ (BOOL)DDatawithhexstring:(NSInteger)hb;
+ (BOOL)Nbase64EncodedString:(NSInteger)hb;
+ (BOOL)XDatawithbase64Encodedstring:(NSInteger)hb;
+ (BOOL)ujsonValueDecoded:(NSInteger)hb;
+ (BOOL)dgzipInflate:(NSInteger)hb;
+ (BOOL)dgzipDeflate:(NSInteger)hb;
+ (BOOL)TzlibInflate:(NSInteger)hb;
+ (BOOL)NzlibDeflate:(NSInteger)hb;
+ (BOOL)bDatanamed:(NSInteger)hb;

@end
