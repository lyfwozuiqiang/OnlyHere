//
//  MyAddressCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/17.
//  Copyright © 2020 None. All rights reserved.
//

#import "MyAddressCell.h"

@interface MyAddressCell()


@end

@implementation MyAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];

}


- (void)setAddressModel:(MyAddressModel *)addressModel {
 
}

- (IBAction)setDefaultButtonClick {
    if ([self.delegate respondsToSelector:@selector(didSetDefaultButtonClickAtCell:)]) {
        [self.delegate didSetDefaultButtonClickAtCell:self];
    }
}

@end
