//
//  AppDelegate.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/11.
//  Copyright © 2020 None. All rights reserved.
//

#import "AppDelegate.h"

#import "BaseTabBarController.h"
#import <UserNotifications/UserNotifications.h>

#import "UserNotificationManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if ([DeviceVersion floatValue] < 13.0) {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        BaseTabBarController *baseTabBarController = [[BaseTabBarController alloc] init];
        self.window.rootViewController = baseTabBarController;
        [self.window makeKeyAndVisible];
    }
    
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:UNAuthorizationOptionSound|UNAuthorizationOptionAlert completionHandler:^(BOOL granted, NSError * _Nullable error) {
        [UserNotificationManager manager].isAllowNotification = granted;
    }];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
