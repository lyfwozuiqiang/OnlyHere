//
//  UINavigationController+Category.h
//  IOTServer
//
//  Created by 刘伟 on 2018/10/22.
//  Copyright © 2018 GC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (Category)

- (void)changeNavigationControllerTitleColor:(UIColor *)titleColor;
- (void)changeNavigationControllerBackgroundImageWithColor:(UIColor *)imageColor;
- (void)changeNavigationControllerLeftBarButtonItem:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
