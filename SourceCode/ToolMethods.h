//
//  ToolMethods.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToolMethods : NSObject

//每次改变设备属性 准备发送请求 不一定会发过去 0.3秒后不改变 就发送最后的值
+(void)readyToSetDeviceStatusWithSel:(SEL)aSetStatusMethod;

#pragma mark-判断手机号是否是正确的格式
//+(BOOL)isMobileNum:(NSString *)mobNum;
+ (BOOL)valiMobile:(NSString *)mobile;
#pragma mark-判断邮箱格式是否正确
//利用正则表达式验证
+ (BOOL)isAvailableEmail:(NSString *)email;
#pragma mark-警告框
+(void)alertInformation:(NSString *)str;
+(void)alertInformation:(NSString *)str  title:(NSString *)title;



#pragma mark-获取当前的时间
+(NSString *)getNowHourMinute;

#pragma mark-删除指定的字符串
+(NSString *)stringDeleteString:(NSString *)str;

#pragma mark-动态获取宽高
+(CGFloat)heightWithWidth:(CGFloat)width font:(CGFloat)font str:(NSString *)string;
+(CGFloat)WidthWithHeight:(CGFloat)height font:(CGFloat)font str:(NSString *)string;



#pragma mark-汉字转拼音
+(NSString *)transform:(NSString *)chinese;

#pragma mark-比较两个日期的大小  日期格式为2016-08-14 08：46：20
+ (BOOL)compareDate:(NSString*)aDate withDate:(NSString*)bDate;




//#pragma mark-监测网络状态
//+(void)MonitoringNetworkState;

#pragma mark-通过图片Data数据第一个字节 来获取图片扩展名
+(NSString *)contentTypeForImageData:(NSData *)data;

#pragma mark-颜色Hex
+ (UIColor *) colorWithHexString: (NSString *)color;

#pragma mark-判断一个字符串是纯数字
+(BOOL)isPureNum:(NSString *)text;

#pragma mark-判断字符串的字符长度
+(NSUInteger)textLength: (NSString *) text;

#pragma mark-按照字节长度截取字符
+(NSString *)subStringByByteWithIndex:(NSInteger)index text:(NSString *)BeString;

#pragma mark-判断是否是数字或字母
+(BOOL)judgePassWordLegal:(NSString *)str Min:(NSInteger )min Max:(NSInteger)max;

#pragma mark-清除小数后面的0
+(NSString *)deleteFloatZero:(NSString *)str;

+(void)sendNotificationName:(NSString *)name object:(id)object;
+(void)deleteNotificationVC:(id)VC Name:(NSString *)name object:(id)object;


#pragma mark- 判断是否允许消息通知
+ (BOOL)isMessageNotificationServiceOpen;

#pragma mark- 删除空格字符
+(NSString *)deleteBlankFromString:(NSString *)Str;


/** 密码较验 */
+ (BOOL)validatePassword:(NSString *)password;

/** 短信验证码较验 */
+ (BOOL)validateSMSCode:(NSString *)code;

/** 银行卡较验 */
+ (BOOL)validateBankCard:(NSString *)cardNumber;

/** 身份证较验 */
+ (BOOL)validateIDCardNumber: (NSString *)value;



@end

NS_ASSUME_NONNULL_END
