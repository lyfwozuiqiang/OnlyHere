//
//  MerchantCommentController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/30.
//  Copyright © 2020 None. All rights reserved.
//

#import "MerchantCommentController.h"

#import "MerchantCommentCell.h"

@interface MerchantCommentController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *merchantCommentTableView;

@end

@implementation MerchantCommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"评论";
    [self.merchantCommentTableView registerNib:[UINib nibWithNibName:@"MerchantCommentCell" bundle:nil] forCellReuseIdentifier:@"MerchantCommentCell"];
}

//MARK: - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MerchantCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MerchantCommentCell"];
    return cell;
}

//MARK: - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end
