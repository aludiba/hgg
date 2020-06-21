#import <UIKit/UIKit.h>
@class FSTextView;
typedef void(^FSTextViewHandler)(FSTextView *textView);
IB_DESIGNABLE
@interface FSTextView : UITextView
+ (instancetype)textView;
- (void)addTextDidChangeHandler:(FSTextViewHandler)eventHandler;
- (void)addTextLengthDidMaxHandler:(FSTextViewHandler)maxHandler;
@property (nonatomic, assign) IBInspectable NSUInteger maxLength; 
@property (nonatomic, assign) IBInspectable CGFloat   cornerRadius; 
@property (nonatomic, assign) IBInspectable CGFloat   borderWidth; 
@property (nonatomic, strong) IBInspectable UIColor  *borderColor; 
@property (nonatomic, copy)   IBInspectable NSString *placeholder; 
@property (nonatomic, strong) IBInspectable UIColor  *placeholderColor; 
@property (nonatomic, strong) UIFont *placeholderFont; 
@property (nonatomic, assign, getter=isCanPerformAction) BOOL canPerformAction;
@property (nonatomic, readonly) NSString *formatText;
@end
