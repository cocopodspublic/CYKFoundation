//
//  IphonePermisson.m
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import "IphonePermisson.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <AVFoundation/AVFoundation.h>
#import <AddressBook/AddressBook.h>
#import <Contacts/Contacts.h>

#define iOS9Later   ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)

@implementation IphonePermisson

/**
 权限状态检查
 */
- (BOOL)isHavePhotoPermisson {
    NSInteger authorizationStatus;
    if (iOS9Later) {
        authorizationStatus = [PHPhotoLibrary authorizationStatus];
    } else {
        authorizationStatus = [ALAssetsLibrary authorizationStatus];
    }
    
    if (authorizationStatus == 3) {
        return YES;
    } else {
        return NO;
    }
}




/**
 根据不同的权限去设置
 */
- (void)toSettingPermissionFor:(PermissonType)type {
    switch (type) {
        case PermissonTypePhoto:
            NSLog(@"");
            break;
            
        default:
            break;
    }
}


/** 设置权限界面 */
- (void)toSettingPage {
    if (iOS9Later) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:General&path=Reset"]];
    }
}

/** 对于权限未处理的设置 */
- (void)requestAuthorizationWhenNotDeterminedWithHandel: (void (^)(void))compleHandel {
    if (iOS9Later) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (compleHandel) {
                        compleHandel();
                    }
                });
            }];
        });
    } else {
        [[ALAssetsLibrary new] enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        } failureBlock:nil];
    }
}

@end
