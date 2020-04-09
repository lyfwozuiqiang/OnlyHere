//
//  Person.m
//  ClassTest
//
//  Created by 刘伟 on 2020/3/21.
//  Copyright © 2020 None. All rights reserved.
//

#import "Person.h"

@interface Person()
@property (assign, nonatomic) NSInteger age;
@end
@implementation Person

- (instancetype)init {
    self = [super init];
    self.age = 1;
    return self;
}

- (void)setAge:(NSInteger)age {
    _age = age;
}

@end
