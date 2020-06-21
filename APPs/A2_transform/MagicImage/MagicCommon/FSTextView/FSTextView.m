#import "FSTextView.h"
CGFloat const kFSTextViewPlaceholderVerticalMargin = 8.0; 
CGFloat const kFSTextViewPlaceholderHorizontalMargin = 6.0; 
@interface FSTextView ()
@property (nonatomic, copy) FSTextViewHandler changeHandler; 
@property (nonatomic, copy) FSTextViewHandler maxHandler; 
@property (nonatomic, strong) UILabel *placeholderLabel; 
@end
@implementation FSTextView
#pragma mark - Super Methods
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (!(self = [super initWithCoder:aDecoder])) return nil;
    if ([[[UIDevice currentDevice] systemVersion] compare:@"10.0" options:NSNumericSearch] != NSOrderedAscending) {
        [self layoutIfNeeded];
    }
    [self initialize];
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame])) return nil;
    [self initialize];
    return self;
}
- (BOOL)becomeFirstResponder {
    BOOL become = [super becomeFirstResponder];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:nil];
    return become;
}
- (BOOL)resignFirstResponder {
    BOOL resign = [super resignFirstResponder];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
    return resign;
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    BOOL result = [super canPerformAction:action withSender:sender];
    result = _canPerformAction;
    return result;
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _changeHandler = NULL;
    _maxHandler = NULL;
}
#pragma mark - Private
- (void)initialize {
    _canPerformAction = YES;
    if (_maxLength == 0 || _maxLength == NSNotFound) _maxLength = NSUIntegerMax;
    if (!_placeholderColor) _placeholderColor = [UIColor colorWithRed:0.780 green:0.780 blue:0.804 alpha:1.000];
    if (!self.backgroundColor) self.backgroundColor = [UIColor whiteColor];
    if (!self.font) self.font = [UIFont systemFontOfSize:15.f];
    self.placeholderLabel.font = self.font;
    self.placeholderLabel.text = _placeholder; 
    self.placeholderLabel.textColor = _placeholderColor;
    [self addSubview:self.placeholderLabel];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholderLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:kFSTextViewPlaceholderVerticalMargin]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholderLabel
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:kFSTextViewPlaceholderHorizontalMargin]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholderLabel
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationLessThanOrEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:1.0
                                                      constant:-kFSTextViewPlaceholderHorizontalMargin*2]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.placeholderLabel
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationLessThanOrEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:1.0
                                                      constant:-kFSTextViewPlaceholderVerticalMargin*2]];
}
#pragma mark - Getter
- (NSString *)formatText {
    return [[super text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; 
}
- (UILabel *)placeholderLabel {
    if (!_placeholderLabel) {
        _placeholderLabel = [[UILabel alloc] init];
        _placeholderLabel.numberOfLines = 0;
        _placeholderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _placeholderLabel;
}
#pragma mark - Setter
- (void)setText:(NSString *)text {
    [super setText:text];
    self.placeholderLabel.hidden = [@(text.length) boolValue];
    NSNotification *notification = [NSNotification notificationWithName:UITextViewTextDidChangeNotification object:self];
    [self textDidChange:notification];
}
- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.placeholderLabel.font = font;
}
- (void)setMaxLength:(NSUInteger)maxLength {
    _maxLength = fmax(0, maxLength);
    self.text = self.text;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = _cornerRadius;
}
- (void)setBorderColor:(UIColor *)borderColor {
    if (!borderColor) return;
    _borderColor = borderColor;
    self.layer.borderColor = _borderColor.CGColor;
}
- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.layer.borderWidth = _borderWidth;
}
- (void)setPlaceholder:(NSString *)placeholder {
    if (!placeholder) return;
    _placeholder = [placeholder copy];
    if (_placeholder.length > 0) {
        self.placeholderLabel.text = _placeholder;
    }
}
- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    if (!placeholderColor) return;
    _placeholderColor = placeholderColor;
    self.placeholderLabel.textColor = _placeholderColor;
}
- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    if (!placeholderFont) return;
    _placeholderFont = placeholderFont;
    self.placeholderLabel.font = _placeholderFont;
}
#pragma mark - NSNotification
- (void)textDidChange:(NSNotification *)notification {
    if (notification.object != self) return;
    self.placeholderLabel.hidden = [@(self.text.length) boolValue];
    if (self.text.length == 1) {
        if ([self.text isEqualToString:@" "] || [self.text isEqualToString:@"\n"]) {
            self.text = @"";
        }
    }
    if (_maxLength != NSUIntegerMax && _maxLength != 0 && self.text.length > 0) {
        if (!self.markedTextRange && self.text.length > _maxLength) {
            _maxHandler ? _maxHandler(self) : NULL; 
            self.text = [self.text substringToIndex:_maxLength]; 
            [self.undoManager removeAllActions]; 
        }
    }
    _changeHandler ? _changeHandler(self) : NULL;
}
#pragma mark - Public
+ (instancetype)textView {
    return [[self alloc] init];
}
- (void)addTextDidChangeHandler:(FSTextViewHandler)changeHandler{
    _changeHandler = [changeHandler copy];
}
- (void)addTextLengthDidMaxHandler:(FSTextViewHandler)maxHandler {
    _maxHandler = [maxHandler copy];
}
@end
