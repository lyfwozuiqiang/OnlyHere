//
//  OrderPaymentInfomationCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/5.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderPaymentInfomationCell.h"

@interface OrderPaymentInfomationCell()

@property (weak, nonatomic) IBOutlet UIView *paymentInfoBackgroundView;

@end

@implementation OrderPaymentInfomationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.paymentInfoBackgroundView.layer.cornerRadius = 15;
    self.paymentInfoBackgroundView.layer.maskedCorners = kCALayerMinXMaxYCorner|kCALayerMaxXMaxYCorner;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
