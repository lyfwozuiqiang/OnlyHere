//
//  UIBarButtonItem+Category.h
//  KeylessProject
//
//  Created by 刘伟 on 2020/5/23.
//  Copyright © 2020 None. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ButtonImagePosition){
    PositionLeft,
    PositionMiddum,
    PositionRight
};

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Category)

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName imagePositon:(ButtonImagePosition)position target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title image:(NSString *)imageName imagePosition:(ButtonImagePosition)position target:(id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
