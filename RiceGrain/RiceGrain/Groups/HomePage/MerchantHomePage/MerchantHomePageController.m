//
//  MerchantHomePageController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/26.
//  Copyright © 2020 None. All rights reserved.
//

#import "MerchantHomePageController.h"

#import "OrderSettlementController.h"
#import "MerchantIntroductionController.h"
#import "MerchantCommentController.h"

#import "ShoppingCartView.h"
#import "MerchantGoodsListCell.h"
#import "MerchantLeftImageCell.h"
#import "MerchantRightImageCell.h"
#import "MerchantPromptMessageCell.h"
#import "MerchantSectionTitleHeaderView.h"

@interface MerchantHomePageController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *merchantTableView;
@property (weak, nonatomic) IBOutlet UIView *shoppingCartBackgroundView;
@property (weak, nonatomic) IBOutlet UIButton *settleButton;
@property (strong, nonatomic) IBOutlet UIView *moreInfoView;
@property (strong, nonatomic) IBOutlet UIView *merchantTableViewHeaderView;

@property (strong, nonatomic) ShoppingCartView *cartView;

@end

@implementation MerchantHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self setShoppingCartInterface];
    [self changeSettleButtonEnable:YES title:@"去结算"];
    self.merchantTableViewHeaderView.frame = CGRectMake(0, 0, kScreenWidth, 110);
    self.merchantTableView.tableHeaderView = self.merchantTableViewHeaderView;
    [self.merchantTableView registerNib:[UINib nibWithNibName:@"MerchantLeftImageCell" bundle:nil] forCellReuseIdentifier:@"MerchantLeftImageCell"];
    [self.merchantTableView registerNib:[UINib nibWithNibName:@"MerchantRightImageCell" bundle:nil] forCellReuseIdentifier:@"MerchantRightImageCell"];
    [self.merchantTableView registerNib:[UINib nibWithNibName:@"MerchantPromptMessageCell" bundle:nil] forCellReuseIdentifier:@"MerchantPromptMessageCell"];
    [self.merchantTableView registerNib:[UINib nibWithNibName:@"MerchantGoodsListCell" bundle:nil] forCellReuseIdentifier:@"MerchantGoodsListCell"];
    [self.merchantTableView registerNib:[UINib nibWithNibName:@"MerchantSectionTitleHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"MerchantSectionTitleHeaderView"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

//MARK:- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }else if (section == 1) {
        return 1;
    } else {
        return 20;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row % 2 == 0) {
            MerchantLeftImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MerchantLeftImageCell"];
            return cell;
        }else {
            MerchantRightImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MerchantRightImageCell"];
            return cell;
        }
    }else if (indexPath.section == 1) {
        MerchantPromptMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MerchantPromptMessageCell"];
        return cell;
    }else {
        MerchantGoodsListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MerchantGoodsListCell"];
        return cell;
    }
}

//MARK:- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 150;
    }else if (indexPath.section == 1) {
        return 55;
    }else {
        return 36;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        MerchantSectionTitleHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"MerchantSectionTitleHeaderView"];
        return headerView;
    }else {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return 80;
    }else {
        return 0;
    }
}

//MARK:- Action
- (IBAction)backButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)searchButtonClick {
    NSLog(@"searchButtonClick");
}

- (IBAction)moreInfoButtonClick {
    self.moreInfoView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:self.moreInfoView];
}

- (IBAction)moreInfoViewTapHandle:(id)sender {
    [self.moreInfoView removeFromSuperview];
}

- (IBAction)cartButtonClick:(UIButton *)sender {
    self.cartView.animationFinishHandle = ^{
        sender.selected = NO;
    };
    if (sender.selected) {
        [self.cartView showRemoveAnimation];
    }else {
        [self.view insertSubview:self.cartView belowSubview:self.shoppingCartBackgroundView];
        self.cartView.cartListArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"", nil];
        [self.cartView showEnterAnimation];
        sender.selected = YES;
    }
}

- (IBAction)orderSettlementButtonClick {
    OrderSettlementController *orderSettlementVc = [OrderSettlementController new];
    [self.navigationController pushViewController:orderSettlementVc animated:YES];
}

- (IBAction)merchantIntroductionButtonClick {
    [self.moreInfoView removeFromSuperview];
    MerchantIntroductionController *merchantIntroductionVc = [MerchantIntroductionController new];
    [self.navigationController pushViewController:merchantIntroductionVc animated:YES];
}

- (IBAction)merchantCommentButtonClick {
    [self.moreInfoView removeFromSuperview];
    MerchantCommentController *merchantCommentVc = [MerchantCommentController new];
    [self.navigationController pushViewController:merchantCommentVc animated:YES];
}

- (IBAction)merchantMenuButtonClick {
    [self.moreInfoView removeFromSuperview];
}

//MARK:- Method
- (void)setShoppingCartInterface {
    self.shoppingCartBackgroundView.layer.shadowOffset = CGSizeZero;
    self.shoppingCartBackgroundView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.shoppingCartBackgroundView.layer.shadowOpacity = 0.1;
    self.shoppingCartBackgroundView.layer.shadowRadius = 10;
}

- (void)changeSettleButtonEnable:(BOOL)enable title:(NSString *)title {
    self.settleButton.enabled = enable;
    if (enable) {
        [self.settleButton setBackgroundColor:HexColor(0xFBCB34)];
    }else {
        [self.settleButton setBackgroundColor:HexColor(0xC8C8C8)];
    }
    [self.settleButton setTitle:title forState:UIControlStateNormal];
}

//MARK:- Lazy
- (ShoppingCartView *)cartView {
    if (!_cartView) {
        _cartView = [ShoppingCartView cartView];
        _cartView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - kTabBarHeight);
    }
    return _cartView;
}
@end
