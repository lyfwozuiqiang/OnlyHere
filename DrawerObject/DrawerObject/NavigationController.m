//
//  NavigationController.m
//  DrawerObject
//
//  Created by 刘伟 on 2019/12/5.
//

#import "NavigationController.h"

@interface NavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation NavigationController

+ (void)load {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake([UIScreen mainScreen].bounds.size.width, 44), 0, [UIScreen mainScreen].scale);
    [[UIColor whiteColor] set];
    UIRectFill(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44));
    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UINavigationBar *appearance = [UINavigationBar appearance];
    [appearance setShadowImage:[UIImage new]];
    [appearance setBackgroundImage:colorImage forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *navigationBarTitleTextAttributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:HEXCOLOR(0x1c1c1c), [UIFont systemFontOfSize:18.0f],nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
    [appearance setTitleTextAttributes:navigationBarTitleTextAttributes];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([navigationController.viewControllers.firstObject isKindOfClass:NSClassFromString(@"TestViewController")] && navigationController.viewControllers.count <= 1) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }else {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

//重写push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - Method
- (void)backToViewController {
    [self popViewControllerAnimated:YES];
}


@end
