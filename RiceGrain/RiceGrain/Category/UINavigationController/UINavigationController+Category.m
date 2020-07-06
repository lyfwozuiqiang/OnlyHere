//
//  UINavigationController+Category.m
//  IOTServer
//
//  Created by 刘伟 on 2018/10/22.
//  Copyright © 2018 GC. All rights reserved.
//

#import "UINavigationController+Category.h"

@implementation UINavigationController (Category)

- (void)changeNavigationControllerTitleColor:(UIColor *)titleColor {
    
    NSDictionary *navigationBarTitleTextAttributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:titleColor,nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, nil]];
    [self.navigationBar setTitleTextAttributes:navigationBarTitleTextAttributes];
}

- (void)changeNavigationControllerBackgroundImageWithColor:(UIColor *)imageColor {
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(kScreenWidth, kNavigationHeight), 0, [UIScreen mainScreen].scale);
    [imageColor set];
    UIRectFill(CGRectMake(0, 0, kScreenWidth, kNavigationHeight));
    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationBar setBackgroundImage:colorImage forBarMetrics:UIBarMetricsDefault];
}

- (void)changeNavigationControllerLeftBarButtonItem:(UIImage *)image {
    UIViewController *lastVc = self.viewControllers.lastObject;
    UIButton *button = lastVc.navigationItem.leftBarButtonItem.customView;
    [button setImage:image forState:UIControlStateNormal];
}

@end
