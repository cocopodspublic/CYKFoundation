//
//  UIScreen+CYKAdd.m
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import "UIScreen+CYKAdd.h"

@implementation UIScreen (CYKAdd)

+ (CGFloat) screenScale
{
    CGFloat scale = 1.0;
    if([[UIScreen mainScreen]respondsToSelector:@selector(scale)]) {
        CGFloat tmp = [[UIScreen mainScreen] scale];
        if (tmp > 1.5) {
            scale = 2.0;
        }
    }
    return scale;
}

@end
