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

#import "SettingsController.h"
#import "FeedbackController.h"
#import "MyAddressController.h"
#import "MyMessagesController.h"
#import "MyCollectionController.h"
#import "InviteFriendController.h"
#import "RidersSettledController.h"
#import "MerchantsSettledController.h"

#import "BaseNavigationController.h"

@interface MineController ()<UITableViewDataSource,UITableViewDelegate,MineTableViewCellDelegate>

@property (strong, nonatomic) TabBarView *tabBarView;
@property (weak, nonatomic) IBOutlet UITableView *mineTableView;
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIButton *headPortraitButton;
@property (strong, nonatomic) IBOutlet UIView *serviceView;

@property (strong, nonatomic) NSArray *titleListArray;
@property (strong, nonatomic) NSArray *imageListArray;
@property (strong, nonatomic) NSArray *messagesArray;

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

//MARK: - UITableViewDataSource
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
//MARK: - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}

//MARK: - MineTableViewCellDelegate
- (void)mineTableViewCell:(MineTableViewCell *)cell didClickItemWithTitle:(NSString *)title {
    if ([title isEqualToString:@"我的地址"]) {
        MyAddressController *myAddressVc = [MyAddressController new];
        [self.navigationController pushViewController:myAddressVc animated:YES];
    }else if ([title isEqualToString:@"我的收藏"]) {
        MyCollectionController *myCollectionVc = [MyCollectionController new];
        [self.navigationController pushViewController:myCollectionVc animated:YES];
    }else if ([title isEqualToString:@"我的消息"]) {
        MyMessagesController *myMessagesVc = [MyMessagesController new];
        [self.navigationController pushViewController:myMessagesVc animated:YES];
    }else if ([title isEqualToString:@"邀请好友"]) {
        InviteFriendController *nnviteFriendVc = [InviteFriendController new];
        [self.navigationController pushViewController:nnviteFriendVc animated:YES];
    }else if ([title isEqualToString:@"商户合作"]) {
        MerchantsSettledController *merchantsSettledVc = [MerchantsSettledController new];
        [self.navigationController pushViewController:merchantsSettledVc animated:YES];
    }else if ([title isEqualToString:@"服务协议"]) {
        
    }else if ([title isEqualToString:@"骑手入驻"]) {
        RidersSettledController *ridersSettledVc = [RidersSettledController new];
        [self.navigationController pushViewController:ridersSettledVc animated:YES];
    }else if ([title isEqualToString:@"意见反馈"]) {
        FeedbackController *feedbackVc = [FeedbackController new];
        [self.navigationController pushViewController:feedbackVc animated:YES];
    }
}

//MARK: - Action
- (void)settingItemClick {
    SettingsController *settingsVc = [SettingsController new];
    [self.navigationController pushViewController:settingsVc animated:YES];
}

- (void)customerServiceItemClick {
//    UIViewController *loginVc = [NSClassFromString(@"LoginController") new];
//    BaseNavigationController *navigationController = [[BaseNavigationController alloc] initWithRootViewController:loginVc];
//    navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self presentViewController:navigationController animated:YES completion:nil];
    self.serviceView.frame = [UIScreen mainScreen].bounds;
    [KeyWindow addSubview:self.serviceView];
}

- (IBAction)changeHeadPortraitButtonClick:(UIButton *)sender {
    
}

- (IBAction)serviceViewClickHandle:(id)sender {
    [self.serviceView removeFromSuperview];
}

- (IBAction)pasteButtonClick {
    [[UIPasteboard generalPasteboard] setString:@"hello world"];
    [self.serviceView removeFromSuperview];
}

//MARK: - Method
- (void)addLeftBarButtonItems {
    UIBarButtonItem *settingItem = [UIBarButtonItem barButtonItemWithImageName:@"nav_setting" imagePositon:PositionLeft target:self action:@selector(settingItemClick)];
    UIBarButtonItem *customerServiceItem = [UIBarButtonItem barButtonItemWithImageName:@"nav_customer_service" imagePositon:PositionLeft target:self action:@selector(customerServiceItemClick)];
    self.navigationItem.leftBarButtonItems = @[settingItem,customerServiceItem];
}

- (void)addTabviewHeaderView {
    self.headerView.frame = CGRectMake(0, 0, kScreenWidth, 60);
    self.mineTableView.tableHeaderView = self.headerView;
}

//MARK: - Lazy
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

- (NSArray *)messagesArray {
    if (!_messagesArray) {
        _messagesArray = [NSArray arrayWithObjects:@[@(0),@(0)],@[@(999),@(0)],@[@(0),@(0)],@[@(0),@(0)], nil];
    }
    return _messagesArray;
}
@end
