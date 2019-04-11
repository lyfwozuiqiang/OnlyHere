//
//  Address.h
//  策略模式
//
//  Created by 刘伟 on 2019/4/11.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Address : NSObject

@property (copy, nonatomic) NSString *country;
@property (copy, nonatomic) NSString *province;
@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *district;
@property (assign, nonatomic) int code;

@end

NS_ASSUME_NONNULL_END
