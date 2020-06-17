//
//  UIAlertController+Category.m
//  IOTServer
//
//  Created by 刘伟 on 2018/5/16.
//  Copyright © 2018年 GC. All rights reserved.
//

#import "UIAlertController+Category.h"

//alertActionStyle : UIAlertActionStyleDefault = 0,UIAlertActionStyleCancel = 1,UIAlertActionStyleDestructive = 2

@implementation UIAlertController (Category)

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message alertControllerStyle:(UIAlertControllerStyle)style actionTitles:(NSArray *)alertActionTitles alertActionClickHandle:(void (^)(UIAlertAction *))handle{
    
    if (alertActionTitles.count == 0 ) {
        NSException *exception = [NSException exceptionWithName:@"alertActionTitles个数不能为空" reason:nil userInfo:nil];
        [exception raise];
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];

    for (NSInteger i = 0; i < alertActionTitles.count; i++) {
        NSString *actionTitle = alertActionTitles[i];
        UIAlertAction *alertAction = [self addAlertActionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (handle) {
                handle(action);
            }
        }];
        [alertController addAction:alertAction];

        if (i == alertActionTitles.count - 1 && style == UIAlertControllerStyleActionSheet) {
            UIAlertAction *cancelAlertAction = [self addAlertActionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            }];
            [alertController addAction:cancelAlertAction];
        }
    }
    
    return alertController;
}

+ (UIAlertAction *)addAlertActionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void(^)(UIAlertAction * _Nonnull action))handler {

    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:title style:style handler:handler];
    if ([alertAction.title containsString:@"确认"] || [alertAction.title containsString:@"我知道了"]) {
        [alertAction setValue:HexColor(0x108EE9) forKey:@"titleTextColor"];
    }else if ([alertAction.title containsString:@"删除"]) {
        [alertAction setValue:HexColor(0xD0021B) forKey:@"titleTextColor"];
    }else {
        [alertAction setValue:HexColor(0x999999) forKey:@"titleTextColor"];
    }

    return alertAction;
}

@end
