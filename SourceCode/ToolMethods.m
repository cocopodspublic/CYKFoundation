//
//  ToolMethods.m
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import "ToolMethods.h"

@implementation ToolMethods

//每次改变设备属性 准备发送请求 不一定会发过去 0.3秒后不改变 就发送最后的值
+(void)readyToSetDeviceStatusWithSel:(SEL)aSetStatusMethod
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:aSetStatusMethod object:nil];//清除self中的aSetStatusMethod定时器方法
    [self performSelector:aSetStatusMethod withObject:nil afterDelay:0.3f];
}

#pragma mark-判断手机号是否是正确的格式
//+(BOOL)isMobileNum:(NSString *)mobNum {
//
//    //    电信号段:133/149/153/173/177/180/181/189
//    //    联通号段:130/131/132/145/155/156/171/175/176/185/186
//    //    移动号段:134/135/136/137/138/139/147/150/151/152/157/158/159/178/182/183/184/187/188
//    //    虚拟运营商:170
//
//    NSString *MOBILE = @"^1(3[0-9]|4[579]|5[0-35-9]|7[0135-8]|8[0-9])\\d{8}$";
//
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//
//    return [regextestmobile evaluateWithObject:mobNum];
//}
+ (BOOL)valiMobile:(NSString *)mobile{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
     }else{
        /**
          * 移动号段正则表达式
         */
         NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
         /**
          * 联通号段正则表达式
          */
          NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
         /**
          * 电信号段正则表达式
          */
         NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
         NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
         BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
          NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
         BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
         NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
          BOOL isMatch3 = [pred3 evaluateWithObject:mobile];

          if (isMatch1 || isMatch2 || isMatch3) {
                return YES;
             }else{
                return NO;
             }
     }
    
}

#pragma mark-判断邮箱格式是否正确
+ (BOOL)isAvailableEmail:(NSString *)email {
     NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
     NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
     return [emailTest evaluateWithObject:email];
 }

#pragma mark-警告提示
+(void)alertInformation:(NSString *)str{
    
    //    dispatch_async(dispatch_get_main_queue(), ^{
    
    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:nil message:str delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    
    //    });
    
}

+(void)alertInformation:(NSString *)str  title:(NSString *)title{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:title message:str delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        
    });
    
}


#pragma mark-获取当前的时间
+(NSString *)getNowHourMinute{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SS"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
    
}
#pragma mark-删除字符串中的特定字符
+(NSString *)stringDeleteString:(NSString *)str{
    NSMutableString *str1 = [NSMutableString stringWithString:str];
    for (int i = 0; i < str1.length; i++) {
        unichar c = [str1 characterAtIndex:i];
        NSRange range = NSMakeRange(i, 1);
        if (c == ' ' || c == ':' || c == '/' || c == '(' || c == ')') { //此处可以是任何字符
            [str1 deleteCharactersInRange:range];
            --i;
        }
    }
    NSString *newstr = [NSString stringWithString:str1];
    return newstr;
    
    
    
}



#pragma mark-动态获取字符串的高度
+(CGFloat)heightWithWidth:(CGFloat)width font:(CGFloat)font str:(NSString *)string{
    UIFont * fonts = [UIFont systemFontOfSize:font];
    CGSize size  = CGSizeMake(width, 1000000000000.0);
    NSDictionary * dict  = [NSDictionary dictionaryWithObjectsAndKeys:fonts,NSFontAttributeName ,nil];
    size = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size.height;
}

#pragma mark-动态获取字符串的kuan度
+(CGFloat)WidthWithHeight:(CGFloat)height font:(CGFloat)font str:(NSString *)string{
    UIFont * fonts = [UIFont systemFontOfSize:font];
    CGSize size  = CGSizeMake(1000000000000.0, height);
    NSDictionary * dict  = [NSDictionary dictionaryWithObjectsAndKeys:fonts,NSFontAttributeName ,nil];
    size = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size.width;
}



#pragma mark-汉字转拼音
+ (NSString *)transform:(NSString *)chinese
{
    // 空值判断
    if (chinese.length==0) {
        return @"";
    }
    // 将字符串转为NSMutableString类型
    NSMutableString *string = [chinese mutableCopy];
    // 将字符串转换为拼音音调格式
    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformMandarinLatin, NO);
    // 去掉音调符号
    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformStripDiacritics, NO);
    // 返回不带声调拼音字符串
    
    return string;
    
}


#pragma mark-比较两个日期的大小  日期格式
+ (BOOL)compareDate:(NSString*)aDate withDate:(NSString*)bDate
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *dateA = [dateFormatter dateFromString:aDate];
    NSDate *dateB = [dateFormatter dateFromString:bDate];
    NSComparisonResult result = [dateA compare:dateB];
    
    if (result == NSOrderedDescending) {
        //bDate比aDate小
        return YES;
    }
    else if (result ==NSOrderedAscending){
        //bDate比aDate大
        return NO;
    }else if (result ==NSOrderedSame){
        //bDate==aDate
        return NO;
    }
    
    return NO;
    
}

#pragma mark-判断图片类型,通过图片Data数据第一个字节 来获取图片扩展名
+(NSString *)contentTypeForImageData:(NSData *)data
{
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c)
    {
        case 0xFF:
            return @"jpeg";
            
        case 0x89:
            return @"png";
            
        case 0x47:
            return @"gif";
            
        case 0x49:
        case 0x4D:
            return @"tiff";
            
        case 0x52:
            if ([data length] < 12) {
                return nil;
            }
            
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"]
                && [testString hasSuffix:@"WEBP"])
            {
                return @"webp";
            }
            
            return nil;
    }
    
    return nil;
}



//#pragma mark-监测网络状态
//+(void)MonitoringNetworkState{
//
//    AFNetworkReachabilityManager *ANR = [AFNetworkReachabilityManager sharedManager];
//    [ANR setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        switch (status) {
//            case AFNetworkReachabilityStatusUnknown:
//                break;
//            case AFNetworkReachabilityStatusNotReachable: {
//                [MBProgressHUD showWarnMessage:@"当前设备无网络"];
//            }
//                break;
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//                [MBProgressHUD showWarnMessage:@"当前Wi-Fi网络"];
//                break;
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//                [MBProgressHUD showWarnMessage:@"当前蜂窝移动网络"];
//                break;
//            default:
//                break;
//        }
//    }];
//    [ANR startMonitoring];
//
//}


#pragma mark-颜色Hex
+ (UIColor *) colorWithHexString: (NSString *)color{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // 判断前缀并剪切掉
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

#pragma mark-判断一个字符串是纯数字
+ (BOOL)isPureNum:(NSString *)text {
    if (!text) {
        return NO;
    }
    NSScanner *scan = [NSScanner scannerWithString:text];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

#pragma mark-判断字符串的字符长度（大小写英文字母，英文字符，数字字符长度为1，汉字或汉字符号字符长度为2，表情字符长度为4）
+(NSUInteger)textLength: (NSString *) text{
    
    NSUInteger asciiLength = 0;
    
    for (NSUInteger i = 0; i < text.length; i++) {
        
        
        unichar uc = [text characterAtIndex: i];
        
        asciiLength += isascii(uc) ? 1 : 2;
    }
    
    NSUInteger unicodeLength = asciiLength;
    
    return unicodeLength;
    
}

#pragma mark-按照字节长度截取字符，index为长度
+(NSString *)subStringByByteWithIndex:(NSInteger)index text:(NSString *)BeString{
    
    NSInteger sum = 0;
    
    NSString *subStr = [[NSString alloc] init];
    
    for(int i = 0; i<BeString.length; i++){
        
        unichar strChar = [BeString characterAtIndex:i];
        
        if(strChar < 256){
            sum += 1;
        }
        else {
            sum += 2;
        }
        if (sum > index) {
            
            subStr = [BeString substringToIndex:i];
            return subStr;
        }
        
    }
    
    return subStr;
}

#pragma mark-判断是否是数字或字母
+(BOOL)judgePassWordLegal:(NSString *)str Min:(NSInteger )min Max:(NSInteger)max{
    BOOL result = false;
    if (str.length >=min&&str.length<=max){
        NSString * regex = [NSString stringWithFormat:@"^[0-9A-Za-z]{%ld,%ld}$",min,max];
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:str];
    }
    return result;
}

#pragma mark-清除小数后面的0
+(NSString *)deleteFloatZero:(NSString *)str{
    
    NSNumber * nsNumber = @(str.floatValue);
    NSString * outNumber = [NSString stringWithFormat:@"%@",nsNumber];
    return outNumber;
    
}

+(void)sendNotificationName:(NSString *)name object:(id)object{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object];
    
}

+(void)deleteNotificationVC:(id)VC Name:(NSString *)name object:(id)object{
    
    [[NSNotificationCenter defaultCenter] removeObserver:VC name:name object:object];
    
}


#pragma mark- 判断是否允许消息通知8.0后
+ (BOOL)isMessageNotificationServiceOpen {
    
    return [[UIApplication sharedApplication] isRegisteredForRemoteNotifications];
    
}

#pragma mark- 删除空格字符
+(NSString *)deleteBlankFromString:(NSString *)Str{
    NSCharacterSet  *set = [NSCharacterSet whitespaceCharacterSet];
    Str = [Str stringByTrimmingCharactersInSet:set];
    return Str;
}

/** 密码较验 */
+ (BOOL)validatePassword:(NSString *)password
{
    NSString *passRegex = @"[a-zA-Z0-9]{6,18}";
    
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passRegex];;
    
    return [passwordTest evaluateWithObject:password];
}

/** 短信验证码较验 */
+ (BOOL)validateSMSCode:(NSString *)code
{
    NSString *codeRegex = @"[0-9]{6}";
    
    NSPredicate *codeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",codeRegex];;
    
    return [codeTest evaluateWithObject:code];
}

/** 银行卡较验 */
+ (BOOL)validateBankCard:(NSString *)cardNumber
{
    if(cardNumber.length==0) {
        return NO;
    }
    
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < cardNumber.length; i++) {
        c = [cardNumber characterAtIndex:i];
        if (isdigit(c)) {
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--) {
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo) {
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        } else {
            addend = digit;
        }
        
        sum += addend;
        timesTwo = !timesTwo;
    }
    
    int modulus = sum % 10;
    return modulus == 0;
}

/** 身份证较验 */
+ (BOOL)validateIDCardNumber: (NSString *)value
{
    
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSInteger length =0;
    if (!value) {
        return NO;
    }else {
        length = value.length;
        //不满足15位和18位，即身份证错误
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    
    // 省份代码
    NSArray *areasArray = @[@"11",@"12",@"13",@"14",@"15",@"21",@"22",
                            @"23",@"31",@"32",@"33",@"34",@"35",@"36",
                            @"37",@"41",@"42",@"43",@"44",@"45",@"46",
                            @"50",@"51",@"52",@"53",@"54",@"61",@"62",
                            @"63",@"64",@"65",@"71",@"81",@"82",@"91"];
    
    // 检测省份身份行政区代码
    NSString *valueStart2 = [value substringToIndex:2];
    BOOL areaFlag =NO; //标识省份代码是否正确
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return NO;
    }
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    //分为15位、18位身份证进行校验
    switch (length) {
        case 15:
            //获取年份对应的数字
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                //创建正则表达式 NSRegularExpressionCaseInsensitive：不区分字母大小写的模式
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }
            //使用正则表达式匹配字符串 NSMatchingReportProgress:找到最长的匹配字符串后调用block回调
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            if(numberofMatch >0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}(((19|20)\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|((19|20)\\d{2}(0[13578]|1[02])31)|((19|20)\\d{2}02(0[1-9]|1\\d|2[0-8]))|((19|20)([13579][26]|[2468][048]|0[048])0229))\\d{3}(\\d|X|x)?$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}(((19|20)\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|((19|20)\\d{2}(0[13578]|1[02])31)|((19|20)\\d{2}02(0[1-9]|1\\d|2[0-8]))|((19|20)([13579][26]|[2468][048]|0[048])0229))\\d{3}(\\d|X|x)?$" options:NSRegularExpressionCaseInsensitive error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            
            if(numberofMatch >0) {
                //1：校验码的计算方法 身份证号码17位数分别乘以不同的系数。从第一位到第十七位的系数分别为：7－9－10－5－8－4－2－1－6－3－7－9－10－5－8－4－2。将这17位数字和系数相乘的结果相加。
                
                int S = [value substringWithRange:NSMakeRange(0,1)].intValue*7 + [value substringWithRange:NSMakeRange(10,1)].intValue *7 + [value substringWithRange:NSMakeRange(1,1)].intValue*9 + [value substringWithRange:NSMakeRange(11,1)].intValue *9 + [value substringWithRange:NSMakeRange(2,1)].intValue*10 + [value substringWithRange:NSMakeRange(12,1)].intValue *10 + [value substringWithRange:NSMakeRange(3,1)].intValue*5 + [value substringWithRange:NSMakeRange(13,1)].intValue *5 + [value substringWithRange:NSMakeRange(4,1)].intValue*8 + [value substringWithRange:NSMakeRange(14,1)].intValue *8 + [value substringWithRange:NSMakeRange(5,1)].intValue*4 + [value substringWithRange:NSMakeRange(15,1)].intValue *4 + [value substringWithRange:NSMakeRange(6,1)].intValue*2 + [value substringWithRange:NSMakeRange(16,1)].intValue *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                
                //2：用加出来和除以11，看余数是多少？余数只可能有0－1－2－3－4－5－6－7－8－9－10这11个数字
                int Y = S %11;
                NSString *M =@"F";
                NSString *JYM =@"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 3：获取校验位
                
                NSString *lastStr = [value substringWithRange:NSMakeRange(17,1)];
                
                //4：检测ID的校验位
                if ([lastStr isEqualToString:@"x"]) {
                    if ([M isEqualToString:@"X"]) {
                        return YES;
                    }else{
                        
                        return NO;
                    }
                }else{
                    
                    if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
                        return YES;
                    }else {
                        return NO;
                    }
                    
                }
                
                
            }else {
                return NO;
            }
        default:
            return NO;
    }
}


@end
