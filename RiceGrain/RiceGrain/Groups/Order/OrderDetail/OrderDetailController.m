//
//  OrderDetailController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/4.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderDetailController.h"

#import "OrderCommentController.h"

#import "OrderStoreNameCell.h"
#import "OrderPurchaseGoodsCell.h"
#import "OrderPaymentInfomationCell.h"
#import "OrderItemCell.h"
#import "OrderSectionHeaderView.h"

#import "UINavigationController+Category.h"

@interface OrderDetailController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *orderDetailTableView;
@property (weak, nonatomic) IBOutlet UILabel *orderStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@property (strong, nonatomic) NSMutableArray *sectionTitleArray;
@property (strong, nonatomic) NSMutableArray *rowTitleArray;

@end

@implementation OrderDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单详情";
    self.orderDetailTableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    [self.orderDetailTableView registerNib:[UINib nibWithNibName:@"OrderStoreNameCell" bundle:nil] forCellReuseIdentifier:@"OrderStoreNameCell"];
    [self.orderDetailTableView registerNib:[UINib nibWithNibName:@"OrderPurchaseGoodsCell" bundle:nil] forCellReuseIdentifier:@"OrderPurchaseGoodsCell"];
    [self.orderDetailTableView registerNib:[UINib nibWithNibName:@"OrderPaymentInfomationCell" bundle:nil] forCellReuseIdentifier:@"OrderPaymentInfomationCell"];
    [self.orderDetailTableView registerNib:[UINib nibWithNibName:@"OrderItemCell" bundle:nil] forCellReuseIdentifier:@"OrderItemCell"];
    [self.orderDetailTableView registerNib:[UINib nibWithNibName:@"OrderSectionHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"OrderSectionHeaderView"];
    
    [self configButtonInterface];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController changeNavigationControllerTitleColor:[UIColor whiteColor]];
    [self.navigationController changeNavigationControllerBackgroundImageWithColor:HexColor(0xFBCB34)];
    [self.navigationController changeNavigationControllerLeftBarButtonItem:ImageNamed(@"nav_back_white")];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController changeNavigationControllerTitleColor:[UIColor blackColor]];
    [self.navigationController changeNavigationControllerBackgroundImageWithColor:[UIColor whiteColor]];
    [self.navigationController changeNavigationControllerLeftBarButtonItem:ImageNamed(@"nav_back")];
}

//MARK:- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else if (section == 1) {
        return 3;
    }else if (section == 2) {
        return 1;
    }else {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            OrderPurchaseGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderPurchaseGoodsCell"];
            return cell;
        }else {
            OrderPaymentInfomationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderPaymentInfomationCell"];
            return cell;
        }
    }else {
         OrderItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderItemCell"];
         if (indexPath.section == 1) {
             cell.showBottomCorner = indexPath.row == 2;
         }else if (indexPath.section == 2) {
             cell.showAllCorner = YES;
         }else {
             cell.showBottomCorner = (indexPath.row == 2);
         }
         cell.titleString = self.rowTitleArray[indexPath.section][indexPath.row];
         return cell;
    }
    return nil;
}

//MARK:- UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section != 2) {
        OrderSectionHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"OrderSectionHeaderView"];
        headerView.titleString = self.sectionTitleArray[section];
        headerView.isShowIndicator = section == 0;
        return headerView;
    }else {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section != 2) {
        return 40;
    }else {
        return 0.01;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"OrderDetailController %@",indexPath);
}

//MARK:- Action
- (IBAction)leftButtonClick {
    if (self.orderStateType == OrderStateWaitPayment) {
        NSLog(@"leftButtonClick OrderStateWaitPayment");
    }else if (self.orderStateType == OrderStateWaitBussinessPrepare) {
        NSLog(@"leftButtonClick OrderStateWaitBussinessPrepare");
    }else if (self.orderStateType == OrderStateRiderGoToBussiness) {
        NSLog(@"leftButtonClick OrderStateRiderGoToBussiness");
    }else if (self.orderStateType == OrderStateRiderDeliver) {
        NSLog(@"leftButtonClick OrderStateRiderDeliver");
    }else if (self.orderStateType == OrderStateFinishiDeliver) {
        NSLog(@"leftButtonClick OrderStateFinishiDeliver");
    }else if (self.orderStateType == OrderStateFinish) {
        NSLog(@"leftButtonClick OrderStateFinish");
    }else if (self.orderStateType == OrderStateCancel) {
        NSLog(@"leftButtonClick OrderStateCancel");
    }
}

- (IBAction)rightButtonClick {
    if (self.orderStateType == OrderStateWaitPayment) {
        NSLog(@"rightButtonClick OrderStateWaitPayment");
    }else if (self.orderStateType == OrderStateWaitBussinessAccept) {
        NSLog(@"rightButtonClick OrderStateWaitPayment");
    }else if (self.orderStateType == OrderStateWaitBussinessPrepare) {
        NSLog(@"rightButtonClick OrderStateWaitBussinessPrepare");
    }else if (self.orderStateType == OrderStateRiderGoToBussiness) {
        NSLog(@"rightButtonClick OrderStateRiderGoToBussiness");
    }else if (self.orderStateType == OrderStateRiderDeliver) {
        NSLog(@"rightButtonClick OrderStateRiderDeliver");
    }else if (self.orderStateType == OrderStateFinishiDeliver) {
        OrderCommentController *orderCommentVc = [OrderCommentController new];
        [self.navigationController pushViewController:orderCommentVc animated:YES];
    }else if (self.orderStateType == OrderStateFinish) {
        NSLog(@"rightButtonClick OrderStateFinish");
    }else if (self.orderStateType == OrderStateCancel) {
        NSLog(@"rightButtonClick OrderStateFinish");
    }
}

//MARK:- Method
- (void)configButtonInterface {
    if (self.orderStateType == OrderStateWaitPayment) {
        self.orderStateLabel.text = @"待付款";
        self.distanceLabel.text = @"";
        [self.leftButton setTitle:@"取消订单" forState:UIControlStateNormal];
        self.leftButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
        self.leftButton.layer.borderWidth = 0.5;
        [self.rightButton setBackgroundColor:HexColor(0xFBCB34)];
        [self.rightButton setTitle:@"去支付" forState:UIControlStateNormal];
        [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else if (self.orderStateType == OrderStateWaitBussinessAccept) {
        self.orderStateLabel.text = @"商家待接单";
        self.distanceLabel.text = @"";
        self.leftButton.hidden = YES;
        [self.rightButton setTitle:@"取消订单" forState:UIControlStateNormal];
        self.rightButton.layer.borderWidth = 0.5;
        self.rightButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
    }else if (self.orderStateType == OrderStateWaitBussinessPrepare || self.orderStateType == OrderStateRiderGoToBussiness || self.orderStateType == OrderStateRiderDeliver) {
        if (self.orderStateType == OrderStateWaitBussinessPrepare) {
            self.orderStateLabel.text = @"商家备货中";
        }else if (self.orderStateType == OrderStateRiderGoToBussiness) {
            self.orderStateLabel.text = @"骑手正在赶往商家";
            self.distanceLabel.text = @"9.8km";
        }else {
            self.orderStateLabel.text = @"骑手正在送货";
            self.distanceLabel.text = @"9.8km";
        }
        [self.leftButton setTitle:@"联系客服" forState:UIControlStateNormal];
        self.leftButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
        self.leftButton.layer.borderWidth = 0.5;
        [self.rightButton setTitle:@"取消订单" forState:UIControlStateNormal];
        self.rightButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
        self.rightButton.layer.borderWidth = 0.5;
    }else if (self.orderStateType == OrderStateFinishiDeliver) {
        self.leftButton.hidden = YES;
        self.orderStateLabel.text = @"订单已送达";
        self.distanceLabel.text = @"";
        [self.rightButton setBackgroundColor:HexColor(0xFBCB34)];
        [self.rightButton setTitle:@"去评价" forState:UIControlStateNormal];
        [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else if (self.orderStateType == OrderStateCancel) {
        self.orderStateLabel.text = @"订单已取消";
        self.distanceLabel.text = @"";
        [self.leftButton setTitle:@"删除订单" forState:UIControlStateNormal];
        self.leftButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
        self.leftButton.layer.borderWidth = 0.5;
        [self.rightButton setBackgroundColor:HexColor(0xFBCB34)];
        [self.rightButton setTitle:@"再来一单" forState:UIControlStateNormal];
        [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else if (self.orderStateType == OrderStateFinish) {
        self.orderStateLabel.text = @"订单已完成";
        self.distanceLabel.text = @"";
        [self.leftButton setTitle:@"删除订单" forState:UIControlStateNormal];
        self.leftButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
        self.leftButton.layer.borderWidth = 0.5;
        [self.rightButton setBackgroundColor:HexColor(0xFBCB34)];
        [self.rightButton setTitle:@"再来一单" forState:UIControlStateNormal];
        [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

//MARK:- Lazy
- (NSMutableArray *)sectionTitleArray {
    if (!_sectionTitleArray) {
        _sectionTitleArray = [NSMutableArray arrayWithObjects:@"茶颜悦色",@"配送信息",@"",@"订单信息", nil];
    }
    return _sectionTitleArray;
}

- (NSMutableArray *)rowTitleArray {
    if (!_rowTitleArray) {
        _rowTitleArray = [NSMutableArray arrayWithObjects:@[],@[@"送达时间",@"收货地址",@"备注"],@[@"配送方式"],@[@"订单号",@"支付方式",@"下单时间"], nil];
    }
    return _rowTitleArray;
}
@end
