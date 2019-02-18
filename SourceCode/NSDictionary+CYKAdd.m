//
//  NSDictionary+CYKAdd.m
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import "NSDictionary+CYKAdd.h"

@implementation NSDictionary (CYKAdd)

- (BOOL)containsObjectForKey:(id)key {
    if (!key) return NO;
    return self[key] != nil;
}


@end
