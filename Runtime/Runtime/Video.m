//
//  Video.m
//  Runtime
//
//  Created by 刘伟 on 2020/3/13.
//  Copyright © 2020 None. All rights reserved.
//

#import "Video.h"

#import <objc/runtime.h>

@interface Video()

@property (assign, nonatomic) NSInteger totalTime;

@end

@implementation Video {
    NSString *_country;
}

- (void)play {
    NSLog(@"video play");
}

- (void)changePlayPoint {
    NSLog(@"video changePlayPoint");
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    NSLog(@"resolveClassMethod");
    return [super resolveClassMethod:sel];
}

//invocation有四个参数，target selector argument argument.
//然后分别对应这四个符号 @:q@
//v void
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"resolveInstanceMethod");
    if (sel == NSSelectorFromString(@"replay")) {
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
//        NSMethodSignature
    }
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector");
    return [super forwardingTargetForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation");
    [super forwardInvocation:anInvocation];
}

void dynamicMethodIMP(id self, SEL _cmd){
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
