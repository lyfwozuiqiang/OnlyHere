//
//  UINavigationController+Category.m
//  IOTServer
//
//  Created by 刘伟 on 2018/10/22.
//  Copyright © 2018 GC. All rights reserved.
//

#import "UINavigationController+Category.h"

@implementation UINavigationController (Category)

- (void)changeNavigationControllerTitleWithColor:(UIColor *)titleColor {
    
    NSDictionary *navigationBarTitleTextAttributes = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:titleColor,nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, nil]];
    [self.navigationBar setTitleTextAttributes:navigationBarTitleTextAttributes];
}

- (void)changeNavigationControllerBackgroundImageWithColor:(UIColor *)imageColor {
    
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(SCREEN_WIDTH, NAVIGATION_HEIGHT), 0, [UIScreen mainScreen].scale);
//    [imageColor set];
//    UIRectFill(CGRectMake(0, 0, SCREEN_WIDTH, NAVIGATION_HEIGHT));
//    UIImage *colorImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    [self.navigationBar setTranslucent:NO];
//    [self.navigationBar setBackgroundImage:colorImage forBarMetrics:UIBarMetricsDefault];
}

@end
