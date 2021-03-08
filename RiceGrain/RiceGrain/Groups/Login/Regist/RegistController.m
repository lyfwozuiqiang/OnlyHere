//
//  RegistController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/20.
//  Copyright © 2020 None. All rights reserved.
//

#import "RegistController.h"

@interface RegistController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *verifyCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendVerifyCodeButton;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registButton;

@property (assign, nonatomic) BOOL isSendVerifyCode;
@property (assign, nonatomic) NSInteger countdownSeconds;

@end

@implementation RegistController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.countdownSeconds = 60;
    self.isSendVerifyCode = NO;
    [self changeRegistButtonEnable:false];
    [self changeSendVerityCodeButtonEnable:NO];
}

//MARK:- UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *changedString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (textField == self.phoneNumberTextField) {
        return changedString.length <= 11;
    }else if (textField == self.verifyCodeTextField) {
        return changedString.length <= 6;
    }else {
        return YES;
    }
}
//MARK:- Action
- (IBAction)loginButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)viewTapHandle:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)phoneNumberTextFieldEditingChanged:(UITextField *)sender {
    if (!self.isSendVerifyCode) {
        [self changeSendVerityCodeButtonEnable:sender.text.length == 11];
    }
    
    if (sender.text.length == 11 && self.verifyCodeTextField.text.length == 6) {
        [self changeRegistButtonEnable:YES];
    }else {
        [self changeRegistButtonEnable:NO];
    }
}

- (IBAction)verifyCodeTextFieldEditingChanged:(UITextField *)sender {
    if (sender.text.length == 6 && self.phoneNumberTextField.text.length == 11) {
        [self changeRegistButtonEnable:YES];
    }else {
        [self changeRegistButtonEnable:NO];
    }
}
- (IBAction)sendVerifyCodeButtonClick {
    [self countdownTime];
    self.isSendVerifyCode = YES;
    [self changeSendVerityCodeButtonEnable:NO];
}

- (IBAction)registButtonClick {
    NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
    [paramsDict setValue:self.phoneNumberTextField.text forKey:@"ip"];
    [paramsDict setValue:@"1" forKey:@"name"];
    [paramsDict setValue:@"1" forKey:@"passport"];
    [paramsDict setValue:@"111111" forKey:@"password"];
    [paramsDict setValue:@"" forKey:@"scene"];
    [paramsDict setValue:@"1" forKey:@"userUuid"];
    [HttpRequestManager  requestWithHost:UrlHost path:@"/api/passport/registe" params:paramsDict succeesHandle:^(NSDictionary * _Nonnull responseDict) {
        [self.navigationController popViewControllerAnimated:YES];
    } errorHandle:^(NSError * _Nonnull error) {
        
    }];
}

- (IBAction)userAgreementButtonClick {
    NSLog(@"userAgreementButtonClick");
}

- (IBAction)privacyPolicyButtonClick {
    NSLog(@"privacyPolicyButtonClick");
}

//MARK:- Method
- (void)changeSendVerityCodeButtonEnable:(BOOL)enable {
    self.sendVerifyCodeButton.enabled = enable;
    if (enable) {
        [self.sendVerifyCodeButton setBackgroundColor:HexColor(0xFBCB34)];
    }else {
        [self.sendVerifyCodeButton setBackgroundColor:HexColor(0xC8C8C8)];
    }
}

- (void)changeRegistButtonEnable:(BOOL)enable {
    self.registButton.enabled = enable;
    if (enable) {
        [self.registButton setBackgroundImage:ImageNamed(@"btn_next_pre") forState:UIControlStateNormal];
    }else {
        [self.registButton setBackgroundImage:ImageNamed(@"btn_next_def") forState:UIControlStateNormal];
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
