//
//  NSNotificationCenter+CYKAdd.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (CYKAdd)

- (void)postNotificationWithName:(NSString *)name;

- (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object;

- (void)postNotificationOnMainThreadWithName:(NSString *)name userInfo:(NSDictionary *)userInfo;

- (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo;

- (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo waitUntilDone:(BOOL)wait ;

@end

NS_ASSUME_NONNULL_END
