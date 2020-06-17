//
//  UIColor+Category.m
//  IOTServer
//
//  Created by 刘伟 on 2018/5/4.
//  Copyright © 2018年 GC. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)

+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue {
    return [UIColor colorWithRed:((float) ((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float) ((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float) (hexValue & 0xFF)) / 255.0 alpha:alphaValue];
}

+ (UIColor *)colorWithHex:(NSInteger)hexValue {
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

@end
