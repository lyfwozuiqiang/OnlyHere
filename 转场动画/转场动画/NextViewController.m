//
//  NextViewController.m
//  转场动画
//
//  Created by 刘伟 on 2019/4/11.
//  Copyright © 2019 刘伟. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"NextViewController";
}

- (IBAction)backToForwardButtonClick {
    
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
