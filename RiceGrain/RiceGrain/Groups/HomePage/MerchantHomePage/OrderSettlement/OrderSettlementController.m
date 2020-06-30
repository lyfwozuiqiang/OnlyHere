//
//  OrderSettlementController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/30.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderSettlementController.h"

#import "OrderAddressCell.h"
#import "OrderShopCell.h"
#import "OrderGoodsCell.h"
#import "OrderAccountsCell.h"
#import "OrderRemarksCell.h"
#import "OrderPaymentTypeCell.h"

@interface OrderSettlementController ()<UITableViewDataSource,UITableViewDelegate,OrderRemarksCellDelegate,OrderPaymentTypeCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *orderSettlementTableView;

@property (copy, nonatomic) NSString *remarkString;
@property (assign, nonatomic) NSInteger paymentType;

@end

@implementation OrderSettlementController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单结算";
    [self.orderSettlementTableView registerNib:[UINib nibWithNibName:@"OrderAddressCell" bundle:nil] forCellReuseIdentifier:@"OrderAddressCell"];
    [self.orderSettlementTableView registerNib:[UINib nibWithNibName:@"OrderShopCell" bundle:nil] forCellReuseIdentifier:@"OrderShopCell"];
    [self.orderSettlementTableView registerNib:[UINib nibWithNibName:@"OrderGoodsCell" bundle:nil] forCellReuseIdentifier:@"OrderGoodsCell"];
    [self.orderSettlementTableView registerNib:[UINib nibWithNibName:@"OrderAccountsCell" bundle:nil] forCellReuseIdentifier:@"OrderAccountsCell"];
    [self.orderSettlementTableView registerNib:[UINib nibWithNibName:@"OrderRemarksCell" bundle:nil] forCellReuseIdentifier:@"OrderRemarksCell"];
    [self.orderSettlementTableView registerNib:[UINib nibWithNibName:@"OrderPaymentTypeCell" bundle:nil] forCellReuseIdentifier:@"OrderPaymentTypeCell"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

//MARK:- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return 4;
    }else if (section == 2) {
        return 1;
    }else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        OrderAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderAddressCell"];
        return cell;
    }else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            OrderShopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderShopCell"];
            return cell;
        }else if (indexPath.row > 0 && indexPath.row < 3){
            OrderGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderGoodsCell"];
            return cell;
        }else {
            OrderAccountsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderAccountsCell"];
            return cell;
        }
    }else if (indexPath.section == 2) {
        OrderRemarksCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderRemarksCell"];
        cell.delegate = self;
        return cell;
    }else {
        OrderPaymentTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderPaymentTypeCell"];
        cell.delegate = self;
        return cell;
    }
}

//MARK:- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return UITableViewAutomaticDimension;
    }else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 45;
        }else if (indexPath.row > 0 && indexPath.row < 3) {
            return 60;
        }else {
            return UITableViewAutomaticDimension;
        }
    }else if (indexPath.section == 2) {
        return 70;
    }else {
        return UITableViewAutomaticDimension;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView endEditing:YES];
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            NSLog(@"%@",indexPath);
        }
    }
}

//MARK:- OrderRemarksCellDelegate
- (void)didRemarksChanged:(NSString *)remark {
    NSLog(@"didRemarksChanged = %@",remark);
}
//MARK:- OrderPaymentTypeCellDelegate
- (void)didPaymentTypeSelectedAtIndex:(NSInteger)index {
    NSLog(@"didPaymentTypeSelectedAtIndex %ld",index);
    self.paymentType = index;
}

//MARK:- Action
- (IBAction)tableViewTapHandle:(id)sender {
    [self.orderSettlementTableView endEditing:YES];
}

@end
