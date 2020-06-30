//
//  ShoppingCartGoodsCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/26.
//  Copyright © 2020 None. All rights reserved.
//

#import "ShoppingCartGoodsCell.h"

@interface ShoppingCartGoodsCell()

@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;

@end
@implementation ShoppingCartGoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
