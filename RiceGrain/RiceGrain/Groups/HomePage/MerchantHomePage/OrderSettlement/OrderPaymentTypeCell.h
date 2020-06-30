//
//  OrderPaymentTypeCell.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/30.
//  Copyright © 2020 None. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OrderPaymentTypeCellDelegate <NSObject>

- (void)didPaymentTypeSelectedAtIndex:(NSInteger)index;

@end
@interface OrderPaymentTypeCell : UITableViewCell

@property (weak, nonatomic) id <OrderPaymentTypeCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
