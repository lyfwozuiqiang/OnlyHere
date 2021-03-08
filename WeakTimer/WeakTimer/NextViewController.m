//
//  NextViewController.m
//  WeakTimer
//
//  Created by 刘一 on 2021/3/6.
//

#import "NextViewController.h"

#import "WeakTimer.h"

@interface NextViewController ()

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)startButtonClick {
    if (!_timer) {
        self.timer = [WeakTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(sayHello) userInfo:nil repeats:YES];
    }
}

- (void)sayHello {
    NSLog(@"hello");
}

- (void)dealloc {
    NSLog(@"dealloc");
}

@end
