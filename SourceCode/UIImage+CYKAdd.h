//
//  UIImage+CYKAdd.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (CYKAdd)

+ (UIImage *)imageWithColor:(UIColor *)color;

- (UIImage *) imageAddText:(NSString *)content font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
