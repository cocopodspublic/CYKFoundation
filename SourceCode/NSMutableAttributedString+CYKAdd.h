//
//  NSMutableAttributedString+CYKAdd.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (CYKAdd)

+ (NSMutableAttributedString *)mutableStr:(NSString *)string Color:(UIColor*)color range:(NSRange)rang;

+ (NSMutableAttributedString *)mutableStr:(NSString *)string FontSize:(CGFloat)FontSize range:(NSRange)rang;

+ (NSMutableAttributedString *)mutableStr:(NSString *)string FontSize:(CGFloat)FontSize Color:(UIColor*)color range:(NSRange)rang;


@end

NS_ASSUME_NONNULL_END
