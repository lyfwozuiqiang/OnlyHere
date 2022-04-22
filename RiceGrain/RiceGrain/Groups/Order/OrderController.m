//
//  OrderController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/16.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderController.h"

#import "OrderDetailController.h"

#import "TabBarView.h"
#import "OrderStateCell.h"
#import "OrderStateDeliverCell.h"

#import "OrderTypeDefine.h"

@interface OrderController ()<UITableViewDataSource,UITableViewDelegate,OrderStateCellDeleate,OrderStateDeliverCellDeleate>

@property (weak, nonatomic) IBOutlet UITableView *orderListTableView;
@property (strong, nonatomic) TabBarView *tabBarView;

@end

@implementation OrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的订单";
    
    [self.view addSubview:self.tabBarView];
    self.orderListTableView.contentInset = UIEdgeInsetsMake(10, 0, kStatusBarHeight + 90, 0);
    [self.orderListTableView registerNib:[UINib nibWithNibName:@"OrderStateCell" bundle:nil] forCellReuseIdentifier:@"OrderStateCell"];
    [self.orderListTableView registerNib:[UINib nibWithNibName:@"OrderStateDeliverCell" bundle:nil] forCellReuseIdentifier:@"OrderStateDeliverCell"];
}

//MARK: - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderStateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderStateCell"];
    cell.delegate = self;
    if (indexPath.row == 0) {
        cell.orderStateType = OrderStateWaitPayment;
    }else if (indexPath.row == 1) {
        cell.orderStateType = OrderStateWaitBussinessAccept;
    }else if (indexPath.row == 2) {
        cell.orderStateType = OrderStateWaitBussinessPrepare;
    }else if (indexPath.row == 3) {
        cell.orderStateType = OrderStateFinish;
    }else if (indexPath.row == 4) {
        cell.orderStateType = OrderStateCancel;
    }else if (indexPath.row == 5) {
        OrderStateDeliverCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderStateDeliverCell"];
        cell.delegate = self;
        return cell;
    } else {
        cell.orderStateType = OrderStateWaitPayment;
    }
    return cell;
}
//MARK: - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderDetailController *orderDetailVc = [OrderDetailController new];
    orderDetailVc.orderStateType = OrderStateFinishiDeliver;
    [self.navigationController pushViewController:orderDetailVc animated:YES];
}

//MARK: - OrderStateCellDeleate
- (void)didLeftButtonClickAtCell:(OrderStateCell *)cell {
    NSIndexPath *indexPath = [self.orderListTableView indexPathForCell:cell];
    NSLog(@"didLeftButtonClickAtCell %@",indexPath);
}

- (void)didRightButtonClickAtCell:(OrderStateCell *)cell {
    NSIndexPath *indexPath = [self.orderListTableView indexPathForCell:cell];
    NSLog(@"didRightButtonClickAtCell %@",indexPath);
}

//MARK: - OrderStateDeliverCellDeleate
- (void)didContactCustomerServiceButtonClickAtCell:(OrderStateDeliverCell *)cell {
    NSIndexPath *indexPath = [self.orderListTableView indexPathForCell:cell];
    NSLog(@"didContactCustomerServiceButtonClickAtCell %@",indexPath);
}

- (void)didCancelOrderButtonClickAtCell:(OrderStateDeliverCell *)cell {
    NSIndexPath *indexPath = [self.orderListTableView indexPathForCell:cell];
    NSLog(@"didCancelOrderButtonClickAtCell %@",indexPath);
}
//MARK: - Lazy
- (TabBarView *)tabBarView {
    if (!_tabBarView) {
        _tabBarView = [[NSBundle mainBundle] loadNibNamed:@"TabBarView" owner:nil options:nil].firstObject;
        _tabBarView.selectedIndex = 2;
    }
    return _tabBarView;
}
@end
