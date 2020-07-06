//
//  OrderStateDeliverCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/4.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderStateDeliverCell.h"

@interface OrderStateDeliverCell()

@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end

@implementation OrderStateDeliverCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.leftButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
    self.leftButton.layer.borderWidth = 0.5;
    self.rightButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
    self.rightButton.layer.borderWidth = 0.5;
}

- (IBAction)didContactCustomerServiceButtonClick {
    if ([self.delegate respondsToSelector:@selector(didContactCustomerServiceButtonClickAtCell:)]) {
        [self.delegate didContactCustomerServiceButtonClickAtCell:self];
    }
}

- (IBAction)didCancelOrderButtonClick {
    if ([self.delegate respondsToSelector:@selector(didCancelOrderButtonClickAtCell:)]) {
        [self.delegate didCancelOrderButtonClickAtCell:self];
    }
}

@end
