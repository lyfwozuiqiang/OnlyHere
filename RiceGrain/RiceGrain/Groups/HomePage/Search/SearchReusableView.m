//
//  SearchReusableView.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/2.
//  Copyright © 2020 None. All rights reserved.
//

#import "SearchReusableView.h"

@interface SearchReusableView()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end

@implementation SearchReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTitleString:(NSString *)titleString {
    self.titleLabel.text = titleString;
    if ([titleString isEqualToString:@"搜索历史"]) {
        [self.rightButton setTitle:nil forState:UIControlStateNormal];
        [self.rightButton setImage:ImageNamed(@"btn_cart_delete") forState:UIControlStateNormal];
        self.rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 22, 0, 0);
    }else {
        [self.rightButton setTitle:@"换一换" forState:UIControlStateNormal];
        [self.rightButton setImage:nil forState:UIControlStateNormal];
    }
}

//MARK:- Action
- (IBAction)rightButtonClick {
    if ([self.delegate respondsToSelector:@selector(didRightButtonClickAtSection:)]) {
        [self.delegate didRightButtonClickAtSection:self.headerSection];
    }
}

@end
