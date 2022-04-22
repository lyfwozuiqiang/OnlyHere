//
//  MineTableViewCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/17.
//  Copyright © 2020 None. All rights reserved.
//

#import "MineTableViewCell.h"

@interface MineTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;

@end
@implementation MineTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    self.leftLabel.text = titleArray.firstObject;
    self.rightLabel.text = titleArray.lastObject;
}

- (void)setImageArray:(NSArray *)imageArray {
    self.leftImageView.image = ImageNamed(imageArray.firstObject);
    self.rightImageView.image = ImageNamed(imageArray.lastObject);
}

//MARK: - Action
- (IBAction)leftButtonClick {
    if ([self.delegate respondsToSelector:@selector(mineTableViewCell:didClickItemWithTitle:)]) {
        [self.delegate mineTableViewCell:self didClickItemWithTitle:self.titleArray.firstObject];
    }
}

- (IBAction)rightButtonClick {
    if ([self.delegate respondsToSelector:@selector(mineTableViewCell:didClickItemWithTitle:)]) {
        [self.delegate mineTableViewCell:self didClickItemWithTitle:self.titleArray.lastObject];
    }
}

@end
