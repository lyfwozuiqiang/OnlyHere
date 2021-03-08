//
//  ViewController.m
//  WeakTimer
//
//  Created by 刘一 on 2021/3/6.
//

#import "ViewController.h"

#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)nextButtonClick {
    NextViewController *nextVc = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
}

@end
