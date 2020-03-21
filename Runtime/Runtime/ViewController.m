//
//  ViewController.m
//  Runtime
//
//  Created by 刘伟 on 2020/3/13.
//  Copyright © 2020 None. All rights reserved.
//

#import "ViewController.h"

#import "Video.h"
#import <objc/runtime.h>

#import "NSObject+Category.h"
#import "NSObject+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self getIvarsList];
//    [self getPropertysList];
//    [self getMethodsList];
    
    Video *video = [[Video alloc] init];
    [video sayHello];//测试NSObject添加Extension
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [video performSelector:NSSelectorFromString(@"replay")];//消息转发
    #pragma clang diagnostic pop
}

///获取成员变量+实例变量
- (void)getIvarsList {
    unsigned int ivarsCount = 0;
    Ivar *ivars = class_copyIvarList([Video class], &ivarsCount);
    for (NSInteger i = 0; i < ivarsCount; i++) {
        Ivar ivar = ivars[i];
        NSString *ivarString = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSLog(@"ivarString = %@",ivarString);
    }
}

///获取成员变量
- (void)getPropertysList {
    unsigned int propertysCount = 0;
    objc_property_t *propertys = class_copyPropertyList([Video class], &propertysCount);
    for (NSInteger i = 0; i < propertysCount; i++) {
        objc_property_t property = propertys[i];
        NSString *propertyString = [NSString stringWithUTF8String:property_getName(property)];
        NSLog(@"propertyString = %@",propertyString);
    }
}

///获取方法列表及类型
- (void)getMethodsList {
    unsigned int methodsCount = 0;
    Method *methods = class_copyMethodList([Video class], &methodsCount);
    for (NSInteger i = 0; i < methodsCount; i++) {
        Method method = methods[i];
        NSString *methodTypeString = [NSString stringWithUTF8String:method_getTypeEncoding(method)];
        NSLog(@"methodTypeString = %@",methodTypeString);
        NSString *methodString = NSStringFromSelector(method_getName(method));
        NSLog(@"methodString = %@",methodString);
    }
}

@end
