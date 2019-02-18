//
//  NSUserDefaults+CYKAdd.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (CYKAdd)

#pragma mark-本地存储与读取字符串
+(void)saveLocalDataObject:(NSString *)Object withkey:(NSString *)key;
+(NSString *)getLocalDatakey:(NSString *)key;

#pragma mark-本地存储与读取数组
+(void)saveLocalDataArray:(NSArray *)array withkey:(NSString *)key;
+(NSArray *)getLocalArrayDatakey:(NSString *)key;

#pragma mark-本地存储与读取字典
+(void)saveLocalDatadict:(NSDictionary *)dict withkey:(NSString *)key;
+(NSDictionary *)getLocaldictDatakey:(NSString *)key;

#pragma mark-本地存储与读取布尔值
+(void)saveLocalbool:(BOOL )value withkey:(NSString *)key;
+(BOOL)getLocalboolValueKey:(NSString *)key;

#pragma mark-本地存储与读取照片
+(void)saveImage:(UIImage *)headImage key:(NSString *)key;
+(UIImage *)getImageKey:(NSString *)key;

#pragma mark-删除本地存储
+(void)deleteLocalData:(NSString *)key;


@end

NS_ASSUME_NONNULL_END
