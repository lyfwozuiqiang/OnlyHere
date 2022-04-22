//
//  HttpRequest.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/7/12.
//  Copyright © 2020 None. All rights reserved.
//

#import "HttpRequest.h"

#import <AFNetworking.h>

@interface HttpRequest()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end
@implementation HttpRequest

+ (instancetype)shared {
    static HttpRequest *request = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[HttpRequest alloc] init];
    });
    return request;
}

- (void)requestWithHost:(NSString *)host path:(NSString *)path params:(NSDictionary *)params succeesHandle:(void (^)(NSDictionary *responseDict))response errorHandle:(void (^)(NSError *error))errorHandle {

    NSString *urlString = [host stringByAppendingString:path];
    [self.sessionManager POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        response(responseObject[@"result"]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"这个URL报错咯 ==  %@",urlString);
        errorHandle(error);
    }];
}

//MARK: - Lazy
- (AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
        
        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        requestSerializer.timeoutInterval = 5.f;
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        _sessionManager.requestSerializer = requestSerializer;
    }

//    AFJSONRequestSerializer *requestSerializer = (AFJSONRequestSerializer *)_sessionManager.requestSerializer;
//    if (UserManager.isLogin) {
//        [requestSerializer setValue:UserManager.token forHTTPHeaderField:@"X-Parse-Session-Token"];
//    }else {
//        [requestSerializer setValue:nil forHTTPHeaderField:@"X-Parse-Session-Token"];
//    }
    
    return _sessionManager;
}
@end
