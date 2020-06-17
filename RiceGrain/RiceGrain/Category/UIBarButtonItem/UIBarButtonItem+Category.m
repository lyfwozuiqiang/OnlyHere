//
//  UIBarButtonItem+Category.m
//  KeylessProject
//
//  Created by 刘伟 on 2020/5/23.
//  Copyright © 2020 None. All rights reserved.
//

#import "UIBarButtonItem+Category.h"

@implementation UIBarButtonItem (Category)

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action {
    UIButton *itemButton = [self creatButtonWithTitle:title image:nil imagePositoin:PositionMiddum target:target action:action];
    return [[UIBarButtonItem alloc] initWithCustomView:itemButton];
}

+ (UIBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName imagePositon:(ButtonImagePosition)position target:(id)target action:(SEL)action {
    UIButton *itemButton = [self creatButtonWithTitle:nil image:imageName imagePositoin:position target:target action:action];
    return [[UIBarButtonItem alloc] initWithCustomView:itemButton];
}

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title image:(NSString *)imageName imagePosition:(ButtonImagePosition)position target:(id)target action:(SEL)action {
    UIButton *itemButton = [self creatButtonWithTitle:title image:imageName imagePositoin:position target:target action:action];
    return [[UIBarButtonItem alloc] initWithCustomView:itemButton];
}

+ (UIButton *)creatButtonWithTitle:(NSString *)title image:(NSString *)imageName imagePositoin:(ButtonImagePosition)position target:(id)target action:(SEL)action {
    
    CGSize titleSize = [title boundingRectWithSize:CGSizeMake(70, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, titleSize.width + 30, 30);
    [button setBackgroundColor:[UIColor clearColor]];
    [button.heightAnchor constraintEqualToConstant:30].active = YES;
    
    if (position == PositionLeft) {
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    }else if (position == PositionRight) {
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    }
    if (title.length && imageName.length) {
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:title forState:UIControlStateNormal];
        [button.widthAnchor constraintEqualToConstant:titleSize.width + 30].active = YES;
        [button setImage:ImageNamed(imageName) forState:UIControlStateNormal];
        [button setTitleColor:HexColor(0x66665a) forState:UIControlStateNormal];
    }else if (title.length) {
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:HexColor(0x66665a) forState:UIControlStateNormal];
        [button.widthAnchor constraintEqualToConstant:titleSize.width + 30].active = YES;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    }else {
        [button.widthAnchor constraintEqualToConstant:40].active = YES;
        [button setImage:ImageNamed(imageName) forState:UIControlStateNormal];
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end
