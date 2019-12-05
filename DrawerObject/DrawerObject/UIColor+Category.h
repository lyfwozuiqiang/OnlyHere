//
//  UIColor+Category.h
//  DrawerObject
//
//  Created by 刘伟 on 2019/12/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Category)

+ (UIColor *)colorWithHex:(NSInteger)hexValue;
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

@end

NS_ASSUME_NONNULL_END
