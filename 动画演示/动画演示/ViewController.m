//
//  ViewController.m
//  动画演示
//
//  Created by 刘伟 on 2019/4/12.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import "ViewController.h"

#import "CircleLoading/CircleLoadingViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@property (strong, nonatomic) NSArray *listArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.listTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    self.listTableView.rowHeight = 44;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.listArray.count;
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
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
        
        _listArray = [NSArray arrayWithObjects:@{@"title":@"旋转加载",@"controller":@"CircleLoadingViewController"},
                                               @{@"title":@"弹簧动画",@"controller":@"SpringViewController"},
                                               @{@"title":@"水波纹",@"controller":@"CircleExpandViewController"},nil];
    }
    
    return _listArray;
}
@end
