//
//  MyMessagesController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/22.
//  Copyright © 2020 None. All rights reserved.
//

#import "MyMessagesController.h"

#import "MyMessagesCell.h"

@interface MyMessagesController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myMessagesTableView;
@property (strong, nonatomic) NSArray *messagesArray;

@end

@implementation MyMessagesController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"消息提醒";
    [self.myMessagesTableView registerNib:[UINib nibWithNibName:@"MyMessagesCell" bundle:nil] forCellReuseIdentifier:@"MyMessagesCell"];
}

//MARK: - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messagesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyMessagesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyMessagesCell"];
    cell.messageString = self.messagesArray[indexPath.row];
    return cell;
}
//MARK: - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

//MARK: - Lazy
- (NSArray *)messagesArray {
    if (!_messagesArray) {
        _messagesArray = [NSArray arrayWithObjects:@"您于2020-09-09 19：00：00在茶颜悦色使用付款码扣款成功，金额为99元",@"您于2020-09-09 19：00：00在茶颜悦色使用付款码扣款成功，金额为99元",@"您于2020-09-09 19：00：00在茶颜悦色使用付款码扣款成功，金额为99元",@"您于2020-09-09 19：00：00在茶颜悦色使用付款码扣款成功，金额为99元",@"您于2020-09-09 19：00：00在茶颜悦色使用付款码扣款成功，金额为99元",@"您于2020-09-09 19：00：00在茶颜悦色使用付款码扣款成功，金额为99元",@"您于2020-09-09 19：00：00在茶颜悦色使用付款码扣款成功，金额为99元",@"您于2020-09-09 19：00：00在茶颜悦色使用付款码扣款成功，金额为99元",@"您于2020-09-09 19：00：00在茶颜悦色使用付款码扣款成功，金额为99元", nil];
    }
    return _messagesArray;
}
@end
