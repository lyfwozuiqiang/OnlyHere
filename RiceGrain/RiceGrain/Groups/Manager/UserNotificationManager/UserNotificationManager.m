//
//  UserNotificationManager.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/14.
//  Copyright © 2020 None. All rights reserved.
//

#import "UserNotificationManager.h"

#import <UserNotifications/UserNotifications.h>

@implementation UserNotificationManager

+ (instancetype)manager {
    static UserNotificationManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[UserNotificationManager alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:manager selector:@selector(checkUserNotificationPermission) name:UIApplicationDidBecomeActiveNotification object:nil];
    });
    return manager;
}


- (void)checkUserNotificationPermission {
    [[UNUserNotificationCenter currentNotificationCenter] getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        if (settings.authorizationStatus == UNAuthorizationStatusDenied) {
            self.isAllowNotification = NO;
            if (self.checkNotificationPermissionHandle) {
                self.checkNotificationPermissionHandle(NO);
            }
        }else {
            self.isAllowNotification = YES;
            if (self.checkNotificationPermissionHandle) {
                self.checkNotificationPermissionHandle(YES);
            }
        }
    }];
}
@end
