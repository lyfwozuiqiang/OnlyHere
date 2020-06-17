//
//  BaseTabBarController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/16.
//  Copyright © 2020 None. All rights reserved.
//

#import "BaseTabBarController.h"

#import "HomePageController.h"
#import "DiscoverController.h"
#import "OrderController.h"
#import "MineController.h"
#import "BaseNavigationController.h"

#import "TabBarView.h"

@interface BaseTabBarController ()

@property (strong, nonatomic) TabBarView *tabBarView;
@property (strong, nonatomic) NSArray *titleArray;
@property (strong, nonatomic) NSArray *imageArray;

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomePageController *homePageController = [[HomePageController alloc] init];
    BaseNavigationController *homePageNavi = [[BaseNavigationController alloc] initWithRootViewController:homePageController];
    
    DiscoverController *discoverController = [[DiscoverController alloc] init];
    BaseNavigationController *discoverNavi = [[BaseNavigationController alloc] initWithRootViewController:discoverController];
    
    OrderController *orderController = [[OrderController alloc] init];
    BaseNavigationController *orderNavi = [[BaseNavigationController alloc] initWithRootViewController:orderController];
    
    MineController *mineController = [[MineController alloc] init];
    BaseNavigationController *mineNavi = [[BaseNavigationController alloc] initWithRootViewController:mineController];

    self.viewControllers = @[homePageNavi,discoverNavi,orderNavi,mineNavi];

    self.tabBar.hidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabbarClickHandle:) name:kTabBarItemClick object:nil];
}

- (void)tabbarClickHandle:(NSNotification *)noti {
    self.selectedIndex = [noti.object integerValue];
}

//MARK:- Lazy
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = [NSArray arrayWithObjects:@"首页",@"发现",@"订单",@"我的", nil];
    }
    return _titleArray;
}

- (NSArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [NSArray arrayWithObjects:@"tab_home",@"tab_find",@"tab_order",@"tab_order", nil];
    }
    return _imageArray;
}

- (TabBarView *)tabBarView {
    if (!_tabBarView) {
        _tabBarView = [[NSBundle mainBundle] loadNibNamed:@"TabBarView" owner:nil options:nil].firstObject;
    }
    return _tabBarView;
}


@end
