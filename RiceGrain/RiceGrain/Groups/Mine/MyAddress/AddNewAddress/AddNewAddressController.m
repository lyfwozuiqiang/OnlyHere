//
//  AddNewAddressController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/19.
//  Copyright © 2020 None. All rights reserved.
//

#import "AddNewAddressController.h"

@interface AddNewAddressController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;

@end

@implementation AddNewAddressController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"新增收货地址";
}

//MARK: - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    if (textView.text.length > 0) {
        self.placeholderLabel.hidden = YES;
    }else {
        self.placeholderLabel.hidden = NO;
    }
}
//MARK: - Action
- (IBAction)saveAnfUseButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)viewTapHandle:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)selectedAreaButtonClick:(UIButton *)sender {
    NSLog(@"selectedAreaButtonClick");
}

@end
