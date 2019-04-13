//
//  OperationViewController.m
//  多线程常用方式
//
//  Created by 刘伟 on 2019/4/12.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import "OperationViewController.h"

@interface OperationViewController ()

@end

@implementation OperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self operationQueue];
}

- (void)operationQueue {
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    operationQueue.maxConcurrentOperationCount = 3;
    
    NSBlockOperation *dependOperation = [NSBlockOperation blockOperationWithBlock:^{
        sleep(3);
        NSLog(@"dependOperation");
    }];
    [operationQueue addOperation:dependOperation];
    
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"operation1");
        }];
        
        NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"operation2");
        }];
        
        NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"operation3");
        }];
        
        [operationQueue addOperation:operation1];
        [operationQueue addOperation:operation2];
        [operationQueue addOperation:operation3];
    }];
//addExecutionBlock为异步操作
    [blockOperation addExecutionBlock:^{
        //        sleep(1);
        NSLog(@"addExecutionBlock");
    }];
    
    [dependOperation addDependency:blockOperation];
    [operationQueue addOperation:blockOperation];
}

@end
