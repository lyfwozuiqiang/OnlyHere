//
//  ShoppingCartListManager.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/26.
//  Copyright © 2020 None. All rights reserved.
//

#import "ShoppingCartListManager.h"

@implementation ShoppingCartListManager

+ (instancetype)manager {
    static ShoppingCartListManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ShoppingCartListManager alloc] init];
    });
    return sharedInstance;
}
@end
