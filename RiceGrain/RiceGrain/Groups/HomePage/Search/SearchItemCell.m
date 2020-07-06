//
//  SearchItemCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/2.
//  Copyright © 2020 None. All rights reserved.
//

#import "SearchItemCell.h"

@interface SearchItemCell()

@property (weak, nonatomic) IBOutlet UILabel *searchItemLabel;

@end
@implementation SearchItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTitleString:(NSString *)titleString {
    self.searchItemLabel.text = titleString;
}
@end
