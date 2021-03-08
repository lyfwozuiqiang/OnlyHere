//
//  MyAddressController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/17.
//  Copyright © 2020 None. All rights reserved.
//

#import "MyAddressController.h"

#import "MyAddressCell.h"
#import "MyAddressModel.h"

#import "AddNewAddressController.h"

@interface MyAddressController ()<UITableViewDataSource,UITableViewDelegate,MyAddressCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *addressTableView;
@property (strong, nonatomic) NSMutableArray *addressListArray;

@end

@implementation MyAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的地址";
    [self.addressTableView registerNib:[UINib nibWithNibName:@"MyAddressCell" bundle:nil] forCellReuseIdentifier:@"MyAddressCell"];
    
    for (NSInteger i = 0; i < 3; i++) {
        MyAddressModel *model = [[MyAddressModel alloc] init];
        model.isDeleteStatus = NO;
        [self.addressListArray addObject:model];
    }
    
}

//MARK:- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.addressListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyAddressCell"];
    cell.addressModel = self.addressListArray[indexPath.row];
    cell.delegate = self;
    return cell;
}

//MARK:- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIContextualAction *action = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:nil handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        
        [self.addressListArray removeLastObject];
        completionHandler(YES);
        [self.addressTableView reloadData];
    }];
    action.image = ImageNamed(@"list_delete");
    action.backgroundColor = [UIColor whiteColor];
    UISwipeActionsConfiguration *actionConfiguration = [UISwipeActionsConfiguration configurationWithActions:@[action]];
    return actionConfiguration;
}


//MARK:- MyAddressCellDelegate
- (void)didSetDefaultButtonClickAtCell:(MyAddressCell *)cell {
    NSIndexPath *indexPath = [self.addressTableView indexPathForCell:cell];
    NSLog(@"%@",indexPath);
    [self.addressTableView reloadData];
}

//MARK:- Action
- (IBAction)addNewAddressButtonClick {
    AddNewAddressController *addNewAddressVc = [AddNewAddressController new];
    [self.navigationController pushViewController:addNewAddressVc animated:YES];
}

//MARK:- Lazy
- (NSMutableArray *)addressListArray {
    if (!_addressListArray) {
        _addressListArray = [NSMutableArray array];
    }
    return _addressListArray;
}
@end
