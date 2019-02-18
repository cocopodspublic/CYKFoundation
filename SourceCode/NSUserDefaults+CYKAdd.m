//
//  NSUserDefaults+CYKAdd.m
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import "NSUserDefaults+CYKAdd.h"

@implementation NSUserDefaults (CYKAdd)

#pragma mark-本地存储和读取字符串
+(void)saveLocalDataObject:(NSString *)Object withkey:(NSString *)key{
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    [user setObject:Object forKey:key];
    
}
+(NSString *)getLocalDatakey:(NSString *)key{
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    return [user objectForKey:key];
}


#pragma mark-本地存储和读取数组
+(void)saveLocalDataArray:(NSArray *)array withkey:(NSString *)key{
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    [user setObject:array forKey:key];
    
}

+(NSArray *)getLocalArrayDatakey:(NSString *)key{
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    return [user objectForKey:key];
}

#pragma mark-本地存储和读取字典
+(void)saveLocalDatadict:(NSDictionary *)dict withkey:(NSString *)key{
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    [user setObject:dict forKey:key];
}

+(NSDictionary *)getLocaldictDatakey:(NSString *)key{
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    return [user objectForKey:key];
}

#pragma mark-本地存储和读取布尔值
+(void)saveLocalbool:(BOOL )value withkey:(NSString *)key{
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    [user setBool:value forKey:key];
}

+(BOOL)getLocalboolValueKey:(NSString *)key{
    
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    BOOL value=[user boolForKey:key];
    return value;
}

#pragma mark-本地存储与读取图片
//保存照片到沙盒路径(保存)
+(void)saveImage:(UIImage *)headImage key:(NSString *)key{//type只有label或icon
    
    NSUserDefaults* user = [NSUserDefaults standardUserDefaults];
    [user setObject:UIImagePNGRepresentation(headImage) forKey:key];
    
    NSArray *array=[user objectForKey:@"deletePicture"];
    if (array) {
        if (array.count>0) {
            if (![array containsObject:key]) {
                NSMutableArray * keyArray=[[NSMutableArray alloc]initWithArray:array];
                [keyArray addObject:key];
                [user setObject:keyArray forKey:@"deletePicture"];
            }
        }
    }else{
        NSMutableArray * keyArray=[[NSMutableArray alloc]initWithArray:array];
        [keyArray addObject:key];
        [user setObject:keyArray forKey:@"deletePicture"];
    }
    
}

+(UIImage *)getImageKey:(NSString *)key{
    
    NSUserDefaults* user = [NSUserDefaults standardUserDefaults];
    
    NSData * imageData=[user objectForKey:key];
    UIImage * image;
    if ([imageData isKindOfClass:[NSData class]]) {
        image=[UIImage imageWithData:imageData];
        return image;
    }
    
    return nil;
    
}

//判断图片是否存在
+(BOOL)isHaveImageKey:(NSString *)key{
    
    NSUserDefaults* user = [NSUserDefaults standardUserDefaults];
    NSData * imageData=[user objectForKey:key];
    if (imageData) {
        return YES;
    }
    return NO;
    
}



#pragma mark-删除本地存储
+(void)deleteLocalData:(NSString *)key{
    NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
    [user removeObjectForKey:key];
}


@end
