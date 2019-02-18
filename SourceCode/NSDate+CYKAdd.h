//
//  NSDate+CYKAdd.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (CYKAdd)

+ (NSDate *) formatStringToDate:(NSString *)dateString;

+ (NSString *) relativeDateString:(NSTimeInterval)time;

+(NSDateComponents *)CalculatedTime:(NSString *)oldTimeStr;

+(NSString *)CalculatedTimeDifference:(NSString *)oldTimeStr;

- (NSString *) weekDateString;

- (NSString *) normalDateString;

- (BOOL) isToday;
- (BOOL) isYesterday;

@end

NS_ASSUME_NONNULL_END
