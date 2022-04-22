//
//  PhoneNumberChangeController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/23.
//  Copyright © 2020 None. All rights reserved.
//

#import "PhoneNumberChangeController.h"

@interface PhoneNumberChangeController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *verifyCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendVerifyCodeButton;
@property (weak, nonatomic) IBOutlet UIButton *confirmChangeBindButton;

@property (assign, nonatomic) BOOL isSendVerifyCode;
@property (assign, nonatomic) NSInteger countdownSeconds;

@end

@implementation PhoneNumberChangeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"手机号换绑";
    self.isSendVerifyCode = NO;
    self.countdownSeconds = 60;
    [self changeSendVerityCodeButtonEnable:NO];
    [self confirmChangeBindButtonEnable:NO];
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
- (IBAction)phoneNumberTextFieldEditingChanged:(UITextField *)sender {
    if (!self.isSendVerifyCode) {
        [self changeSendVerityCodeButtonEnable:sender.text.length == 11];
    }
    
    if (sender.text.length == 11 && self.verifyCodeTextField.text.length == 6) {
        [self confirmChangeBindButtonEnable:YES];
    }else {
        [self confirmChangeBindButtonEnable:NO];
    }
}

- (IBAction)verifyCodeTextFieldEditingChanged:(UITextField *)sender {
    if (sender.text.length > 5 && self.phoneNumberTextField.text.length == 11) {
        [self confirmChangeBindButtonEnable:YES];
    }else {
        [self confirmChangeBindButtonEnable:NO];
    }
}

- (IBAction)viewTapHandle:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)sendVerifyCodeButtonClick {
    self.isSendVerifyCode = YES;
    [self countdownTime];
}
- (IBAction)confirmChangeBindButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
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

- (void)confirmChangeBindButtonEnable:(BOOL)enable {
    self.confirmChangeBindButton.enabled = enable;
    if (enable) {
        [self.confirmChangeBindButton setBackgroundColor:HexColor(0xFBCB34)];
    }else {
        [self.confirmChangeBindButton setBackgroundColor:HexColor(0xC8C8C8)];

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
