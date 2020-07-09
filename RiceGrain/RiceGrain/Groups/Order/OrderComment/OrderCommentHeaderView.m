//
//  OrderCommentHeaderView.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/8.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderCommentHeaderView.h"

@interface OrderCommentHeaderView()

@property (weak, nonatomic) IBOutlet UIView *headerBackgroundView;

@end

@implementation OrderCommentHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.headerBackgroundView.layer.cornerRadius = 15;
    self.headerBackgroundView.layer.maskedCorners = kCALayerMinXMinYCorner|kCALayerMaxXMinYCorner;
}

@end
