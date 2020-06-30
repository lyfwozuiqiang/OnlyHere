//
//  OrderRemarksCell.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/30.
//  Copyright © 2020 None. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OrderRemarksCellDelegate <NSObject>

- (void)didRemarksChanged:(NSString *)remark;

@end
@interface OrderRemarksCell : UITableViewCell

@property (weak, nonatomic) id <OrderRemarksCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
