//
//  ShoppingCartListModel.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/26.
//  Copyright © 2020 None. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShoppingCartListModel : NSObject

@property (copy, nonatomic) NSString *shopId;
@property (strong, nonatomic) NSMutableArray *shopGoodsArray;

@end

NS_ASSUME_NONNULL_END
