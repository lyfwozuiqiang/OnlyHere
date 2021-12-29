//
//  ChainView.m
//  链式编程
//
//  Created by 刘一 on 2021/9/9.
//

#import "ChainView.h"

#define weak(type) __weak typeof(type) weak##type = type;

@implementation ChainView

- (ChainView * _Nonnull (^)(UIColor * _Nonnull))bgColor {
    weak(self)
    ChainView *(^chainView)(UIColor *) = ^(UIColor *settingColor) {
        weakself.backgroundColor = settingColor;
        return weakself;
    };
    return chainView;
}

+ (ChainView * _Nullable (^)(CGRect))init {
    ChainView *(^initView)(CGRect) = ^(CGRect viewFrame) {
        return [[self alloc] initWithFrame:viewFrame];
    };
    return initView;
}

@end
