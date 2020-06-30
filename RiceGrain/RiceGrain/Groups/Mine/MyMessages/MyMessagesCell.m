//
//  MyMessagesCell.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/22.
//  Copyright © 2020 None. All rights reserved.
//

#import "MyMessagesCell.h"

@interface MyMessagesCell()

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end
@implementation MyMessagesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setMessageString:(NSString *)messageString {
    NSMutableAttributedString *messageAttributedString = [[NSMutableAttributedString alloc] initWithString:messageString];
    [messageAttributedString addAttribute:NSForegroundColorAttributeName value:HexColor(0x333333) range:NSMakeRange(0, messageString.length)];
    [messageAttributedString addAttribute:NSForegroundColorAttributeName value:HexColor(0xFBCB34) range:NSMakeRange(5, 5)];
    self.messageLabel.attributedText = messageAttributedString;
}

@end
