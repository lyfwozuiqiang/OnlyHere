//
//  OrderCommentStoreCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/6.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderCommentStoreCell.h"

#import "OrderCommentImageCell.h"

@interface OrderCommentStoreCell()<UITextViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,OrderCommentImageCellDelegate>

@property (weak, nonatomic) IBOutlet UIView *starButtonContainerView;
@property (weak, nonatomic) IBOutlet UIView *describeView;
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *picturesCollectionView;

@property (assign, nonatomic) NSInteger pictureNumbers;
@end
@implementation OrderCommentStoreCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.picturesCollectionView registerNib:[UINib nibWithNibName:@"OrderCommentImageCell" bundle:nil] forCellWithReuseIdentifier:@"OrderCommentImageCell"];
    self.pictureNumbers = 3;
    self.describeView.layer.borderWidth = 0.5;
    self.describeView.layer.borderColor = HexColor(0xEBEBEB).CGColor;
}

//MARK:- UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    self.placeholderLabel.hidden = textView.text.length;
}

//MARK:- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.pictureNumbers == 0) {
        return 1;
    }else if (self.pictureNumbers > 0 && self.pictureNumbers < 5) {
        return self.pictureNumbers + 1;
    }else {
        return 5;
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    OrderCommentImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"OrderCommentImageCell" forIndexPath:indexPath];
    cell.delegate = self;
    if (self.pictureNumbers == 0) {
        cell.isDeleteButtonHidden = YES;
    }else if (self.pictureNumbers > 0 && self.pictureNumbers < 5) {
        if (indexPath.row < self.pictureNumbers) {
            cell.isDeleteButtonHidden = NO;
        }else {
            cell.isDeleteButtonHidden = YES;
        }
    }else {
        cell.isDeleteButtonHidden = NO;
    }
    return cell;
}
//MARK:- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(83, 83);
}

//MARK:- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectItemAtIndexPath %@",indexPath);
}

//MARK:- OrderCommentImageCellDelegate
- (void)didDeleteImageButtonClickAtCell:(OrderCommentImageCell *)cell {
    NSIndexPath *indexPath = [self.picturesCollectionView indexPathForCell:cell];
    NSLog(@"%@",indexPath);
}
//MARK:- Action
- (IBAction)starButtonClick:(UIButton *)sender {
    for (UIButton *starButton in self.starButtonContainerView.subviews) {
        if (starButton.tag <= sender.tag) {
            [starButton setImage:ImageNamed(@"praise_light") forState:UIControlStateNormal];
        }else {
            [starButton setImage:ImageNamed(@"praise_ash") forState:UIControlStateNormal];
        }
    }
}

@end
