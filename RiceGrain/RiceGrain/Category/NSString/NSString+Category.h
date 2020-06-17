//
//  NSString+Category.h
//  BluetoothFramework
//
//  Created by 刘伟 on 2020/3/3.
//  Copyright © 2020 None. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Category)

- (long)hexStringToLong;
- (NSData *)convertHexStringToData;

@end

NS_ASSUME_NONNULL_END
