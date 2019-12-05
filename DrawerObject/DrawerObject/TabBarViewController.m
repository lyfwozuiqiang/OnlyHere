//
//  TabBarViewController.m
//  DrawerObject
//
//  Created by 刘伟 on 2019/12/4.
//

#import "TabBarViewController.h"

#import "TestViewController.h"

@interface TabBarViewController ()

@property (strong, nonatomic) NSArray *titleArray;

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UITabBar appearance].translucent = NO;

    TestViewController *homePageVc = [TestViewController new];
    NavigationController *homeNavi = [[NavigationController alloc] initWithRootViewController:homePageVc];
    
    TestViewController *locationVc = [TestViewController new];
    NavigationController *locationNavi = [[NavigationController alloc] initWithRootViewController:locationVc];

    TestViewController *mineVc = [TestViewController new];
    NavigationController *mineNavi = [[NavigationController alloc] initWithRootViewController:mineVc];

    self.viewControllers = @[homeNavi,locationNavi,mineNavi];
    
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger idx, BOOL *stop) {
        [item setTitle:self.titleArray[idx]];
    }];

    [self setupTabBarItemAppearance];
}

//设置UITabBarItem的主题
- (void)setupTabBarItemAppearance {

    UITabBarItem *appearance = [UITabBarItem appearance];
    
    NSArray *normalTitleKeyArray = [NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil];
    NSArray *normalTitleValueArray = [NSArray arrayWithObjects:HEXCOLOR(0xB2B2B2),[UIFont systemFontOfSize:11.0f],nil];
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjects:normalTitleValueArray forKeys:normalTitleKeyArray] forState:UIControlStateNormal];
    
    NSArray *selectedTitleKeyArray = [NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil];
    NSArray *selectedTitleValueArray = [NSArray arrayWithObjects:HEXCOLOR(0xFFB437), [UIFont systemFontOfSize:11.0f], nil];
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjects:selectedTitleValueArray forKeys: selectedTitleKeyArray] forState:UIControlStateSelected];
}

#pragma mark - lazy
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = [NSArray arrayWithObjects:@"首页",@"位置",@"我的", nil];
    }
    return _titleArray;
}
@end
