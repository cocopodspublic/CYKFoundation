//
//  NSMutableDictionary+CYKAdd.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (CYKAdd)

- (BOOL)containsObjectForKey:(id)key;

- (void) setIntegerValue:(NSInteger)value forKey:(NSString *)key;
- (void) setDoubleValue:(double)value forKey:(NSString *)key;
- (void) setLongValue:(long long)value forKey:(NSString *)key;

- (NSInteger )IntegerObjectForKey:(NSString *)key;
- (double )DoubleObjectForKey:(NSString *)key;
- (long )LongObjectForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
