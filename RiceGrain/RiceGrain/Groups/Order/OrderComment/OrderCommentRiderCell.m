//
//  OrderCommentRiderCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/6.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderCommentRiderCell.h"

@interface OrderCommentRiderCell()

@property (weak, nonatomic) IBOutlet UIView *commentBackgroundView;

@property (weak, nonatomic) IBOutlet UIButton *veryBadButton;
@property (weak, nonatomic) IBOutlet UIButton *mediumButton;
@property (weak, nonatomic) IBOutlet UIButton *greatButton;

@property (weak, nonatomic) IBOutlet UIButton *wellDressButton;
@property (weak, nonatomic) IBOutlet UIButton *deliverOntimeButton;
@property (weak, nonatomic) IBOutlet UIButton *goodsWellButton;
@property (weak, nonatomic) IBOutlet UIButton *politeButton;

@end

@implementation OrderCommentRiderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.wellDressButton.layer.borderWidth = 0.5;
    self.wellDressButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
    self.deliverOntimeButton.layer.borderWidth = 0.5;
    self.deliverOntimeButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
    self.goodsWellButton.layer.borderWidth = 0.5;
    self.goodsWellButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
    self.politeButton.layer.borderWidth = 0.5;
    self.politeButton.layer.borderColor = HexColor(0xC8C8C8).CGColor;
}

- (IBAction)serviceCommentButtonClick:(UIButton *)sender {
    if (sender.tag == 0) {
        [sender setImage:ImageNamed(@"bad_pre") forState:UIControlStateNormal];
        [sender setTitleColor:HexColor(0xFBCB34) forState:UIControlStateNormal];
        [self.mediumButton setImage:ImageNamed(@"medium_def") forState:UIControlStateNormal];
        [self.mediumButton setTitleColor:HexColor(0x999999) forState:UIControlStateNormal];
        [self.greatButton setImage:ImageNamed(@"good_def") forState:UIControlStateNormal];
        [self.greatButton setTitleColor:HexColor(0x999999) forState:UIControlStateNormal];
    }else if (sender.tag == 1) {
        [sender setImage:ImageNamed(@"medium_pre") forState:UIControlStateNormal];
        [sender setTitleColor:HexColor(0xFBCB34) forState:UIControlStateNormal];
        [self.veryBadButton setImage:ImageNamed(@"bad_def") forState:UIControlStateNormal];
        [self.veryBadButton setTitleColor:HexColor(0x999999) forState:UIControlStateNormal];
        [self.greatButton setImage:ImageNamed(@"good_def") forState:UIControlStateNormal];
        [self.greatButton setTitleColor:HexColor(0x999999) forState:UIControlStateNormal];
    }else {
        [sender setImage:ImageNamed(@"good_pre") forState:UIControlStateNormal];
        [sender setTitleColor:HexColor(0xFBCB34) forState:UIControlStateNormal];
        [self.veryBadButton setImage:ImageNamed(@"bad_def") forState:UIControlStateNormal];
        [self.veryBadButton setTitleColor:HexColor(0x999999) forState:UIControlStateNormal];
        [self.mediumButton setImage:ImageNamed(@"medium_def") forState:UIControlStateNormal];
        [self.mediumButton setTitleColor:HexColor(0x999999) forState:UIControlStateNormal];
    }
}

- (IBAction)riderCommentButtonClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setBackgroundColor:HexColor(0xFBCB34)];
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        sender.layer.borderColor = HexColor(0xFBCB34).CGColor;
    }else {
        [sender setBackgroundColor:[UIColor whiteColor]];
        [sender setTitleColor:HexColor(0x999999) forState:UIControlStateNormal];
        sender.layer.borderColor = HexColor(0xC8C8C8).CGColor;
    }
}


@end
