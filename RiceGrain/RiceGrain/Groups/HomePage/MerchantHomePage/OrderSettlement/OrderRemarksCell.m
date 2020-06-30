//
//  OrderRemarksCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/30.
//  Copyright © 2020 None. All rights reserved.
//

#import "OrderRemarksCell.h"

@implementation OrderRemarksCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

//MARK:- Action
- (IBAction)remarkTextFieldEditingChanged:(UITextField *)sender {
    if ([self.delegate respondsToSelector:@selector(didRemarksChanged:)]) {
        [self.delegate didRemarksChanged:sender.text];
    }
}

@end
