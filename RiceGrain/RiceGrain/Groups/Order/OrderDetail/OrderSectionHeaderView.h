//
//  OrderSectionHeaderView.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/6.
//  Copyright © 2020 None. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OrderSectionHeaderView : UITableViewHeaderFooterView

@property (copy, nonatomic) NSString *titleString;
@property (assign, nonatomic) BOOL isShowIndicator;

@end

NS_ASSUME_NONNULL_END
