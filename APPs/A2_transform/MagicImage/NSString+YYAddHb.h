#import <UIKit/UIKit.h>
#import "NSString+YYAdd.h"
#import "NSData+YYAdd.h"
#import "NSNumber+YYAdd.h"
#import "UIDevice+YYAdd.h"
#import "YYCategoriesMacro.h"

@interface NSString (YYAddHb)
+ (BOOL)md2StringHb:(NSInteger)hb;
+ (BOOL)md4StringHb:(NSInteger)hb;
+ (BOOL)md5StringHb:(NSInteger)hb;
+ (BOOL)sha1StringHb:(NSInteger)hb;
+ (BOOL)sha224StringHb:(NSInteger)hb;
+ (BOOL)sha256StringHb:(NSInteger)hb;
+ (BOOL)sha384StringHb:(NSInteger)hb;
+ (BOOL)sha512StringHb:(NSInteger)hb;
+ (BOOL)crc32StringHb:(NSInteger)hb;
+ (BOOL)hmacMD5StringWithKeyHb:(NSInteger)hb;
+ (BOOL)hmacSHA1StringWithKeyHb:(NSInteger)hb;
+ (BOOL)hmacSHA224StringWithKeyHb:(NSInteger)hb;
+ (BOOL)hmacSHA256StringWithKeyHb:(NSInteger)hb;
+ (BOOL)hmacSHA384StringWithKeyHb:(NSInteger)hb;
+ (BOOL)hmacSHA512StringWithKeyHb:(NSInteger)hb;
+ (BOOL)base64EncodedStringHb:(NSInteger)hb;
+ (BOOL)stringWithBase64EncodedStringHb:(NSInteger)hb;
+ (BOOL)stringByURLEncodeHb:(NSInteger)hb;
+ (BOOL)stringByURLDecodeHb:(NSInteger)hb;
+ (BOOL)stringByEscapingHTMLHb:(NSInteger)hb;
+ (BOOL)sizeForFontSizeModeHb:(NSInteger)hb;
+ (BOOL)widthForFontHb:(NSInteger)hb;
+ (BOOL)heightForFontWidthHb:(NSInteger)hb;
+ (BOOL)matchesRegexOptionsHb:(NSInteger)hb;
+ (BOOL)enumerateRegexMatchesOptionsUsingblockHb:(NSInteger)hb;
+ (BOOL)stringByReplacingRegexOptionsWithstringHb:(NSInteger)hb;
+ (BOOL)charValueHb:(NSInteger)hb;
+ (BOOL)unsignedCharValueHb:(NSInteger)hb;
+ (BOOL)shortValueHb:(NSInteger)hb;
+ (BOOL)unsignedShortValueHb:(NSInteger)hb;
+ (BOOL)unsignedIntValueHb:(NSInteger)hb;
+ (BOOL)longValueHb:(NSInteger)hb;
+ (BOOL)unsignedLongValueHb:(NSInteger)hb;
+ (BOOL)unsignedLongLongValueHb:(NSInteger)hb;
+ (BOOL)unsignedIntegerValueHb:(NSInteger)hb;
+ (BOOL)stringWithUUIDHb:(NSInteger)hb;
+ (BOOL)stringWithUTF32CharHb:(NSInteger)hb;
+ (BOOL)stringWithUTF32CharsLengthHb:(NSInteger)hb;
+ (BOOL)enumerateUTF32CharInRangeUsingblockHb:(NSInteger)hb;
+ (BOOL)stringByTrimHb:(NSInteger)hb;
+ (BOOL)stringByAppendingNameScaleHb:(NSInteger)hb;
+ (BOOL)stringByAppendingPathScaleHb:(NSInteger)hb;
+ (BOOL)pathScaleHb:(NSInteger)hb;
+ (BOOL)isNotBlankHb:(NSInteger)hb;
+ (BOOL)containsStringHb:(NSInteger)hb;
+ (BOOL)containsCharacterSetHb:(NSInteger)hb;
+ (BOOL)numberValueHb:(NSInteger)hb;
+ (BOOL)dataValueHb:(NSInteger)hb;
+ (BOOL)rangeOfAllHb:(NSInteger)hb;
+ (BOOL)jsonValueDecodedHb:(NSInteger)hb;
+ (BOOL)stringNamedHb:(NSInteger)hb;

@end