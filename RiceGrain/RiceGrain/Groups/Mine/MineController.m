//
//  MineController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/16.
//  Copyright © 2020 None. All rights reserved.
//

#import "MineController.h"

#import "TabBarView.h"
#import "MineTableViewCell.h"

#import "MyAddressController.h"
#import "FeedbackController.h"
#import "BaseNavigationController.h"

@interface MineController ()<UITableViewDataSource,UITableViewDelegate,MineTableViewCellDelegate>

@property (strong, nonatomic) TabBarView *tabBarView;
@property (weak, nonatomic) IBOutlet UITableView *mineTableView;
@property (strong, nonatomic) IBOutlet UIView *headerView;

@property (strong, nonatomic) NSArray *titleListArray;
@property (strong, nonatomic) NSArray *imageListArray;
@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self.view addSubview:self.tabBarView];
    [self addLeftBarButtonItems];
    [self addTabviewHeaderView];
    [self.mineTableView registerNib:[UINib nibWithNibName:@"MineTableViewCell" bundle:nil] forCellReuseIdentifier:@"MineTableViewCell"];
    self.mineTableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
}

//MARK:- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineTableViewCell"];
    cell.delegate = self;
    cell.titleArray = self.titleListArray[indexPath.row];
    cell.imageArray = self.imageListArray[indexPath.row];
    return cell;
}
//MARK:- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}

//MARK:- MineTableViewCellDelegate
- (void)mineTableViewCell:(MineTableViewCell *)cell didClickItemWithTitle:(NSString *)title {
    if ([title isEqualToString:@"我的地址"]) {
        MyAddressController *myAddressVc = [MyAddressController new];
        [self.navigationController pushViewController:myAddressVc animated:YES];
    }else if ([title isEqualToString:@"我的收藏"]) {
        
    }else if ([title isEqualToString:@"我的消息"]) {
        
    }else if ([title isEqualToString:@"邀请好友"]) {
        
    }else if ([title isEqualToString:@"商户合作"]) {
        
    }else if ([title isEqualToString:@"服务协议"]) {
        
    }else if ([title isEqualToString:@"骑手入驻"]) {
        
    }else if ([title isEqualToString:@"意见反馈"]) {
        FeedbackController *feedbackVc = [FeedbackController new];
        [self.navigationController pushViewController:feedbackVc animated:YES];
    }
}

//MARK:- Action
- (void)settingItemClick {
    NSLog(@"settingItemClick");
}

- (void)customerServiceItemClick {
    LoginController *loginVc = [LoginController new];
    BaseNavigationController *navigationController = [[BaseNavigationController alloc] initWithRootViewController:loginVc];
    navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:navigationController animated:YES completion:nil];
}

//MARK:- Method
- (void)addLeftBarButtonItems {
    UIBarButtonItem *settingItem = [UIBarButtonItem barButtonItemWithImageName:@"nav_setting" imagePositon:PositionLeft target:self action:@selector(settingItemClick)];
    UIBarButtonItem *customerServiceItem = [UIBarButtonItem barButtonItemWithImageName:@"nav_customer_service" imagePositon:PositionLeft target:self action:@selector(customerServiceItemClick)];
    self.navigationItem.leftBarButtonItems = @[settingItem,customerServiceItem];
}

- (void)addTabviewHeaderView {
    self.headerView.frame = CGRectMake(0, 0, kScreenWidth, 60);
    self.mineTableView.tableHeaderView = self.headerView;
}

//MARK:- Lazy
- (TabBarView *)tabBarView {
    if (!_tabBarView) {
        _tabBarView = [[NSBundle mainBundle] loadNibNamed:@"TabBarView" owner:nil options:nil].firstObject;
        _tabBarView.selectedIndex = 3;
    }
    return _tabBarView;
}

- (NSArray *)titleListArray {
    if (!_titleListArray) {
        _titleListArray = @[@[@"我的地址",@"我的收藏"],@[@"我的消息",@"邀请好友"],@[@"商户合作",@"服务协议"],@[@"骑手入驻",@"意见反馈"]];
    }
    return _titleListArray;
}

- (NSArray *)imageListArray {
    if (!_imageListArray) {
        _imageListArray = @[@[@"me_location",@"me_collection"],@[@"me_message",@"me_invite"],@[@"me_merchant",@"me_agreement"],@[@"me_rider",@"me_feedback"]];
    }
    return _imageListArray;
}
@end
