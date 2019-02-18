//
//  UIColor+CYKAdd.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (CYKAdd)

+(UIColor *)colorWithHexString: (NSString *)HexColor;

+(UIColor *)colorWithR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
