//
//  OrderSectionHeaderView.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/6.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderSectionHeaderView.h"

@interface OrderSectionHeaderView()

@property (weak, nonatomic) IBOutlet UIView *storeNameBackgroundView;
@property (weak, nonatomic) IBOutlet UILabel *storeNameLabbel;
@property (weak, nonatomic) IBOutlet UIImageView *indicatorImageView;

@end
@implementation OrderSectionHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.storeNameBackgroundView.layer.cornerRadius = 15;
    self.storeNameBackgroundView.layer.maskedCorners = kCALayerMinXMinYCorner|kCALayerMaxXMinYCorner;
}


- (void)setIsShowIndicator:(BOOL)isShowIndicator {
    self.indicatorImageView.hidden = !isShowIndicator;
}

- (void)setTitleString:(NSString *)titleString {
    self.storeNameLabbel.text = titleString;
}

@end
