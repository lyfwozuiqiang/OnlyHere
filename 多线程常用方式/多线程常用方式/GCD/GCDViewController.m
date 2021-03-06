//
//  GCDViewController.m
//  多线程常用方式
//
//  Created by 刘伟 on 2019/4/12.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@property (strong, nonatomic) NSArray *testArray;

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//线程死锁
//    [self dispatchLock];
    
//多任务并行，都结束后进行回调实现
//    [self dispatchGroup];
//    [self dispatchBarrierAsync];
//    [self dispatch_semaphore_t_test];
    
//    [self dispatchApply];
    [self synchronizedCrashTest];
}

#pragma mark - 线程死锁
- (void)dispatchLock {
    
//产生死锁的四个必要条件：
//（1）互斥条件：一个资源每次只能被一个进程使用。
//（2）请求与保持条件：一个进程因请求资源而阻塞时，对已获得的资源保持不放。
//（3）不剥夺条件:进程已获得的资源，在末使用完之前，不能强行剥夺。
//（4）循环等待条件:若干进程之间形成一种头尾相接的循环等待资源关系。
    NSLog(@"0");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"1");
    });
    NSLog(@"2");
}

#pragma mark - 多任务并行，都结束后进行回调实现(使用dispatch_group)
- (void)dispatchGroup {
//group相同 queue可以不同(可用于通知自己所需要的queue)
//dispatch_group_notify 没有顺序要求
//dispatch_group_enter dispatch_group_leave 必须成对使用,执行的group可与enter-leave group可以不同(见Log@"0")
    dispatch_group_t group1 = dispatch_group_create();
    dispatch_group_t group2 = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("dispatch_group_queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_enter(group2);
    dispatch_group_async(group1, queue, ^{
        sleep(3);
        NSLog(@"0");
        dispatch_group_leave(group2);
    });
    
    dispatch_group_async(group1, queue, ^{
        NSLog(@"1");
        sleep(1);
    });
    
    dispatch_group_async(group1, queue, ^{
        NSLog(@"2");
    });
    
    dispatch_group_notify(group1, globalQueue, ^{
        NSLog(@"任务都结束了");
    });
    
    dispatch_group_async(group1, queue, ^{
        NSLog(@"3");
        sleep(2);
    });
    
    dispatch_group_async(group2, queue, ^{
        sleep(4);
        NSLog(@"4");
    });
}

#pragma mark - 多任务并行，都结束后进行回调实现(使用dispatch_barrier_sync或者dispatch_barrier_async)
- (void)dispatchBarrierAsync {
//CONCURRENT:existing, happening, or done at the same time.
//dispatch_get_global_queue 全局队列不行，需要使用自己创建的DISPATCH_QUEUE_CONCURRENT队列
//dispatch_barrier_sync与dispatch_barrier_async 都可以满足需求，但是dispatch_barrier_sync执行完之前的任务才会执行其后的任务，dispatch_barrier_async无需等待其之前任务完成
    dispatch_queue_t queue = dispatch_queue_create("dispatch_barrier_sync", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"0");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"1");
    });
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"2");
    });
    
//    dispatch_barrier_async(queue, ^{
//       NSLog(@"任务都结束了");
//    });
    
    dispatch_barrier_sync(queue, ^{
        NSLog(@"任务都结束了");
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(1);
        NSLog(@"4");
    });
}

#pragma mark - 多线程遍历方式(index顺序取决于queue类型)
- (void)dispatchApply {
    
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);//DISPATCH_QUEUE_SERIAL
    dispatch_apply(4, queue, ^(size_t index) {
        NSLog(@"%zu",index);
    });
}

#pragma mark - dispatch_semaphore_t
- (void)dispatch_semaphore_t_test {
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"0");
        });
        sleep(3);
        NSLog(@"1");
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    NSLog(@"2");
}

#pragma mark - 单方面加锁并不能解决多线程访问问题
- (void)synchronizedCrashTest {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
//        @synchronized (self) { //不使用此时会crash
            for (int i = 0; i < 100000; i ++) {
                if (i % 2 == 0) {
                    self.testArray = @[@"1", @"2", @"3"];
                }
                else {
                    self.testArray = @[@"1"];
                }
                NSLog(@"Thread A: %@\n", self.testArray);
            }
//        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        @synchronized (self) {
            for (int i = 0; i < 10000; i ++) {
                if (self.testArray.count >= 2) {
                    NSString *str = [self.testArray objectAtIndex:1];
                    if (i%100 == 0) {
                        NSLog(@"%@",str);
                    }
                }
                NSLog(@"Thread B: %@\n", self.testArray);
            }
        }
    });
}

- (void)dealloc {
    
    NSLog(@"%@_dealloc",self.class);
}
@end
