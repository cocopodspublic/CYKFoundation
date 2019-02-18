//
//  DictionaryConversionString.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DictionaryConversionString : NSObject

#pragma mark-JSON字符串转字典
+ (NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;

#pragma mark-字典转JSON字符串
+ (NSString *)parseNSDictionaryToJSONString:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
