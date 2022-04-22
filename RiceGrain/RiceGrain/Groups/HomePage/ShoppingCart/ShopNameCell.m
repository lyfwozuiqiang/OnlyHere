//
//  ShopNameCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/1.
//  Copyright © 2020 None. All rights reserved.
//

#import "ShopNameCell.h"

@interface ShopNameCell()

@property (weak, nonatomic) IBOutlet UIView *shopNameBackgroundView;
@end
@implementation ShopNameCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.shopNameBackgroundView.layer.cornerRadius = 15;
    self.shopNameBackgroundView.layer.maskedCorners = kCALayerMinXMinYCorner|kCALayerMaxXMinYCorner;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//MARK: - Action
- (IBAction)deleteButtonClick {
    if ([self.delegate respondsToSelector:@selector(didDeleteShopCartButtonClickAtCell:)]) {
        [self.delegate didDeleteShopCartButtonClickAtCell:self];
    }
}

@end
