//
//  IphonePermisson.h
//  CYKFoundation
//
//  Created by Jerry on 2018/2/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, PermissonType) {
    PermissonTypePhoto = 0,   // 相册
    PermissonTypeCapture,     // 相册
    PermissonTypeMicroPhone,  // 麦克风
    PermissonTypeLocation,    // 定位
    PermissonTypeAddressBook, // 通讯录
    PermissonTypePush,        // 推送
};

@interface IphonePermisson : NSObject

/** 各权限 */
- (BOOL)isHavePhotoPermisson;


/** 设置某种权限 */
- (void)toSettingPermissionFor:(PermissonType)type;

/** 设置权限界面 */
- (void)toSettingPage;

/** 对于未对权限请求做处理 */
- (void)requestAuthorizationWhenNotDeterminedWithHandel: (void (^)(void))compleHandel;


@end

NS_ASSUME_NONNULL_END
