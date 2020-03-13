//
//  Video.h
//  Runtime
//
//  Created by 刘伟 on 2020/3/13.
//  Copyright © 2020 None. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Video : NSObject

@property (copy, nonatomic) NSString *name;
- (void)play;

@end

NS_ASSUME_NONNULL_END
