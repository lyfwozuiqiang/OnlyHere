//
//  OrderShopCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/30.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderShopCell.h"

@interface OrderShopCell()

@property (weak, nonatomic) IBOutlet UIView *shopBackgroundView;
@end

@implementation OrderShopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.shopBackgroundView.layer.cornerRadius = 15;
    self.shopBackgroundView.layer.maskedCorners = kCALayerMinXMinYCorner|kCALayerMaxXMinYCorner;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
