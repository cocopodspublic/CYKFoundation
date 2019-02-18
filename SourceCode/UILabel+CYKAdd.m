//
//  UILabel+CYKAdd.m
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import "UILabel+CYKAdd.h"

@implementation UILabel (CYKAdd)

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor {
    return [UILabel labelWithText:nil font:font textColor:textColor textAlignment:NSTextAlignmentLeft];;
}

+ (UILabel *)labelWithText:(NSString *)text
                      font:(UIFont *)font
                 textColor:(UIColor *)textColor {
    
    return [UILabel labelWithText:text font:font textColor:textColor textAlignment:NSTextAlignmentLeft];
}

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor
             textAlignment:(NSTextAlignment)textAlignment {
    return [UILabel labelWithText:@"" font:font
                        textColor:textColor
                    textAlignment:textAlignment];
}

+ (UILabel *)labelWithText:(NSString *)text
                      font:(UIFont *)font
                 textColor:(UIColor *)textColor
             textAlignment:(NSTextAlignment)textAlignment {
    
    UILabel *label = [UILabel new];
    label.text = text;
    label.textAlignment = textAlignment;
    label.font = font;
    label.textColor = textColor;
    return label;
}


//富文本
-(void)paragraph:(NSString *)string
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];//调整行间距
    //多余的显示省略号
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    
    self.attributedText = attributedString;
}



//左边带图片的富文本
-(void)attributeWithLeftImageContent:(NSString *)string labelColor:(UIColor *)color labelFont:(UIFont *)font imageName:(NSString *)imageName imageFrame:(CGRect)frame
{
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:string];
    // 修改富文本中的不同文字的样式
    [attri addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, string.length-1)];
    [attri addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length-1)];
    // 添加表情
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:imageName];
    // 设置图片大小
    attch.bounds = frame;
    // 创建带有图片的富文本
    NSAttributedString *stringImage = [NSAttributedString attributedStringWithAttachment:attch];
    [attri insertAttributedString:stringImage atIndex:0];
    // 用label的attributedText属性来使用富文本
    self.attributedText = attri;
}

//最后右边带图片的富文本
-(void)attributeWithImageContent:(NSString *)string labelColor:(UIColor *)color labelFont:(UIFont *)font imageName:(NSString *)imageName imageFrame:(CGRect)frame
{
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:string];
    // 修改富文本中的不同文字的样式
    [attri addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, string.length-1)];
    [attri addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length-1)];
    // 添加表情
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:imageName];
    // 设置图片大小
    attch.bounds = frame;
    // 创建带有图片的富文本
    NSAttributedString *attributedString = [NSAttributedString attributedStringWithAttachment:attch];
    [attri appendAttributedString:attributedString];
    // 用label的attributedText属性来使用富文本
    self.attributedText = attri;
}


@end
