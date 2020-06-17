//
//  NSMutableArray+Safe.m
//  IOTServer
//
//  Created by 刘伟 on 2018/7/28.
//  Copyright © 2018年 GC. All rights reserved.
//

#import "NSMutableArray+Safe.h"

@implementation NSMutableArray (Safe)

- (void)safeRemoveObjectAtIndex:(NSUInteger)index {
    if (index > self.count - 1) {
        return;
    }else {
        [self removeObjectAtIndex:index];
    }
}

- (void)safeInsertObject:(id)object atIndex:(NSUInteger)index {
    if (object == nil || index > self.count - 1) {
        return;
    }else {
        [self insertObject:object atIndex:index];
    }
}
@end
