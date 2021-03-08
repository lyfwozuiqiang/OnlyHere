//
//  SettingsController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/22.
//  Copyright © 2020 None. All rights reserved.
//

#import "SettingsController.h"

#import "AccountSafetyController.h"

#import "UserNotificationManager.h"

#import <AFImageDownloader.h>

@interface SettingsController ()

@property (weak, nonatomic) IBOutlet UILabel *cacheUsageLabel;
@property (weak, nonatomic) IBOutlet UISwitch *messageRemindSwitch;

@end

@implementation SettingsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    self.messageRemindSwitch.on = [UserNotificationManager manager].isAllowNotification;
    self.messageRemindSwitch.userInteractionEnabled = ![UserNotificationManager manager].isAllowNotification;
    [UserNotificationManager manager].checkNotificationPermissionHandle = ^(BOOL isAllowNotification) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.messageRemindSwitch.userInteractionEnabled = !isAllowNotification;
            [self.messageRemindSwitch setOn:isAllowNotification animated:YES];
        });
    };
    
    [self getImageDiskCache];
}

//MARK:- Action
- (IBAction)accountSafetyButtonClick {
    AccountSafetyController *accountSafetyVc = [AccountSafetyController new];
    [self.navigationController pushViewController:accountSafetyVc animated:YES];
}

- (IBAction)clearCacheButtonClick {
    NSLog(@"clearCacheButtonClick");
    NSURLCache *imageCache = [AFImageDownloader defaultURLCache];
    [imageCache removeAllCachedResponses];
    self.cacheUsageLabel.text = @"0.0M";
}

- (IBAction)languageChangeButtonClick {
    NSLog(@"languageChangeButtonClick");
}

- (IBAction)messageRemindSwitchClick:(UISwitch *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
}

- (IBAction)logoutButtonClick {
    NSLog(@"logoutButtonClick");
}

//MARK:- Method
- (void)getImageDiskCache {
    NSURLCache *imageCache = [AFImageDownloader defaultURLCache];
    CGFloat diskUsage = (imageCache.currentDiskUsage - 86016)/1024.0/1024.0;
    self.cacheUsageLabel.text = [NSString stringWithFormat:@"%.01fM",diskUsage];
}

@end
