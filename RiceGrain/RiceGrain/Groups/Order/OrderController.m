//
//  OrderController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/16.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderController.h"

#import "TabBarView.h"

@interface OrderController ()

@property (strong, nonatomic) TabBarView *tabBarView;

@end

@implementation OrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"OrderController";
    
    [self.view addSubview:self.tabBarView];
}

//MARK:- Lazy
- (TabBarView *)tabBarView {
    if (!_tabBarView) {
        _tabBarView = [[NSBundle mainBundle] loadNibNamed:@"TabBarView" owner:nil options:nil].firstObject;
        _tabBarView.selectedIndex = 2;
    }
    return _tabBarView;
}
@end
