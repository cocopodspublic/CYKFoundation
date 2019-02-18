//
//  UILabel+CYKAdd.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (CYKAdd)

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor;

+ (UILabel *)labelWithText:(NSString *)text
                      font:(UIFont *)font
                 textColor:(UIColor *)textColor;

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor
             textAlignment:(NSTextAlignment)textAlignment;

+ (UILabel *)labelWithText:(NSString *)text
                      font:(UIFont *)font
                 textColor:(UIColor *)textColor
             textAlignment:(NSTextAlignment)textAlignment;



//MARK:富文本
-(void)paragraph:(NSString *)string;


//MARK:左边带图片的富文本
-(void)attributeWithLeftImageContent:(NSString *)string labelColor:(UIColor *)color labelFont:(UIFont *)font imageName:(NSString *)imageName imageFrame:(CGRect)frame;



//MARK:最后右边带图片的富文本
-(void)attributeWithImageContent:(NSString *)string labelColor:(UIColor *)color labelFont:(UIFont *)font imageName:(NSString *)imageName imageFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
