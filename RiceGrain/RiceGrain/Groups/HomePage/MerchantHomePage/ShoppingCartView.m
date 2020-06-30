//
//  ShoppingCartView.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/26.
//  Copyright © 2020 None. All rights reserved.
//

#import "ShoppingCartView.h"

#import "ShoppingCartGoodsCell.h"

@interface ShoppingCartView()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *shoppingCartBackgroundView;
@property (weak, nonatomic) IBOutlet UITableView *goodsListTableView;
@property (weak, nonatomic) IBOutlet UIView *alphaView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backgroundViewHeightConstraint;

@end

@implementation ShoppingCartView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.goodsListTableView registerNib:[UINib nibWithNibName:@"ShoppingCartGoodsCell" bundle:nil] forCellReuseIdentifier:@"ShoppingCartGoodsCell"];
    self.shoppingCartBackgroundView.layer.cornerRadius = 15;
    self.shoppingCartBackgroundView.layer.maskedCorners = kCALayerMinXMinYCorner|kCALayerMaxXMinYCorner;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    return self;
}

+ (ShoppingCartView *)cartView {
    return [[NSBundle mainBundle] loadNibNamed:@"ShoppingCartView" owner:nil options:nil].firstObject;
}

- (void)setCartListArray:(NSMutableArray *)cartListArray {
    _cartListArray = cartListArray;
    if (cartListArray.count < 4) {
        self.backgroundViewHeightConstraint.constant = 75 * cartListArray.count + 56;
    }else {
        self.backgroundViewHeightConstraint.constant = 75 * 4 + 56;
    }
}

//MARK:- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cartListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShoppingCartGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingCartGoodsCell"];
    return cell;
}
//MARK:- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

//MARK:- Action
- (IBAction)viewTabHandle:(id)sender {
    [self showRemoveAnimation];
}

//MARK:- Method
- (void)showEnterAnimation {
    self.alphaView.alpha = 0;
    self.shoppingCartBackgroundView.frame = CGRectMake(0, kScreenHeight - kTabBarHeight - 56, kScreenWidth, 0);
    [UIView animateWithDuration:0.4 animations:^{
        self.shoppingCartBackgroundView.frame = CGRectMake(0, kScreenHeight - kTabBarHeight - 56 - self.backgroundViewHeightConstraint.constant, kScreenWidth, self.backgroundViewHeightConstraint.constant);
        self.alphaView.alpha = 0.4;
    }];
}

- (void)showRemoveAnimation {
    [UIView animateWithDuration:0.4 animations:^{
        self.shoppingCartBackgroundView.frame = CGRectMake(0, kScreenHeight - kTabBarHeight, kScreenWidth, self.backgroundViewHeightConstraint.constant);
        self.alphaView.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
            if (self.animationFinishHandle) {
                self.animationFinishHandle();
            }
        }
    }];
}

@end
