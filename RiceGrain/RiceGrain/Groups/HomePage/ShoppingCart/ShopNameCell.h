//
//  ShopNameCell.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/1.
//  Copyright © 2020 None. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ShopNameCell;
@protocol ShopNameCellDelegate <NSObject>
- (void)didDeleteShopCartButtonClickAtCell:(ShopNameCell *)cell;
@end

@interface ShopNameCell : UITableViewCell

@property (weak, nonatomic) id <ShopNameCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
