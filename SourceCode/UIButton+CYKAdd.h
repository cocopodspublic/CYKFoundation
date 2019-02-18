//
//  UIButton+CYKAdd.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (CYKAdd)

+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle SelectedTitle:(NSString *)SelectedTitle NormalTitleColor:(UIColor *)NormalColor SelectedTitleColor:(UIColor *)SelectedColor NormalImage:(UIImage *)NormalImage SelectedImage:(UIImage *)SelectedImage NormalBackgroundImage:(NSString *)NormalBackgroundImage SelectedBackgroundImage:(NSString *)SelectedBackgroundImage FontSize:(CGFloat)fontSize;

#pragma mark-无图片BUtton
+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle;
+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle SelectedTitle:(NSString *)SelectedTitle;
+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle SelectedTitle:(NSString *)SelectedTitle NormalTitleColor:(UIColor *)NormalColor SelectedTitleColor:(UIColor *)SelectedColor;
#pragma mark-图片
+(UIButton *)buttonNormalImage:(UIImage *)NormalImage;
+(UIButton *)buttonNormalImage:(UIImage *)NormalImage SelectedImage:(UIImage *)SelectedImage;

#pragma mark-题目和背景图
+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle NormalBackgroundImage:(NSString *)NormalBackgroundImage;
+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle SelectedTitle:(NSString *)SelectedTitle NormalBackgroundImage:(NSString *)NormalBackgroundImage SelectedBackgroundImage:(NSString *)SelectedBackgroundImage;

#pragma mark-题目颜色和背景图
+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle NormalTitleColor:(UIColor *)NormalColor NormalBackgroundImage:(NSString *)NormalBackgroundImage;
+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle SelectedTitle:(NSString *)SelectedTitle NormalTitleColor:(UIColor *)NormalColor SelectedTitleColor:(UIColor *)SelectedColor NormalBackgroundImage:(NSString *)NormalBackgroundImage SelectedBackgroundImage:(NSString *)SelectedBackgroundImage;

-(void)setButtonBorderWidth:(CGFloat)Width color:(UIColor *)Color;

@end

NS_ASSUME_NONNULL_END
