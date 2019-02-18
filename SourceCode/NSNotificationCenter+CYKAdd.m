//
//  NSNotificationCenter+CYKAdd.m
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import "NSNotificationCenter+CYKAdd.h"
#include <pthread.h>

@implementation NSNotificationCenter (CYKAdd)

- (void)postNotificationWithName:(NSString *)name{
    [self postNotificationOnMainThreadWithName:name object:nil userInfo:nil waitUntilDone:NO];
}

- (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object{
    [self postNotificationOnMainThreadWithName:name object:object userInfo:nil waitUntilDone:NO];
}

- (void)postNotificationOnMainThreadWithName:(NSString *)name userInfo:(NSDictionary *)userInfo{
    [self postNotificationOnMainThreadWithName:name object:nil userInfo:userInfo waitUntilDone:NO];
}

- (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo{
    [self postNotificationOnMainThreadWithName:name object:object userInfo:userInfo waitUntilDone:NO];
}

- (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo waitUntilDone:(BOOL)wait {
    if (pthread_main_np()) {
        [self postNotificationName:name object:object userInfo:userInfo];
        return;
    }
    NSMutableDictionary *info = [[NSMutableDictionary allocWithZone:nil] initWithCapacity:3];
    if (name) [info setObject:name forKey:@"name"];
    if (object) [info setObject:object forKey:@"object"];
    if (userInfo) [info setObject:userInfo forKey:@"userInfo"];
    [[self class] performSelectorOnMainThread:@selector(postNotificationInfo:) withObject:info waitUntilDone:wait];//YES时主线程执行完后才会执行通知；NO时与主线程并行执行通知
}

- (void)postNotificationInfo:(NSDictionary *)info {
    NSString *name = [info objectForKey:@"name"];
    id object = [info objectForKey:@"object"];
    NSDictionary *userInfo = [info objectForKey:@"userInfo"];
    [self postNotificationName:name object:object userInfo:userInfo];
}

@end
