//
//  SimpleWriteDeifne.h
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/11.
//  Copyright © 2020 None. All rights reserved.
//

#ifndef SimpleWriteDeifne_h
#define SimpleWriteDeifne_h

#define HexColor(color) [UIColor colorWithHex:color]
#define ImageNamed(imageName) [UIImage imageNamed:imageName]
#define KeyWindow [UIApplication sharedApplication].keyWindow

#define AppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define DeviceVersion [UIDevice currentDevice].systemVersion

#define Bool ios13Later [DeviceVersion floatValue] >= 13.0
#ifdef ios13Later
#define kStatusBarHeight [UIApplication sharedApplication].keyWindow.windowScene.statusBarManager.statusBarFrame.size.height
#else
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#endif

#define kScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define kScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)
#define kNavigationHeight (kStatusBarHeight + 44.0)
#define kTabBarHeight (kStatusBarHeight == 20.0 ? 49.0:83.0)

#define WeakSelf(type)  __weak typeof(type) weak##type = type; 

#endif /* SimpleWriteDeifne_h */
