//
//  NSMutableAttributedString+CYKAdd.m
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import "NSMutableAttributedString+CYKAdd.h"

@implementation NSMutableAttributedString (CYKAdd)

+ (NSMutableAttributedString *)mutableStr:(NSString *)string Color:(UIColor*)color range:(NSRange)rang{
    
    return [NSMutableAttributedString mutableStr:string FontSize:0 Color:color range:rang];
}

+ (NSMutableAttributedString *)mutableStr:(NSString *)string FontSize:(CGFloat)FontSize range:(NSRange)rang{
    
    return [NSMutableAttributedString mutableStr:string FontSize:FontSize Color:nil range:rang];
}

+ (NSMutableAttributedString *)mutableStr:(NSString *)string FontSize:(CGFloat)FontSize Color:(UIColor*)color range:(NSRange)rang{
    
    NSMutableAttributedString * attributedStr = [[NSMutableAttributedString alloc] initWithString:string];
    NSDictionary *attributeDict;
    if (FontSize==0) {
        attributeDict= [NSDictionary dictionaryWithObjectsAndKeys:
                        color,NSForegroundColorAttributeName,//字体颜色
                        nil];
    }else if (color==nil){
        attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:
                         [UIFont systemFontOfSize:FontSize],NSFontAttributeName,//字体
                         nil];
    }else{
        attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:
                         [UIFont systemFontOfSize:FontSize],NSFontAttributeName,//字体
                         color,NSForegroundColorAttributeName,//字体颜色
                         nil];
        
    }
    
    [attributedStr addAttributes:attributeDict range:rang];
    return attributedStr;
    
    
    return nil;
}

@end
