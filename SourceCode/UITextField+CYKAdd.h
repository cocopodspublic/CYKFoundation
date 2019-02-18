//
//  UITextField+CYKAdd.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (CYKAdd)

+(UITextField *)setFrame:(CGRect )frame placeholder:(NSString *)PHolder color:(UIColor *)color font:(UIFont *)font textAlignment:(NSTextAlignment )textAlignment textBorderStyle:(UITextBorderStyle )textBorderStyle;

+(UITextField *)setFrame:(CGRect )frame placeholder:(NSString *)PHolder;

/**
 Set all text selected.
 */
- (void)selectAllText;

/**
 Set text in range selected.
 
 @param range  The range of selected text in a document.
 */
- (void)setSelectedRange:(NSRange)range;

@end

NS_ASSUME_NONNULL_END
