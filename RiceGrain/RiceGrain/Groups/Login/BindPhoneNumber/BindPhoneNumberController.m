//
//  BindPhoneNumberController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/21.
//  Copyright © 2020 None. All rights reserved.
//

#import "BindPhoneNumberController.h"

@interface BindPhoneNumberController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *verifyCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendVerifyCodeButton;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;

@property (assign, nonatomic) BOOL isSendVerifyCode;
@property (assign, nonatomic) NSInteger countdownSeconds;

@end

@implementation BindPhoneNumberController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"绑定手机号";
    self.countdownSeconds = 60;
    self.isSendVerifyCode = NO;
    [self changeConfirmButtonEnable:NO];
    self.sendVerifyCodeButton.enabled = NO;
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
- (IBAction)viewTapHandle:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)phoneNumberTextFieldEditingChanged:(UITextField *)sender {
    if (self.isSendVerifyCode) {
        
    }else {
        [self changeSendVerityCodeButtonEnable:sender.text.length == 11];
    }
    
    if (sender.text.length == 11 && self.verifyCodeTextField.text.length == 6) {
        [self changeConfirmButtonEnable:YES];
    }else {
        [self changeConfirmButtonEnable:NO];
    }
}

- (IBAction)verifyCodeTextFieldEditingChanged:(UITextField *)sender {
    if (sender.text.length == 6 && self.phoneNumberTextField.text.length == 11) {
        [self changeConfirmButtonEnable:YES];
    }else {
        [self changeConfirmButtonEnable:NO];
    }
}

- (IBAction)sendVerifyCodeButtonClick {
    [self countdownTime];
    self.isSendVerifyCode = YES;
    [self changeSendVerityCodeButtonEnable:NO];
}

- (IBAction)confirmBindButtonClick {
    NSLog(@"confirmBindButtonClick");
}

//MARK: - Method
- (void)changeSendVerityCodeButtonEnable:(BOOL)enable {
    self.sendVerifyCodeButton.enabled = enable;
    if (enable) {
        [self.sendVerifyCodeButton setTitleColor:HexColor(0x333333) forState:UIControlStateNormal];
    }else {
        [self.sendVerifyCodeButton setTitleColor:HexColor(0x999999) forState:UIControlStateNormal];
    }
}

- (void)changeConfirmButtonEnable:(BOOL)enable {
    self.confirmButton.enabled = enable;
    if (enable) {
        [self.confirmButton setBackgroundImage:ImageNamed(@"btn_next_pre") forState:UIControlStateNormal];
    }else {
        [self.confirmButton setBackgroundImage:ImageNamed(@"btn_next_def") forState:UIControlStateNormal];
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
