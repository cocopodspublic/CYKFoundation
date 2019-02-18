//
//  UITextField+CYKAdd.m
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import "UITextField+CYKAdd.h"

@implementation UITextField (CYKAdd)

+(UITextField *)setFrame:(CGRect )frame placeholder:(NSString *)PHolder color:(UIColor *)color font:(UIFont *)font textAlignment:(NSTextAlignment )textAlignment textBorderStyle:(UITextBorderStyle )textBorderStyle{
    
    UITextField *TF=[[UITextField alloc]initWithFrame:frame];
    if (PHolder) {
        TF.placeholder=PHolder;
    }
    if (color) {
        TF.textColor=color;
    }
    if (font) {
        TF.font=font;
    }
    if (textAlignment) {
        TF.textAlignment=textAlignment;
    }
    if (textBorderStyle) {
        TF.borderStyle=textBorderStyle;
    }
    
    
    return TF;
}


+(UITextField *)setFrame:(CGRect )frame placeholder:(NSString *)PHolder{
    
    return [UITextField setFrame:frame placeholder:PHolder];
    
}

- (void)selectAllText {
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    [self setSelectedTextRange:range];
}

- (void)setSelectedRange:(NSRange)range {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}


@end
