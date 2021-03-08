//
//  UserNotificationManager.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/14.
//  Copyright © 2020 None. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserNotificationManager : NSObject

+ (instancetype)manager;
@property (assign, nonatomic) BOOL isAllowNotification;
@property (copy, nonatomic) void(^checkNotificationPermissionHandle)(BOOL isAllowNotification);

@end

NS_ASSUME_NONNULL_END
