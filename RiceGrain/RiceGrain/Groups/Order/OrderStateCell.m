//
//  OrderStateCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/4.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderStateCell.h"

@interface OrderStateCell()

@property (weak, nonatomic) IBOutlet UILabel *orderStateLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end
@implementation OrderStateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.leftButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
    self.leftButton.layer.borderWidth = 0.5;
    self.rightButton.layer.borderColor = HexColor(0xFBCB34).CGColor;
    self.rightButton.layer.borderWidth = 0.5;
}

- (void)setOrderStateType:(OrderStateType)orderStateType {
    if (orderStateType == OrderStateWaitPayment) {
        self.orderStateLabel.text = @"待付款";
        self.leftButton.hidden = NO;
        [self.leftButton setTitle:@"取消订单" forState:UIControlStateNormal];
        [self.rightButton setBackgroundColor:HexColor(0xFBCB34)];
        self.rightButton.layer.borderColor = HexColor(0xFBCB34).CGColor;
        [self.rightButton setTitle:@"去支付" forState:UIControlStateNormal];
        [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else if (orderStateType == OrderStateWaitBussinessAccept) {
        self.orderStateLabel.text = @"待商家接单";
        self.leftButton.hidden = YES;
        [self.rightButton setBackgroundColor:HexColor(0xF9FAFC)];
        self.rightButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
        [self.rightButton setTitle:@"取消订单" forState:UIControlStateNormal];
        [self.rightButton setTitleColor:HexColor(0x333333) forState:UIControlStateNormal];
    }else if (orderStateType == OrderStateWaitBussinessPrepare) {
        self.orderStateLabel.text = @"商家备货中";
        self.leftButton.hidden = NO;
        [self.leftButton setTitle:@"联系客服" forState:UIControlStateNormal];
        [self.rightButton setBackgroundColor:HexColor(0xF9FAFC)];
        self.rightButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
        [self.rightButton setTitle:@"取消订单" forState:UIControlStateNormal];
        [self.rightButton setTitleColor:HexColor(0x333333) forState:UIControlStateNormal];
    }else if (orderStateType == OrderStateFinish) {
        self.orderStateLabel.text = @"订单已送达";
        self.leftButton.hidden = YES;
        [self.rightButton setBackgroundColor:HexColor(0xFBCB34)];
        self.rightButton.layer.borderColor = HexColor(0xFBCB34).CGColor;
        [self.rightButton setTitle:@"去评价" forState:UIControlStateNormal];
        [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else if (orderStateType == OrderStateCancel) {
        self.orderStateLabel.text = @"订单已取消";
        self.leftButton.hidden = NO;
        [self.leftButton setTitle:@"删除订单" forState:UIControlStateNormal];
        [self.rightButton setBackgroundColor:HexColor(0xFBCB34)];
        self.rightButton.layer.borderColor = HexColor(0xFBCB34).CGColor;
        [self.rightButton setTitle:@"再来一单" forState:UIControlStateNormal];
        [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

//MARK:- Action
- (IBAction)leftButtonClick {
    if ([self.delegate respondsToSelector:@selector(didLeftButtonClickAtCell:)]) {
        [self.delegate didLeftButtonClickAtCell:self];
    }
}

- (IBAction)rightButtonClick {
    if ([self.delegate respondsToSelector:@selector(didRightButtonClickAtCell:)]) {
        [self.delegate didRightButtonClickAtCell:self];
    }
}

@end
