//
//  LoginController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/20.
//  Copyright © 2020 None. All rights reserved.
//

#import "LoginController.h"

#import "RegistController.h"
#import "AccoundLoginController.h"

@interface LoginController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *verifyCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendVerifyCodeButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (assign, nonatomic) BOOL isSendVerifyCode;
@property (assign, nonatomic) NSInteger countdownSeconds;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"nav_back" imagePositon:PositionLeft target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"Apple登录" image:@"login_apple" imagePosition:PositionLeft target:self action:@selector(rightBarButtonItemClick)];
    
    self.countdownSeconds = 60;
    self.isSendVerifyCode = NO;
    [self changeLoginButtonEnable:NO];
    [self changeSendVerityCodeButtonEnable:NO];
}

//MARK: - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *changedString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (textField == self.phoneNumberTextField) {
        return changedString.length <= 11;
    }else {
        return changedString.length <= 6;
    }
}
//MARK: - Action
- (void)leftBarButtonItemClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)rightBarButtonItemClick {
    NSLog(@"rightBarButtonItemClick");
}

- (IBAction)viewTapHandle:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)viewSwipeDownHandle:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)registButtonClick {
    RegistController *registVc = [RegistController new];
    [self.navigationController pushViewController:registVc animated:YES];
}

- (IBAction)countrySelectedButtonClick:(UIButton *)sender {
    
}

- (IBAction)phoneNumberTextFieldEditingChanged:(UITextField *)sender {
    if (!self.isSendVerifyCode) {
        [self changeSendVerityCodeButtonEnable:sender.text.length == 11];
    }
    
    if (sender.text.length == 11 && self.verifyCodeTextField.text.length == 6) {
        [self changeLoginButtonEnable:YES];
    }else {
        [self changeLoginButtonEnable:NO];
    }
}

- (IBAction)verifyCodeTextFieldEditingChanged:(UITextField *)sender {
    if (sender.text.length == 6 && self.phoneNumberTextField.text.length == 11) {
        [self changeLoginButtonEnable:YES];
    }else {
        [self changeLoginButtonEnable:NO];
    }
}

- (IBAction)sendVerifyCodeButtonClick {
    [self countdownTime];
    self.isSendVerifyCode = YES;
    [self changeSendVerityCodeButtonEnable:NO];
}

- (IBAction)loginButtonClick {
    NSLog(@"loginButtonClick");
}

- (IBAction)passwordLoginButtonClick {
    AccoundLoginController *accoundLoginVc = [AccoundLoginController new];
    [self.navigationController pushViewController:accoundLoginVc animated:YES];
}

- (IBAction)weChatLoginButtonClick {
    UIViewController *vc = [NSClassFromString(@"BindPhoneNumberController") new];
    [self.navigationController pushViewController:vc animated:YES];
}

//MARK: - Method
- (void)changeSendVerityCodeButtonEnable:(BOOL)enable {
    self.sendVerifyCodeButton.enabled = enable;
    if (enable) {
        [self.sendVerifyCodeButton setBackgroundColor:HexColor(0xFBCB34)];
    }else {
        [self.sendVerifyCodeButton setBackgroundColor:HexColor(0xC8C8C8)];
    }
}

- (void)changeLoginButtonEnable:(BOOL)enable {
    self.loginButton.enabled = enable;
    if (enable) {
        [self.loginButton setBackgroundImage:ImageNamed(@"btn_next_pre") forState:UIControlStateNormal];
    }else {
        [self.loginButton setBackgroundImage:ImageNamed(@"btn_next_def") forState:UIControlStateNormal];
    }
}

- (void)countdownTime {
    self.countdownSeconds--;
    [self.sendVerifyCodeButton setTitle:[NSString stringWithFormat:@"剩余(%ld)",self.countdownSeconds] forState:UIControlStateNormal];
    if (self.countdownSeconds >= 1) {
        [self performSelector:@selector(countdownTime) withObject:self afterDelay:1];
    }else {
        if (self.phoneNumberTextField.text.length == 11) {
            [self changeSendVerityCodeButtonEnable:YES];
        }else {
            [self changeSendVerityCodeButtonEnable:NO];
        }
        self.isSendVerifyCode = NO;
        self.countdownSeconds = 60;
        [self.sendVerifyCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
}

@end
