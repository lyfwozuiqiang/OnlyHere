//
//  OrderCommentController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/4.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderCommentController.h"

@interface OrderCommentController ()

@property (weak, nonatomic) IBOutlet UITableView *orderCommentTableView;

@end

@implementation OrderCommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单评价";
}

@end
