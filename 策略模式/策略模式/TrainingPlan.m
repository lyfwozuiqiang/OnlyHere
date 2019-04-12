//
//  TrainingPlan.m
//  策略模式
//
//  Created by 刘伟 on 2019/4/11.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import "TrainingPlan.h"

@interface TrainingPlan ()

@property (strong, nonatomic) NSDictionary *planDictionary;

@end

@implementation TrainingPlan

- (void)excuteTrainingPlanAtDay:(NSString *)day duration:(NSInteger)duration {
    
    NSInvocation *invocation = self.planDictionary[day];
    if (duration != 0) {
        [invocation setArgument:&duration atIndex:2];
    }
    [invocation invoke];
}

- (NSInvocation *)invocationWithMethod:(SEL)selector {
//"v@:@"--> v-返回值类型 @-方法接收者 :-方法名 @-参数
    NSMethodSignature *methodSignature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
//获取类方法或实例方法的签名，
//    NSMethodSignature *methodSignature = [self methodSignatureForSelector:selector];
//获取实例方法的签名
//    NSMethodSignature *methodSignature = [self instanceMethodSignatureForSelector:selector];
//使用上述两个方法，不可以增加参数
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    invocation.target = self;
    invocation.selector = selector;
    
    return invocation;
}

- (void)playBasketball:(NSInteger)duration {
    
    NSLog(@"playBasketball %ld分钟",duration);
}

- (void)run:(NSInteger)duration {
    
    NSLog(@"playBasketball %ld分钟",duration);
}

- (NSDictionary *)planDictionary {
    
    if (!_planDictionary) {
        
        _planDictionary = @{@"day1":[self invocationWithMethod:@selector(playBasketball:)],
                            @"day2":[self invocationWithMethod:@selector(run:)]};
    }
    
    return _planDictionary;
}
@end
