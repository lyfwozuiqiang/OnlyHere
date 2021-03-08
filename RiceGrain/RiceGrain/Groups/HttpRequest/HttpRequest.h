//
//  HttpRequest.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/12.
//  Copyright © 2020 None. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HttpRequestManager [HttpRequest shared]

NS_ASSUME_NONNULL_BEGIN

@interface HttpRequest : NSObject

+ (instancetype)shared;
- (void)requestWithHost:(NSString *)host path:(NSString *)path params:(NSDictionary *)params succeesHandle:(void (^)(NSDictionary *responseDict))response errorHandle:(void (^)(NSError *error))errorHandle;

@end

NS_ASSUME_NONNULL_END
