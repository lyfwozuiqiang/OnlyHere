//
//  OrderCommentImageCell.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/8.
//  Copyright © 2020 None. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class OrderCommentImageCell;
@protocol OrderCommentImageCellDelegate <NSObject>
- (void)didDeleteImageButtonClickAtCell:(OrderCommentImageCell *)cell;
@end

@interface OrderCommentImageCell : UICollectionViewCell

@property (assign, nonatomic) BOOL isDeleteButtonHidden;
@property (weak, nonatomic) id <OrderCommentImageCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
