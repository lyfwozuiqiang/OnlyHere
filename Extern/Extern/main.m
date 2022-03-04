//
//  main.m
//  Extern
//
//  Created by 刘伟 on 2022/3/4.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    extern CFAbsoluteTime startTime;
    startTime = CFAbsoluteTimeGetCurrent();
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
