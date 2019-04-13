//
//  AppDelegate.h
//  多线程常用方式
//
//  Created by 刘伟 on 2019/4/12.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

