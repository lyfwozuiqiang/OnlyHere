//
//  AccountSafetyController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/23.
//  Copyright © 2020 None. All rights reserved.
//

#import "AccountSafetyController.h"

#import "IdentifierVerifyController.h"
#import "PhoneNumberChangeController.h"

@interface AccountSafetyController ()

@end

@implementation AccountSafetyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"账户安全";
}

//MARK:- Action
- (IBAction)identifierVerifyButtonClick {
    IdentifierVerifyController *identifierVerifyVc = [IdentifierVerifyController new];
    [self.navigationController pushViewController:identifierVerifyVc animated:YES];
}

- (IBAction)changePhoneNumberBindButtonClick {
    PhoneNumberChangeController *phoneNumberChangeVc = [PhoneNumberChangeController new];
    [self.navigationController pushViewController:phoneNumberChangeVc animated:YES];
}

@end
