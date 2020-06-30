//
//  SetNewPasswordController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/21.
//  Copyright © 2020 None. All rights reserved.
//

#import "SetNewPasswordController.h"

@interface SetNewPasswordController ()

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *confirmChangeButton;

@end

@implementation SetNewPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置新密码";
    [self changePassowordLoginButtonEnable:NO];
}

//MARK:- Action
- (IBAction)viewTapHandle:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)passwordTextFieldEditingChanged {
    if (self.passwordTextField.text.length > 5 && self.confirmPasswordTextField.text.length > 5 && [self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text]) {
        [self changePassowordLoginButtonEnable:YES];
    }else {
        [self changePassowordLoginButtonEnable:NO];
    }
}

- (IBAction)confirmChangePasswordButtonClick {
    for (NSInteger i = 0; i < self.navigationController.viewControllers.count; i++) {
        UIViewController *viewController = self.navigationController.viewControllers[i];
        if ([viewController isKindOfClass:NSClassFromString(@"AccoundLoginController")]) {
            [self.navigationController popToViewController:viewController animated:YES];
            break;
        }
    }
}


//MARK:- Method
- (void)changePassowordLoginButtonEnable:(BOOL)enable {
    self.confirmChangeButton.enabled = enable;
    if (enable) {
        [self.confirmChangeButton  setBackgroundImage:ImageNamed(@"btn_confirm_pre") forState:UIControlStateNormal];
    }else {
        [self.confirmChangeButton setBackgroundImage:ImageNamed(@"btn_confirm_def") forState:UIControlStateNormal];
    }
}

@end
