//
//  NSArray+Safe.m
//  IOTServer
//
//  Created by 刘伟 on 2018/7/28.
//  Copyright © 2018年 GC. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSArray (Safe)

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index > self.count - 1) {
        return nil;
    }else {
        return [self objectAtIndex:index];
    }
}

- (id)safeObjectAtIndexedSubscript:(NSUInteger)index {
    if (index > self.count - 1) {
        return nil;
    }else {
        return [self objectAtIndexedSubscript:index];
    }
}

@end
