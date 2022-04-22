//
//  SearchResultHeaderView.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/2.
//  Copyright © 2020 None. All rights reserved.
//

#import "SearchResultHeaderView.h"

@interface SearchResultHeaderView()

@property (weak, nonatomic) IBOutlet UIButton *storeButton;
@property (weak, nonatomic) IBOutlet UIButton *goodsButton;

@end
@implementation SearchResultHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)setSearcyType:(NSInteger)searcyType {
    if (searcyType == 0) {
        [self.storeButton setBackgroundColor:HexColor(0x333333)];
        [self.storeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.goodsButton setTitleColor:HexColor(0x333333) forState:UIControlStateNormal];
        [self.goodsButton setBackgroundColor:[UIColor clearColor]];
    }else {
        [self.storeButton setBackgroundColor:[UIColor clearColor]];
        [self.storeButton setTitleColor:HexColor(0x333333) forState:UIControlStateNormal];
        [self.goodsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.goodsButton setBackgroundColor:HexColor(0x333333)];
    }
}

//MARK: - Action

- (IBAction)searchResultTypeButtonClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(didSearchResultButtonClickWithType:)]) {
        [self.delegate didSearchResultButtonClickWithType:sender.tag];
    }
}

@end
