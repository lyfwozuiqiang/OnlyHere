//
//  SearchResultHeaderView.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/2.
//  Copyright © 2020 None. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SearchResultHeaderViewDelegate <NSObject>
- (void)didSearchResultButtonClickWithType:(NSInteger)type;
@end
@interface SearchResultHeaderView : UITableViewHeaderFooterView

@property (assign, nonatomic) NSInteger searcyType;
@property (weak, nonatomic) id <SearchResultHeaderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
