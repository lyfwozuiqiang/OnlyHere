//
//  OrderStateCell.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/4.
//  Copyright © 2020 None. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OrderTypeDefine.h"

NS_ASSUME_NONNULL_BEGIN
@class OrderStateCell;
@protocol OrderStateCellDeleate <NSObject>
- (void)didLeftButtonClickAtCell:(OrderStateCell *)cell;
- (void)didRightButtonClickAtCell:(OrderStateCell *)cell;
@end
@interface OrderStateCell : UITableViewCell

@property (assign, nonatomic) OrderStateType orderStateType;
@property (weak, nonatomic) id <OrderStateCellDeleate> delegate;

@end

NS_ASSUME_NONNULL_END
