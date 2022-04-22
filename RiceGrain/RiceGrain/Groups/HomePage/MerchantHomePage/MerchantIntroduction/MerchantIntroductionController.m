//
//  MerchantIntroductionController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/30.
//  Copyright © 2020 None. All rights reserved.
//

#import "MerchantIntroductionController.h"

#import "MerchantIntroductionAddressCell.h"
#import "MerchantInfomationoCell.h"
#import "MerchantLicenseCell.h"

@interface MerchantIntroductionController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *merchantIntroductionTableView;
@property (strong, nonatomic) IBOutlet UIView *merchantTableViewHeaderView;

@end

@implementation MerchantIntroductionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"商家";
    
    self.merchantTableViewHeaderView.frame = CGRectMake(0, 0, kScreenWidth, 117);
    self.merchantIntroductionTableView.tableHeaderView = self.merchantTableViewHeaderView;
    
    [self.merchantIntroductionTableView registerNib:[UINib nibWithNibName:@"MerchantIntroductionAddressCell" bundle:nil] forCellReuseIdentifier:@"MerchantIntroductionAddressCell"];
    [self.merchantIntroductionTableView registerNib:[UINib nibWithNibName:@"MerchantInfomationoCell" bundle:nil] forCellReuseIdentifier:@"MerchantInfomationoCell"];
    [self.merchantIntroductionTableView registerNib:[UINib nibWithNibName:@"MerchantLicenseCell" bundle:nil] forCellReuseIdentifier:@"MerchantLicenseCell"];
}

//MARK: - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MerchantIntroductionAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MerchantIntroductionAddressCell"];
        return cell;
    }else if (indexPath.row == 1) {
        MerchantInfomationoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MerchantInfomationoCell"];
        return cell;
    }else {
        MerchantLicenseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MerchantLicenseCell"];
        return cell;
    }
}
//MARK: - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
@end
