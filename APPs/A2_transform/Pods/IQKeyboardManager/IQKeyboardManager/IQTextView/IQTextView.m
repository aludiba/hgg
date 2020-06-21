#import "IQTextView.h"
#import <UIKit/NSTextContainer.h>
#import <UIKit/UILabel.h>
#import <UIKit/UINibLoading.h>
@interface IQTextView ()
@property(nullable, nonatomic, strong) UILabel *IQ_PlaceholderLabel;
@end
@implementation IQTextView
@synthesize placeholder = _placeholder;
@synthesize IQ_PlaceholderLabel = _IQ_PlaceholderLabel;
@synthesize placeholderTextColor = _placeholderTextColor;
-(void)initialize
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshPlaceholder) name:UITextViewTextDidChangeNotification object:self];
}
-(void)dealloc
{
    [_IQ_PlaceholderLabel removeFromSuperview];
    _IQ_PlaceholderLabel = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self initialize];
}
-(void)refreshPlaceholder
{
    if([[self text] length] || [[self attributedText] length])
    {
        [self.IQ_PlaceholderLabel setAlpha:0];
    }
    else
    {
        [self.IQ_PlaceholderLabel setAlpha:1];
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
- (void)setText:(NSString *)text
{
    [super setText:text];
    [self refreshPlaceholder];
}
-(void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    [self refreshPlaceholder];
}
-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.IQ_PlaceholderLabel.font = self.font;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
-(void)setTextAlignment:(NSTextAlignment)textAlignment
{
    [super setTextAlignment:textAlignment];
    self.IQ_PlaceholderLabel.textAlignment = textAlignment;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.IQ_PlaceholderLabel.frame = [self placeholderExpectedFrame];
}
-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.IQ_PlaceholderLabel.text = placeholder;
    [self refreshPlaceholder];
}
-(void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder
{
    _attributedPlaceholder = attributedPlaceholder;
    self.IQ_PlaceholderLabel.attributedText = attributedPlaceholder;
    [self refreshPlaceholder];
}
-(void)setPlaceholderTextColor:(UIColor*)placeholderTextColor
{
    _placeholderTextColor = placeholderTextColor;
    self.IQ_PlaceholderLabel.textColor = placeholderTextColor;
}
-(UIEdgeInsets)placeholderInsets
{
    return UIEdgeInsetsMake(self.textContainerInset.top, self.textContainerInset.left + self.textContainer.lineFragmentPadding, self.textContainerInset.bottom, self.textContainerInset.right + self.textContainer.lineFragmentPadding);
}
-(CGRect)placeholderExpectedFrame
{
    UIEdgeInsets placeholderInsets = [self placeholderInsets];
    CGFloat maxWidth = CGRectGetWidth(self.frame)-placeholderInsets.left-placeholderInsets.right;
    CGSize expectedSize = [self.IQ_PlaceholderLabel sizeThatFits:CGSizeMake(maxWidth, CGRectGetHeight(self.frame)-placeholderInsets.top-placeholderInsets.bottom)];
    return CGRectMake(placeholderInsets.left, placeholderInsets.top, maxWidth, expectedSize.height);
}
-(UILabel*)IQ_PlaceholderLabel
{
    if (_IQ_PlaceholderLabel == nil)
    {
        _IQ_PlaceholderLabel = [[UILabel alloc] init];
        _IQ_PlaceholderLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
        _IQ_PlaceholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _IQ_PlaceholderLabel.numberOfLines = 0;
        _IQ_PlaceholderLabel.font = self.font;
        _IQ_PlaceholderLabel.textAlignment = self.textAlignment;
        _IQ_PlaceholderLabel.backgroundColor = [UIColor clearColor];
        #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000
            if (@available(iOS 13.0, *)) {
                _IQ_PlaceholderLabel.textColor = [UIColor systemGrayColor];
            } else
        #endif
            {
        #if __IPHONE_OS_VERSION_MIN_REQUIRED < 130000
                _IQ_PlaceholderLabel.textColor = [UIColor lightTextColor];
        #endif
            }
        _IQ_PlaceholderLabel.alpha = 0;
        [self addSubview:_IQ_PlaceholderLabel];
    }
    return _IQ_PlaceholderLabel;
}
-(id<UITextViewDelegate>)delegate
{
    [self refreshPlaceholder];
    return [super delegate];
}
-(CGSize)intrinsicContentSize
{
    if (self.hasText) {
        return [super intrinsicContentSize];
    }
    UIEdgeInsets placeholderInsets = [self placeholderInsets];
    CGSize newSize = [super intrinsicContentSize];
    newSize.height = [self placeholderExpectedFrame].size.height + placeholderInsets.top + placeholderInsets.bottom;
    return newSize;
}
@end
