//
//  NSString+Category.m
//  BluetoothFramework
//
//  Created by 刘伟 on 2020/3/3.
//  Copyright © 2020 None. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

- (long)hexStringToLong {
    const char *ch = [self UTF8String];
    long result = strtol(ch, nil, 16);
    return result;
}

- (NSData *)convertHexStringToData {
    if (!self) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:20];
    NSRange range;
    if (self.length % 2 == 0) {
        range = NSMakeRange(0, 2);
    }else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < self.length; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [self substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}

@end
