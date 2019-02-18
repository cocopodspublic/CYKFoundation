//
//  NSString+CYKAdd.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CYKAdd)

#pragma mark-清除小数后面的0
-(NSString *)deleteFloatZero;

#pragma mark- 删除空格字符
-(NSString *)deleteBlankFromString;

#pragma mark-判断手机号是否是正确的格式
-(BOOL)isMobileNum;

#pragma mark-判断一个字符串是纯数字
-(BOOL)isPureNum;

#pragma mark-汉字转拼音
-(NSString *)transform;

#pragma mark-删除字符串中的特定单个字符
-(NSString *)stringDeleteString:(NSString *)deleteStr;

#pragma mark-判断是否包含某字符
-(BOOL)judgeIsContainStr:(NSString *)containStr;

#pragma mark-判断字符是不是都是英文字母或数字
-(BOOL)judgeIsPasswordStr;

#pragma mark-判断是否身份证号
- (BOOL)validateIDCardNumber: (NSString *)value;

@end

NS_ASSUME_NONNULL_END
