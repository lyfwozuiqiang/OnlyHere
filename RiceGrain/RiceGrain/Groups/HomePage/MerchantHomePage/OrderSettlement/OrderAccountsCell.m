//
//  OrderAccountsCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/30.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderAccountsCell.h"

@interface OrderAccountsCell()

@property (weak, nonatomic) IBOutlet UIView *accountsBackgroundView;

@end
@implementation OrderAccountsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.accountsBackgroundView.layer.cornerRadius = 15;
    self.accountsBackgroundView.layer.maskedCorners = kCALayerMinXMaxYCorner|kCALayerMaxXMaxYCorner;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
