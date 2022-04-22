//
//  FeedbackController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/19.
//  Copyright © 2020 None. All rights reserved.
//

#import "FeedbackController.h"

@interface FeedbackController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;
@end

@implementation FeedbackController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"意见反馈";
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
- (IBAction)viewTapHandle:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)submitButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
