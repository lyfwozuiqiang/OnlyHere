//
//  TrainingPlan.h
//  策略模式
//
//  Created by 刘伟 on 2019/4/11.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TrainingPlan : NSObject

- (void)excuteTrainingPlanAtDay:(NSString *)day duration:(NSInteger)duration;

@end

NS_ASSUME_NONNULL_END
