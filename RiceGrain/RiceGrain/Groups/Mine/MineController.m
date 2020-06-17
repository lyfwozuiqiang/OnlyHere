//
//  MineController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/16.
//  Copyright © 2020 None. All rights reserved.
//

#import "MineController.h"

#import "TabBarView.h"

@interface MineController ()

@property (strong, nonatomic) TabBarView *tabBarView;

@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MineController";
    
    [self.view addSubview:self.tabBarView];
}

//MARK:- Lazy
- (TabBarView *)tabBarView {
    if (!_tabBarView) {
        _tabBarView = [[NSBundle mainBundle] loadNibNamed:@"TabBarView" owner:nil options:nil].firstObject;
        _tabBarView.selectedIndex = 3;
    }
    return _tabBarView;
}

@end
