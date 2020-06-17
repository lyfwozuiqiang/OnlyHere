//
//  UIAlertController+Category.h
//  IOTServer
//
//  Created by 刘伟 on 2018/5/16.
//  Copyright © 2018年 GC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Category)

//alertActionStyle : UIAlertActionStyleDefault = 0,UIAlertActionStyleCancel = 1,UIAlertActionStyleDestructive = 2

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message alertControllerStyle:(UIAlertControllerStyle)style actionTitles:(NSArray *)alertActionTitles alertActionClickHandle:(void(^)(UIAlertAction *action))handle;

@end
