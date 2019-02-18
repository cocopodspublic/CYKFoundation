//
//  UIButton+CYKAdd.m
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import "UIButton+CYKAdd.h"

@implementation UIButton (CYKAdd)

+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle SelectedTitle:(NSString *)SelectedTitle NormalTitleColor:(UIColor *)NormalColor SelectedTitleColor:(UIColor *)SelectedColor NormalImage:(UIImage *)NormalImage SelectedImage:(UIImage *)SelectedImage NormalBackgroundImage:(UIImage *)NormalBackgroundImage SelectedBackgroundImage:(UIImage *)SelectedBackgroundImage FontSize:(CGFloat)fontSize{
    
    UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
    
    if (NormalTitle) {
        [button setTitle:NormalTitle forState:UIControlStateNormal];
    }
    
    if (SelectedTitle) {
        [button setTitle:SelectedTitle forState:UIControlStateSelected];
    }
    
    if (NormalColor) {
        [button setTitleColor:NormalColor forState:UIControlStateNormal];
    }
    
    if (SelectedColor) {
        [button setTitleColor:SelectedColor forState:UIControlStateSelected];
    }
    
    if (NormalImage) {
        [button setImage:NormalImage forState:UIControlStateNormal];
    }
    
    if (SelectedImage) {
        [button setImage:SelectedImage forState:UIControlStateSelected];
    }
    
    if (NormalBackgroundImage) {
        [button setBackgroundImage:NormalBackgroundImage forState:UIControlStateNormal];
    }
    if (SelectedBackgroundImage) {
        [button setBackgroundImage:SelectedBackgroundImage forState:UIControlStateSelected];
    }
    
    if (fontSize!=0) {
        button.titleLabel.font=[UIFont systemFontOfSize:fontSize];
    }
    
    return button;
}

+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle{
    
    return [UIButton buttonNormalTitle:NormalTitle SelectedTitle:nil NormalTitleColor:nil SelectedTitleColor:nil NormalImage:nil SelectedImage:nil NormalBackgroundImage:nil SelectedBackgroundImage:nil FontSize:0];
    
}
+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle SelectedTitle:(NSString *)SelectedTitle{
    
    return [UIButton buttonNormalTitle:NormalTitle SelectedTitle:SelectedTitle NormalTitleColor:nil SelectedTitleColor:nil NormalImage:nil SelectedImage:nil NormalBackgroundImage:nil SelectedBackgroundImage:nil FontSize:0];
}
+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle SelectedTitle:(NSString *)SelectedTitle NormalTitleColor:(UIColor *)NormalColor SelectedTitleColor:(UIColor *)SelectedColor{
    
    return [UIButton buttonNormalTitle:NormalTitle SelectedTitle:SelectedTitle NormalTitleColor:NormalColor SelectedTitleColor:SelectedColor NormalImage:nil SelectedImage:nil NormalBackgroundImage:nil SelectedBackgroundImage:nil FontSize:0];
}

+(UIButton *)buttonNormalImage:(UIImage *)NormalImage{
    
    return [UIButton buttonNormalTitle:nil SelectedTitle:nil NormalTitleColor:nil SelectedTitleColor:nil NormalImage:NormalImage SelectedImage:nil NormalBackgroundImage:nil SelectedBackgroundImage:nil FontSize:0];
}
+(UIButton *)buttonNormalImage:(UIImage *)NormalImage SelectedImage:(UIImage *)SelectedImage{
    
    return [UIButton buttonNormalTitle:nil SelectedTitle:nil NormalTitleColor:nil SelectedTitleColor:nil NormalImage:NormalImage SelectedImage:SelectedImage NormalBackgroundImage:nil SelectedBackgroundImage:nil FontSize:0];
}

+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle NormalBackgroundImage:(NSString *)NormalBackgroundImage{
    
    return [UIButton buttonNormalTitle:NormalTitle SelectedTitle:nil NormalTitleColor:nil SelectedTitleColor:nil NormalImage:nil SelectedImage:nil NormalBackgroundImage:NormalBackgroundImage SelectedBackgroundImage:nil FontSize:0];
}
+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle SelectedTitle:(NSString *)SelectedTitle NormalBackgroundImage:(NSString *)NormalBackgroundImage SelectedBackgroundImage:(NSString *)SelectedBackgroundImage{
    
    return [UIButton buttonNormalTitle:NormalTitle SelectedTitle:SelectedTitle NormalTitleColor:nil SelectedTitleColor:nil NormalImage:nil SelectedImage:nil NormalBackgroundImage:NormalBackgroundImage SelectedBackgroundImage:SelectedBackgroundImage FontSize:0];
}

+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle NormalTitleColor:(UIColor *)NormalColor NormalBackgroundImage:(NSString *)NormalBackgroundImage{
    
    return [UIButton buttonNormalTitle:NormalTitle SelectedTitle:nil NormalTitleColor:NormalColor SelectedTitleColor:nil NormalImage:nil SelectedImage:nil NormalBackgroundImage:NormalBackgroundImage SelectedBackgroundImage:nil FontSize:0];
}
+(UIButton *)buttonNormalTitle:(NSString *)NormalTitle SelectedTitle:(NSString *)SelectedTitle NormalTitleColor:(UIColor *)NormalColor SelectedTitleColor:(UIColor *)SelectedColor NormalBackgroundImage:(NSString *)NormalBackgroundImage SelectedBackgroundImage:(NSString *)SelectedBackgroundImage{
    
    return [UIButton buttonNormalTitle:NormalTitle SelectedTitle:SelectedTitle NormalTitleColor:NormalColor SelectedTitleColor:SelectedColor NormalImage:nil SelectedImage:nil NormalBackgroundImage:NormalBackgroundImage SelectedBackgroundImage:SelectedBackgroundImage FontSize:0];
}

-(void)setButtonBorderWidth:(CGFloat)Width color:(UIColor *)Color{
    
    self.layer.borderWidth=Width;
    self.layer.borderColor=Color.CGColor;
    
}

@end
