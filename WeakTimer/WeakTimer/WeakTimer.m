//
//  WeakTimer.m
//  WeakTimer
//
//  Created by 刘一 on 2021/3/6.
//

#import "WeakTimer.h"

@interface WeakTarget : NSObject

@property (weak, nonatomic) id target;
@property (assign, nonatomic) SEL selector;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation WeakTarget

- (void)fire:(NSTimer *)timer {
    if (self.target) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.selector withObject:timer.userInfo];
#pragma clang diagnostic pop
    }else {
        [self.timer invalidate];
    }
}
@end


@interface WeakTimer()

@end
@implementation WeakTimer

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)repeats {
    WeakTarget *weakTarget = [[WeakTarget alloc] init];
    weakTarget.target = aTarget;
    weakTarget.selector = aSelector;
    weakTarget.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:weakTarget selector:@selector(fire:) userInfo:userInfo repeats:repeats];
    return weakTarget.timer;
}

@end
