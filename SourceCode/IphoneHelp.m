//
//  IphoneHelp.m
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import "IphoneHelp.h"

//需要导入头文件：
#import <sys/utsname.h>

@implementation IphoneHelp

+ (DeviceSizeType)currentPhoneSize
{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if (screenHeight == 480) {
        return DeviceSize35inch;
    } else if (screenHeight == 568) {
        return DeviceSize4inch;
    } else if (screenHeight == 667) {
        return DeviceSize47inch;
    } else if (screenHeight == 736) {
        return DeviceSize55inch;
    } else if (screenHeight == 812) {
        return DeviceSize58inch;
    }
    return DeviceSizeUnknown;
}


+(CGFloat)getNavigationBarHeight
{
    return [self getStatusBarHeight] + 44;
    
}

+(CGFloat)getStatusBarHeight
{
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}

//获取iphoneX顶部的额外高度
+(CGFloat)getExtraHeight
{
    return [IphoneHelp currentPhoneSize] == DeviceSize58inch ? 24 : 0;
}

//获取iphoneX的tabbar高度
+(CGFloat)getTarbarHeight
{
    return [[UIApplication sharedApplication] statusBarFrame].size.height>20? 83:49;
    
}

#pragma mark -- 获取设备型号
+ (NSString *)iphoneType{
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    if ([platform isEqualToString:@"iPod1,1"])  return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])  return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])  return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])  return @"iPad 1G";
    if ([platform isEqualToString:@"iPad2,1"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"]) return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"]) return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad3,1"]) return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"]) return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])  return @"iPad 4";
    if ([platform isEqualToString:@"iPad4,1"]) return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])  return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])  return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])  return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"])  return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"])  return @"iPad Mini 2G";
    if ([platform isEqualToString:@"i386"])  return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])  return @"iPhone Simulator";
    
    return platform;
}

#pragma mark -- 获取系统版本号
+(NSString *)getCurrentSystemVersion{
    
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    return phoneVersion;
    
}

#pragma mark -- 获取UUID
+(NSString *)getCurrentUUID{
    
    NSString* UUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return UUID;
    
}

#pragma mark -- 获取设备类型（iPhone/iPad/ipod）
+(NSString *)getCurrentModel{
    
    NSString* model = [[UIDevice currentDevice] model] ;
    return model;
    
}

#pragma mark -- 获取设备昵称
+(NSString *)getCurrentName{
    
    NSString* Name = [[UIDevice currentDevice] name] ;
    return Name;
    
}

#pragma mark -- 获取App版本
+(NSString *)getapp_Version{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
    
}

#pragma mark -- 获取App build版本
+(NSString *)getApp_build_Version{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    return app_build;
    
}

#pragma mark -- 获取AppStore版本  urlString:App 在App Store里的地址
+(NSString *)getAppStore_Version:(NSString *)urlString{
    
    NSURL *url = [NSURL URLWithString:urlString];//这个URL地址是该app在iTunes connect里面的相关配置信息。其中id是该app在app store唯一的ID编号。
    
    NSString *jsonResponseString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    NSData *data = [jsonResponseString dataUsingEncoding:NSUTF8StringEncoding];
    
    //    解析json数据
    
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *array = json[@"results"];
    
    for (NSDictionary *dic in array) {
        NSString *AppStoreVersion = [dic valueForKey:@"version"]; // appStore 的版本号
        return AppStoreVersion;
    }
    
    return @"";
    
}

@end
