//
//  AccoundLoginController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/21.
//  Copyright © 2020 None. All rights reserved.
//

#import "AccoundLoginController.h"

#import "ForgetPasswordController.h"

@interface AccoundLoginController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *confimPasswordLoginButton;

@property (assign, nonatomic) BOOL isSendVerifyCode;
@property (assign, nonatomic) NSInteger countdownSeconds;

@end

@implementation AccoundLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"Apple登录" image:@"login_apple" imagePosition:PositionLeft target:self action:@selector(rightBarButtonItemClick)];
    
    [self changePassowordLoginButtonEnable:NO];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *changedString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    return changedString.length <= 11;
}
//MARK: - UITextFieldDelegate

//MARK: - Action
- (void)rightBarButtonItemClick {
    NSLog(@"login_apple rightBarButtonItemClick");
}

- (IBAction)viewTapHandle:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)phoneNumberTextFieldEditingChanged:(UITextField *)sender {
    if (sender.text.length == 11 && self.passwordTextField.text.length > 5) {
        [self changePassowordLoginButtonEnable:YES];
    }else {
        [self changePassowordLoginButtonEnable:NO];
    }
}

- (IBAction)passwordTextFieldEditingChanged:(UITextField *)sender {
    if (sender.text.length > 5 && self.phoneNumberTextField.text.length == 11) {
        [self changePassowordLoginButtonEnable:YES];
    }else {
        [self changePassowordLoginButtonEnable:NO];
    }
}

- (IBAction)passwordLoginButtonClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)forgetPasswordButtonClick {
    ForgetPasswordController *forgetPasswordVc = [ForgetPasswordController new];
    [self.navigationController pushViewController:forgetPasswordVc animated:YES];
}

- (IBAction)verifyCodeLoginButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)weChatLoginButtonClick {
    NSLog(@"AccoundLoginController weChatLoginButtonClick");
}

//MARK: - Method
- (void)changePassowordLoginButtonEnable:(BOOL)enable {
    self.confimPasswordLoginButton.enabled = enable;
    if (enable) {
        [self.confimPasswordLoginButton setBackgroundImage:ImageNamed(@"btn_next_pre") forState:UIControlStateNormal];
    }else {
        [self.confimPasswordLoginButton setBackgroundImage:ImageNamed(@"btn_next_def") forState:UIControlStateNormal];
    }
}

@end
