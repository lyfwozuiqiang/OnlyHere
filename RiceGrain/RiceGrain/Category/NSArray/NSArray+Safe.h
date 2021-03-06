//
//  NSArray+Safe.h
//  IOTServer
//
//  Created by 刘伟 on 2018/7/28.
//  Copyright © 2018年 GC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Safe)

- (id)safeObjectAtIndex:(NSUInteger)index;
- (id)safeObjectAtIndexedSubscript:(NSUInteger)index;

@end
