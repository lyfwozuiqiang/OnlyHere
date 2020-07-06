//
//  SearchReusableView.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/2.
//  Copyright © 2020 None. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SearchReusableView;
@protocol SearchReusableViewDelegate <NSObject>
- (void)didRightButtonClickAtSection:(NSInteger)headerSeciton;
@end

@interface SearchReusableView : UICollectionReusableView

@property (copy, nonatomic) NSString *titleString;
@property (assign, nonatomic) NSInteger headerSection;
@property (weak, nonatomic) id <SearchReusableViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
