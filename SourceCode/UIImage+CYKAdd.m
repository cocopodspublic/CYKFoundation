//
//  UIImage+CYKAdd.m
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import "UIImage+CYKAdd.h"

@implementation UIImage (CYKAdd)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *) imageAddText:(NSString *)content font:(UIFont *)font
{
    //画布大小
    CGSize size = self.size;
    //创建一个基于位图的上下文
    UIGraphicsBeginImageContextWithOptions(size,NO,0.0);//opaque:NO  scale:0.0
    
    [self drawAtPoint:CGPointMake(0, 0)];
    
    CGRect rect = CGRectMake(20.0f, 20.0f, size.width-20.0f, size.height-20.0f);
    
    //绘制文字
    [content drawInRect:rect
         withAttributes:@{ NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    UIImage *newImage= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
