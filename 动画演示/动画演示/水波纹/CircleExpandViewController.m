//
//  CircleExpandViewController.m
//  动画演示
//
//  Created by 刘伟 on 2019/4/23.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import "CircleExpandViewController.h"

#import "CircleExpandView.h"

@interface CircleExpandViewController ()

@end

@implementation CircleExpandViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGRect screenBounds = [UIScreen mainScreen].bounds;
    CGFloat width = screenBounds.size.width;
    CGFloat height = screenBounds.size.height;
    CircleExpandView *circleView = [[CircleExpandView alloc] initWithFrame:CGRectMake(0, (height - width)/2, width, width)];
    [self.view addSubview:circleView];
}

- (void)dealloc {
    
    NSLog(@"%@_dealloc",self.class);
}
@end
