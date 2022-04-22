//
//  ShoppingCartController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/1.
//  Copyright © 2020 None. All rights reserved.
//

#import "ShoppingCartController.h"

#import "ShopNameCell.h"
#import "ShoppingCartListGoodsCell.h"
#import "ShoppingCartAccountCell.h"

@interface ShoppingCartController ()<UITableViewDataSource,UITableViewDelegate,ShopNameCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *shoppingCartTableView;
@property (weak, nonatomic) IBOutlet UIView *emptyView;

@end

@implementation ShoppingCartController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"购物车";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"清空" target:self action:@selector(rightBarButtonItemClick)];
    [self.shoppingCartTableView registerNib:[UINib nibWithNibName:@"ShopNameCell" bundle:nil] forCellReuseIdentifier:@"ShopNameCell"];
    [self.shoppingCartTableView registerNib:[UINib nibWithNibName:@"ShoppingCartListGoodsCell" bundle:nil] forCellReuseIdentifier:@"ShoppingCartListGoodsCell"];
    [self.shoppingCartTableView registerNib:[UINib nibWithNibName:@"ShoppingCartAccountCell" bundle:nil] forCellReuseIdentifier:@"ShoppingCartAccountCell"];
    NSInteger number = arc4random_uniform(10);
    if (number <= 5) {
        self.emptyView.hidden = NO;
    }
}

//MARK: - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ShopNameCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopNameCell"];
        cell.delegate = self;
        return cell;
    }else if (indexPath.row > 0 && indexPath.row < 4) {
        ShoppingCartListGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingCartListGoodsCell"];
        return cell;
    }else {
        ShoppingCartAccountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingCartAccountCell"];
        return cell;
    }
    return [UITableViewCell new];
}

//MARK: - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"ShoppingCartController didSelectRowAtIndexPath %@",indexPath);
}

//MARK: - ShopNameCellDelegate
- (void)didDeleteShopCartButtonClickAtCell:(ShopNameCell *)cell {
    NSIndexPath *indexPath = [self.shoppingCartTableView indexPathForCell:cell];
    NSLog(@"didDeleteShopCartButtonClickAtCell %@",indexPath);
}
//MARK: - Action
- (void)rightBarButtonItemClick {
    NSLog(@"ShoppingCartController rightBarButtonItemClick");
}

- (IBAction)goShoppingButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
