//
//  TabBarView.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/16.
//  Copyright © 2020 None. All rights reserved.
//

#import "TabBarView.h"

@interface TabBarView()

@property (weak, nonatomic) IBOutlet UIButton *indexOneButton;
@property (weak, nonatomic) IBOutlet UIButton *indexTwoButton;
@property (weak, nonatomic) IBOutlet UIButton *indexThreeButton;
@property (weak, nonatomic) IBOutlet UIButton *indexFourButton;

@property (strong, nonatomic) NSArray *normalStateImageArray;
@property (strong, nonatomic) NSArray *selectedStateImageArray;

@end

@implementation TabBarView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 1);
    self.layer.shadowRadius = 7;
    self.layer.shadowOpacity = 0.2;
    self.layer.cornerRadius = 30;
    self.frame = CGRectMake((kScreenWidth - 270)/2, (kScreenHeight - kNavigationHeight - 22 - 60), 270, 60);
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    for (NSInteger i = 0; i < 4; i++) {
        UIButton *itemButton = [self viewWithTag:i + 10];
        if (i == selectedIndex) {
            [itemButton setTitleColor:HexColor(0xFBCB34) forState:UIControlStateNormal];
            [itemButton setImage:ImageNamed(self.selectedStateImageArray[i]) forState:UIControlStateNormal];
        }else {
            [itemButton setTitleColor:HexColor(0x333333) forState:UIControlStateNormal];
            [itemButton setImage:ImageNamed(self.normalStateImageArray[i]) forState:UIControlStateNormal];
        }
    }
}

- (IBAction)itemButtonClick:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:kTabBarItemClick object:@(sender.tag - 10)];
}

//MARK:- Lazy
- (NSArray *)normalStateImageArray {
    if (!_normalStateImageArray) {
        _normalStateImageArray = [NSArray arrayWithObjects:@"tab_home_def",@"tab_find_def",@"tab_order_def",@"tab_me_def", nil];
    }
    return _normalStateImageArray;
}

- (NSArray *)selectedStateImageArray {
    if (!_selectedStateImageArray) {
        _selectedStateImageArray = [NSArray arrayWithObjects:@"tab_home_pre",@"tab_find_pre",@"tab_order_pre",@"tab_me_pre", nil];
    }
    return _selectedStateImageArray;
}
@end
