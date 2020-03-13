//
//  Video.m
//  Runtime
//
//  Created by 刘伟 on 2020/3/13.
//  Copyright © 2020 None. All rights reserved.
//

#import "Video.h"
@interface Video()

@property (assign, nonatomic) NSInteger totalTime;

@end

@implementation Video {
    NSString *_country;
}

- (void)play {
    NSLog(@"video play");
}

- (void)changePlayPoint {
    NSLog(@"video changePlayPoint");
}

@end
