//
//  DictionaryConversionString.m
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import "DictionaryConversionString.h"

@implementation DictionaryConversionString

#pragma mark-JSON字符串转字典
+ (NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString {
    if ([JSONString isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    return responseJSON;
}

#pragma mark-字典转JSON字符串
+ (NSString *)parseNSDictionaryToJSONString:(NSDictionary *)dict{
    
    if ([dict isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
