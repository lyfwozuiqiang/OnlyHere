//
//  ShoppingCartAccountCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/1.
//  Copyright © 2020 None. All rights reserved.
//

#import "ShoppingCartAccountCell.h"

@interface ShoppingCartAccountCell()

@property (weak, nonatomic) IBOutlet UIView *accountBackgroundView;
@end

@implementation ShoppingCartAccountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.accountBackgroundView.layer.cornerRadius = 15;
    self.accountBackgroundView.layer.maskedCorners = kCALayerMinXMaxYCorner|kCALayerMaxXMaxYCorner;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
