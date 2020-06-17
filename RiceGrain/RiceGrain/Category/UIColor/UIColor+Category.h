//
//  UIColor+Category.h
//  IOTServer
//
//  Created by 刘伟 on 2018/5/4.
//  Copyright © 2018年 GC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

+ (UIColor *)colorWithHex:(NSInteger)hexValue;
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

@end
