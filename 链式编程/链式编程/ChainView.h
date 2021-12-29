//
//  ChainView.h
//  链式编程
//
//  Created by 刘一 on 2021/9/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChainView : UIView

- (ChainView * _Nonnull (^)(UIColor * _Nonnull color))bgColor;

+ (ChainView * _Nullable (^)(CGRect))init;

@end

NS_ASSUME_NONNULL_END
