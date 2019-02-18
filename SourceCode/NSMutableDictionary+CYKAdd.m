//
//  NSMutableDictionary+CYKAdd.m
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import "NSMutableDictionary+CYKAdd.h"

@implementation NSMutableDictionary (CYKAdd)


- (BOOL)containsObjectForKey:(id)key {
    if (!key) return NO;
    return self[key] != nil;
}

- (void) setIntegerValue:(NSInteger)value forKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self setValue:[NSNumber numberWithInteger:value] forKey:key];
}

- (void) setDoubleValue:(double)value forKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self setValue:[NSNumber numberWithDouble:value] forKey:key];
}

- (void) setLongValue:(long long)value forKey:(NSString *)key
{
    if (!key) { 
        return;
    }
    [self setValue:[NSNumber numberWithLongLong:value] forKey:key];
}

- (NSInteger )IntegerObjectForKey:(NSString *)key{

    id value=[self objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    }
    return 0;
    
}
- (double )DoubleObjectForKey:(NSString *)key{
    
    id value=[self objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value doubleValue];
    }
    return 0.00;
    
}
- (long )LongObjectForKey:(NSString *)key{
    
    id value=[self objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value longValue];
    }
    return 0.00;
    
}


@end
