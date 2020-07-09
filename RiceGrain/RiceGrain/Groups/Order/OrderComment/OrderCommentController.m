//
//  OrderCommentController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/4.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderCommentController.h"

#import "OrderCommentRiderCell.h"
#import "OrderCommentStoreCell.h"
#import "OrderCommentGoosEvaluationCell.h"
#import "OrderCommentHeaderView.h"

@interface OrderCommentController ()<UITableViewDataSource,UITableViewDelegate,OrderCommentGoosEvaluationCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *orderCommentTableView;

@end

@implementation OrderCommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单评价";
    [self.orderCommentTableView registerNib:[UINib nibWithNibName:@"OrderCommentRiderCell" bundle:nil] forCellReuseIdentifier:@"OrderCommentRiderCell"];
    [self.orderCommentTableView registerNib:[UINib nibWithNibName:@"OrderCommentStoreCell" bundle:nil] forCellReuseIdentifier:@"OrderCommentStoreCell"];
    [self.orderCommentTableView registerNib:[UINib nibWithNibName:@"OrderCommentGoosEvaluationCell" bundle:nil] forCellReuseIdentifier:@"OrderCommentGoosEvaluationCell"];
    [self.orderCommentTableView registerNib:[UINib nibWithNibName:@"OrderCommentHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"OrderCommentHeaderView"];
}

//MARK:- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 1;
    }else {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        OrderCommentRiderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderCommentRiderCell"];
        return cell;
    }else if (indexPath.section == 1) {
        OrderCommentStoreCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderCommentStoreCell"];
        return cell;
    }else {
        OrderCommentGoosEvaluationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderCommentGoosEvaluationCell"];
        cell.isShowBottomCorner = indexPath.row == 9;
        cell.delegate = self;
        return cell;
    }
}
//MARK:- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 216;
    }else if (indexPath.section == 1) {
        return 330;
    }else {
        return 38;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        OrderCommentHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"OrderCommentHeaderView"];
        return headerView;
    }else {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return 49;
    }else {
        return 0.01;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
}

//MARK:- OrderCommentGoosEvaluationCellDelegate
- (void)goosEvaluationCell:(OrderCommentGoosEvaluationCell *)cell didCommentButtonClickWithTag:(NSInteger)tag {
    NSIndexPath *indexPath = [self.orderCommentTableView indexPathForCell:cell];
    NSLog(@"点击了 %@ 的 %ld",indexPath,tag);
}

@end
