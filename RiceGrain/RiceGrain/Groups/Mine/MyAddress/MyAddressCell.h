//
//  MyAddressCell.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/17.
//  Copyright © 2020 None. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MyAddressModel.h"

NS_ASSUME_NONNULL_BEGIN

@class MyAddressCell;
@protocol MyAddressCellDelegate <NSObject>

- (void)didSetDefaultButtonClickAtCell:(MyAddressCell *)cell;

@end

@interface MyAddressCell : UITableViewCell

@property (strong, nonatomic) MyAddressModel *addressModel;
@property (weak, nonatomic) id <MyAddressCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
