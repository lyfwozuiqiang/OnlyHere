//
//  OrderItemCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/5.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderItemCell.h"

@interface OrderItemCell()

@property (weak, nonatomic) IBOutlet UIView *orderItemBackgroundView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation OrderItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setShowBottomCorner:(BOOL)showBottomCorner {
    if (showBottomCorner) {
        self.orderItemBackgroundView.layer.cornerRadius = 15;
        self.orderItemBackgroundView.layer.maskedCorners = kCALayerMinXMaxYCorner|kCALayerMaxXMaxYCorner;
    }else {
        self.orderItemBackgroundView.layer.cornerRadius = 0;
    }
}

- (void)setShowAllCorner:(BOOL)showAllCorner {
    self.orderItemBackgroundView.layer.cornerRadius = 15;
}

- (void)setTitleString:(NSString *)titleString {
    self.titleLabel.text = titleString;
}

@end
