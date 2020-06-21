//
//  BaseNavigationController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/16.
//  Copyright © 2020 None. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation BaseNavigationController

+ (void)load {
    UINavigationBar *appearance = [UINavigationBar appearance];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(kScreenWidth, kNavigationHeight), 0, [UIScreen mainScreen].scale);
    [[UIColor whiteColor] set];
    UIRectFill(CGRectMake(0, 0, kScreenWidth, kNavigationHeight));
    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [appearance setShadowImage:[UIImage new]];
    [appearance setBackgroundImage:colorImage forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = self;
}

//MARK:- rewrite push function
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"nav_back" imagePositon:PositionLeft target:self action:@selector(leftBarButtonItemClick)];
    }
    [super pushViewController:viewController animated:animated];
}

//MARK:- UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count == 1) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }else {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

//MARK:- Action
- (void)leftBarButtonItemClick {
    [self popViewControllerAnimated:YES];
}
//MARK:- Method
- (void)backToViewController {
    [self popViewControllerAnimated:YES];
}


@end
