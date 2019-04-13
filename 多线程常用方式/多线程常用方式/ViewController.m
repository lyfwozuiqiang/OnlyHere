//
//  ViewController.m
//  多线程常用方式
//
//  Created by 刘伟 on 2019/4/12.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@property (nonatomic) NSArray *listArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listTableView.rowHeight = 44;
    
    [self.listTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.listArray.count;
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.textLabel.text = self.listArray[indexPath.row][@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Class viewControllerClass = NSClassFromString(self.listArray[indexPath.row][@"controller"]);
    [self.navigationController pushViewController:[viewControllerClass new] animated:YES];
}

#pragma mark - Lazy
- (NSArray *)listArray {
    
    if (!_listArray) {
        
        _listArray = @[@{@"title":@"GCD",@"controller":@"GCDViewController"},
                       @{@"title":@"NSOperation",@"controller":@"OperationViewController"},
                       ];
    }
    
    return _listArray;
}

@end
