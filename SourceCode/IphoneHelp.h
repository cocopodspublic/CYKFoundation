//
//  IphoneHelp.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DeviceSizeType) {
    DeviceSizeUnknown = 0,
    DeviceSize35inch,
    DeviceSize4inch,
    DeviceSize47inch,
    DeviceSize55inch,
    DeviceSize58inch,//iPhone X
};


@interface IphoneHelp : NSObject

+ (DeviceSizeType)currentPhoneSize;
//NavigationBarHeight
+(CGFloat)getNavigationBarHeight;

//StatusBarHeight
+(CGFloat)getStatusBarHeight;

//获取iphoneX的额外高度
+(CGFloat)getExtraHeight;

//获取iphoneX的tabbar高度
+(CGFloat)getTarbarHeight;

#pragma mark -- 获取设备型号
+ (NSString *)iphoneType;

#pragma mark -- 获取系统版本号
+(NSString *)getCurrentSystemVersion;
#pragma mark -- 获取UUID
+(NSString *)getCurrentUUID;
#pragma mark -- 获取设备类型（iPhone/iPad/ipod）
+(NSString *)getCurrentModel;
#pragma mark -- 获取设备昵称
+(NSString *)getCurrentName;

#pragma mark -- 获取App版本
+(NSString *)getapp_Version;
#pragma mark -- 获取App build版本
+(NSString *)getApp_build_Version;
#pragma mark -- 获取AppStore版本  urlString:App 在App Store里的地址
+(NSString *)getAppStore_Version:(NSString *)urlString;
@end
