//
//  AppDelegate.h
//  策略模式
//
//  Created by 刘伟 on 2019/4/11.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

