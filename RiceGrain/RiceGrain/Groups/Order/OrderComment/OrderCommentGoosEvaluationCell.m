//
//  OrderCommentGoosEvaluationCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/8.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderCommentGoosEvaluationCell.h"

@interface OrderCommentGoosEvaluationCell()


@property (weak, nonatomic) IBOutlet UIView *goodsEvaluationBackgroundView;

@end

@implementation OrderCommentGoosEvaluationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setIsShowBottomCorner:(BOOL)isShowBottomCorner {
    if (isShowBottomCorner) {
        self.goodsEvaluationBackgroundView.layer.cornerRadius = 15;
        self.goodsEvaluationBackgroundView.layer.maskedCorners = kCALayerMinXMaxYCorner|kCALayerMaxXMaxYCorner;
    }else {
        self.goodsEvaluationBackgroundView.layer.cornerRadius = 0;
    }
}

//MARK: - Action
- (IBAction)commentButtonClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(goosEvaluationCell:didCommentButtonClickWithTag:)]) {
        [self.delegate goosEvaluationCell:self didCommentButtonClickWithTag:sender.tag];
    }
}

@end
