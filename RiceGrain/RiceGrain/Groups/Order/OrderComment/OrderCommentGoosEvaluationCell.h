//
//  OrderCommentGoosEvaluationCell.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/8.
//  Copyright © 2020 None. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class OrderCommentGoosEvaluationCell;
@protocol OrderCommentGoosEvaluationCellDelegate <NSObject>
- (void)goosEvaluationCell:(OrderCommentGoosEvaluationCell *)cell didCommentButtonClickWithTag:(NSInteger)tag;
@end

@interface OrderCommentGoosEvaluationCell : UITableViewCell

@property (assign, nonatomic) BOOL isShowBottomCorner;
@property (weak, nonatomic) id <OrderCommentGoosEvaluationCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
