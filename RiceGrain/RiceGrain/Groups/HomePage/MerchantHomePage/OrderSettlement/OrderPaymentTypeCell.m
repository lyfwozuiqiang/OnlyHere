//
//  OrderPaymentTypeCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/30.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderPaymentTypeCell.h"

@interface OrderPaymentTypeCell()

@property (weak, nonatomic) IBOutlet UIImageView *firstIndicatorImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondIndicatorImageView;
@property (weak, nonatomic) IBOutlet UIImageView *thirdIndicatorImageView;

@end
@implementation OrderPaymentTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//MARK:- Action
- (IBAction)paymentTypeButtonClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(didPaymentTypeSelectedAtIndex:)]) {
        [self.delegate didPaymentTypeSelectedAtIndex:sender.tag];
    }
    
    if (sender.tag == 0) {
        self.firstIndicatorImageView.image = ImageNamed(@"list_checked_pre");
        self.secondIndicatorImageView.image = ImageNamed(@"list_checked_def");
        self.thirdIndicatorImageView.image = ImageNamed(@"list_checked_def");
    }else if (sender.tag == 1) {
        self.firstIndicatorImageView.image = ImageNamed(@"list_checked_def");
        self.secondIndicatorImageView.image = ImageNamed(@"list_checked_pre");
        self.thirdIndicatorImageView.image = ImageNamed(@"list_checked_def");
    }else {
        self.firstIndicatorImageView.image = ImageNamed(@"list_checked_def");
        self.secondIndicatorImageView.image = ImageNamed(@"list_checked_def");
        self.thirdIndicatorImageView.image = ImageNamed(@"list_checked_pre");
    }
}

@end
