//
//  HomePageController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/16.
//  Copyright © 2020 None. All rights reserved.
//

#import "HomePageController.h"

#import "MerchantHomePageController.h"

#import "HomePageHeaderView.h"
#import "MerchantsTableViewCell.h"

#import "TabBarView.h"

@interface HomePageController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) TabBarView *tabBarView;
@property (weak, nonatomic) IBOutlet UITableView *homePageTableView;
@property (strong, nonatomic) IBOutlet UIView *leftBarButtonItemView;

@end

@implementation HomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tabBarView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
    headerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.homePageTableView.tableHeaderView = headerView;
    self.homePageTableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
    
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"HomePageHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"HomePageHeaderView"];
    [self.homePageTableView registerNib:[UINib nibWithNibName:@"MerchantsTableViewCell" bundle:nil] forCellReuseIdentifier:@"MerchantsTableViewCell"];
    
    [self addLeftBarButtonItem];
    [self addRightBarButtonItems];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGRect titleViewRect = CGRectMake(0, 0, kScreenWidth - 88 - self.leftBarButtonItemView.frame.size.width - 60, 30);
    [self addNavigationTitleViewWithFrame:titleViewRect];

}
//MARK:- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MerchantsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MerchantsTableViewCell"];
    return cell;
}
//MARK:- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 102;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HomePageHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HomePageHeaderView"];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MerchantHomePageController *merchantHomePageVc = [MerchantHomePageController new];
    [self.navigationController pushViewController:merchantHomePageVc animated:YES];
}

//MARK:- Action
- (IBAction)leftBarButtonItemClick {
    NSLog(@"leftBarButtonItemClick");
}

- (void)shooppingCartBarButtonItemClick {
    NSLog(@"shooppingCartBarButtonItemClick");
}

- (void)qrcodeBarButtonItemClick {
    NSLog(@"qrcodeBarButtonItemClick");
}

- (void)titleViewClick {
    NSLog(@"titleViewClick");
}
//MARK:- Method
- (void)addRightBarButtonItems {
    UIBarButtonItem *shooppingCartBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"nav_cart" imagePositon:PositionRight target:self action:@selector(shooppingCartBarButtonItemClick)];
    UIBarButtonItem *qrcodeBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"nav_qrcode" imagePositon:PositionRight target:self action:@selector(qrcodeBarButtonItemClick)];
    self.navigationItem.rightBarButtonItems = @[shooppingCartBarButtonItem,qrcodeBarButtonItem];
}

- (void)addLeftBarButtonItem {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftBarButtonItemView];
}

- (void)addNavigationTitleViewWithFrame:(CGRect)rect {
    UIButton *titleViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    titleViewButton.frame = rect;
    [titleViewButton setTitle:@"  搜索" forState:UIControlStateNormal];
    [titleViewButton setTitleColor:HexColor(0xB3B3B3) forState:UIControlStateNormal];
    titleViewButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [titleViewButton setImage:ImageNamed(@"input_search") forState:UIControlStateNormal];
    [titleViewButton setBackgroundColor:HexColor(0xF5F5F5)];
    titleViewButton.layer.cornerRadius = 15;
    [titleViewButton addTarget:self action:@selector(titleViewClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleViewButton;
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
