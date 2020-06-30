//
//  MyCollectionController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/22.
//  Copyright © 2020 None. All rights reserved.
//

#import "MyCollectionController.h"

#import "MyCollectionCell.h"

@interface MyCollectionController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myCollectionTableView;

@end

@implementation MyCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"我的收藏";
    [self.myCollectionTableView registerNib:[UINib nibWithNibName:@"MyCollectionCell" bundle:nil] forCellReuseIdentifier:@"MyCollectionCell"];
}

//MARK:- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCollectionCell"];
    return cell;
}

//MARK:- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 102;
}

- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIContextualAction *action = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:nil handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        NSLog(@"取消收藏%@",indexPath);
    }];
    action.title = @"取消\n收藏";
    action.backgroundColor = HexColor(0xFF4A4A);
    UISwipeActionsConfiguration *actionConfiguration = [UISwipeActionsConfiguration configurationWithActions:@[action]];
    return actionConfiguration;
}

@end
