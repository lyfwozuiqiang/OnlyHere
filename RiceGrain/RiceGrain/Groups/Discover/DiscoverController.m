//
//  DiscoverController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/16.
//  Copyright © 2020 None. All rights reserved.
//

#import "DiscoverController.h"

#import "TabBarView.h"

@interface DiscoverController ()

@property (strong, nonatomic) TabBarView *tabBarView;

@end

@implementation DiscoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"DiscoverController";
    
    [self.view addSubview:self.tabBarView];
}

//MARK: - Lazy
- (TabBarView *)tabBarView {
    if (!_tabBarView) {
        _tabBarView = [[NSBundle mainBundle] loadNibNamed:@"TabBarView" owner:nil options:nil].firstObject;
        _tabBarView.selectedIndex = 1;
    }
    return _tabBarView;
}

@end
