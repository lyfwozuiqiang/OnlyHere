//
//  OrderStateDeliverCell.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/4.
//  Copyright © 2020 None. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OrderTypeDefine.h"

NS_ASSUME_NONNULL_BEGIN
@class OrderStateDeliverCell;
@protocol OrderStateDeliverCellDeleate <NSObject>
- (void)didContactCustomerServiceButtonClickAtCell:(OrderStateDeliverCell *)cell;
- (void)didCancelOrderButtonClickAtCell:(OrderStateDeliverCell *)cell;
@end

@interface OrderStateDeliverCell : UITableViewCell

@property (assign, nonatomic) OrderStateType orderStateType;
@property (weak, nonatomic) id <OrderStateDeliverCellDeleate> delegate;

@end

NS_ASSUME_NONNULL_END
