//
//  IdentifierVerifyController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/23.
//  Copyright © 2020 None. All rights reserved.
//

#import "IdentifierVerifyController.h"

@interface IdentifierVerifyController ()

@end

@implementation IdentifierVerifyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"身份验证";
}

//MARK:- Action
- (IBAction)viewTapHandle:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)submitVerifyButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
