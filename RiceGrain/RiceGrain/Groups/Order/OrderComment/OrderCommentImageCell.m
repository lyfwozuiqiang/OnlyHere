//
//  OrderCommentImageCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/8.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderCommentImageCell.h"

@interface OrderCommentImageCell()

@property (weak, nonatomic) IBOutlet UIImageView *addPictureImageView;
@property (weak, nonatomic) IBOutlet UIButton *deletePictureButton;

@end
@implementation OrderCommentImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setIsDeleteButtonHidden:(BOOL)isDeleteButtonHidden {
    self.deletePictureButton.hidden = isDeleteButtonHidden;
    if (isDeleteButtonHidden) {
        self.addPictureImageView.image = ImageNamed(@"add_pic");
    }else {
        self.addPictureImageView.image = nil;
    }
}

//MARK: - Action
- (IBAction)deleteImageButtonClick {
    if ([self.delegate respondsToSelector:@selector(didDeleteImageButtonClickAtCell:)]) {
        [self.delegate didDeleteImageButtonClickAtCell:self];
    }
}

@end
