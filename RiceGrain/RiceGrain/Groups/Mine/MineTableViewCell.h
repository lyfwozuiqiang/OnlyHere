//
//  MineTableViewCell.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/17.
//  Copyright © 2020 None. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MineTableViewCell;
@protocol MineTableViewCellDelegate <NSObject>

- (void)mineTableViewCell:(MineTableViewCell *)cell didClickItemWithTitle:(NSString *)title;

@end

@interface MineTableViewCell : UITableViewCell

@property (weak, nonatomic) id <MineTableViewCellDelegate> delegate;
@property (strong, nonatomic) NSArray *titleArray;
@property (strong, nonatomic) NSArray *imageArray;

@end

NS_ASSUME_NONNULL_END
