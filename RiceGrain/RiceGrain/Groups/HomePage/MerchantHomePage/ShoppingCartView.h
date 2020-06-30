//
//  ShoppingCartView.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/26.
//  Copyright © 2020 None. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShoppingCartView : UIView

+ (ShoppingCartView *)cartView;
@property (strong, nonatomic) NSMutableArray *cartListArray;
@property (copy, nonatomic) void(^animationFinishHandle)(void);
- (void)showEnterAnimation;
- (void)showRemoveAnimation;

@end

NS_ASSUME_NONNULL_END
