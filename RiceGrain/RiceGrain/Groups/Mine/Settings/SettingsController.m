//
//  SettingsController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/22.
//  Copyright © 2020 None. All rights reserved.
//

#import "SettingsController.h"

#import "AccountSafetyController.h"

@interface SettingsController ()

@end

@implementation SettingsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
}

//MARK:- Action
- (IBAction)accountSafetyButtonClick {
    AccountSafetyController *accountSafetyVc = [AccountSafetyController new];
    [self.navigationController pushViewController:accountSafetyVc animated:YES];
}

- (IBAction)clearCacheButtonClick {
    NSLog(@"clearCacheButtonClick");

}
- (IBAction)languageChangeButtonClick {
    NSLog(@"languageChangeButtonClick");
}

- (IBAction)logoutButtonClick {
    NSLog(@"logoutButtonClick");
}
@end
