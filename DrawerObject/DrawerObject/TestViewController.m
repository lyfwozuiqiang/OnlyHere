//
//  TestViewController.m
//  DrawerObject
//
//  Created by 刘伟 on 2019/12/4.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:(CGFloat)arc4random_uniform(255)/255.0 green:(CGFloat)arc4random_uniform(255)/255.0 blue:(CGFloat)arc4random_uniform(255)/255.0 alpha:1];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (IBAction)buttonClick {
    TestViewController *testViewcontroller = [TestViewController new];
    [self.navigationController pushViewController:testViewcontroller animated:YES];
}


@end
