//
//  HomePageController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/16.
//  Copyright © 2020 None. All rights reserved.
//

#import "HomePageController.h"

#import "WebViewController.h"

#import "TabBarView.h"

@interface HomePageController ()

@property (strong, nonatomic) TabBarView *tabBarView;

@end

@implementation HomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"HomePageController";

    [self.view addSubview:self.tabBarView];
}

//MARK:- Lazy
- (TabBarView *)tabBarView {
    if (!_tabBarView) {
        _tabBarView = [[NSBundle mainBundle] loadNibNamed:@"TabBarView" owner:nil options:nil].firstObject;
        _tabBarView.selectedIndex = 0;
    }
    return _tabBarView;
}

@end
