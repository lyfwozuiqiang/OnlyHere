//
//  ViewController.m
//  策略模式
//
//  Created by 刘伟 on 2019/4/11.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import "ViewController.h"

#import "TrainingPlan.h"
#import "Address.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    TrainingPlan *trainingPlan = [TrainingPlan new];
//    [trainingPlan excuteTrainingPlanAtDay:@"day1" duration:30];
    
//    [self apply1];
//    [self apply2];
//    [self apply3];
//    [self getValueFromDict];
//    [self deleteSameData];
//    [self mixUse];
}

- (void)apply1 {
    
    Address *address = [Address new];
    address.country = @"中国";
    address.province = @"江苏";
    address.city = @"苏州";
    address.district = @"我家";
    address.code = 111;
    
    NSArray *keysArray = @[@"country",@"province",@"city",@"district",@"code"];
    NSDictionary *addressDictionary = [address dictionaryWithValuesForKeys:keysArray];
    NSLog(@"addressDictionary ==== %@",addressDictionary);
}

- (void)apply2 {
    
    NSArray *array = @[@10,@56,@18,@68,@33];
    
    CGFloat max = [[array valueForKeyPath:@"@max.floatValue"] floatValue];
    CGFloat avg = [[array valueForKeyPath:@"@avg.floatValue"] floatValue];
    CGFloat sum = [[array valueForKeyPath:@"@sum.floatValue"] floatValue];
    CGFloat min = [[array valueForKeyPath:@"@min.floatValue"] floatValue];
    
    NSLog(@"max = %f avg = %f sum = %f min = %f",max,avg,sum,min);
}

- (void)apply3 {
    
    Address *address1 = [Address new];
    address1.code = 45;
    
    Address *address2 = [Address new];
    address2.code = 55;
    
    Address *address3 = [Address new];
    address3.code = 37;
    
    Address *address4 = [Address new];
    address4.code = 63;
    
    NSArray *addressArray = @[address1,address2,address3,address4];
    //求和
    CGFloat sum = [[addressArray valueForKeyPath:@"@sum.code.floatValue"] floatValue];
    NSLog(@"sum == %f",sum);
    //求平均数
    NSNumber *average = [addressArray valueForKeyPath:@"@avg.code"];
    NSLog(@"average == %f",average.doubleValue);
    //数组数量(只是个🌰，平时肯定不会这么用的)
    NSNumber *count = [addressArray valueForKeyPath:@"@count"];
    NSLog(@"count == %ld",count.integerValue);
    //最大值
    NSNumber *max = [addressArray valueForKeyPath:@"@max.code"];
    NSLog(@"max == %f",max.floatValue);
    //最小值
    NSNumber *min = [addressArray valueForKeyPath:@"@min.code"];
    NSLog(@"min == %f",min.floatValue);
}

//根据某个key获取数据
- (void)getValueFromDict {
    
    NSArray *array = @[@{@"city":@"chengdu",@"person":@{@"name":@"zhangsan"}},@{@"city":@"beijing"}];
    NSLog(@"%@",[array valueForKeyPath:@"city"]);
}

//删除重复数据
- (void)deleteSameData {
    
    NSArray *array = @[@"qq", @"wechat", @"qq", @"msn", @"wechat"];
    NSLog(@"%@",[array valueForKeyPath:@"@distinctUnionOfObjects.self"]);
}

//嵌套使用 删除重复值 - 取值
- (void)mixUse {
    
    NSArray *array = @[@{@"name" : @"xiaoming",
                         @"code" : @1},
                       @{@"name": @"judy",
                         @"code" : @2},
                       @{@"name": @"judy",
                         @"code" : @3},
                       @{@"name": @"xiaohua",
                         @"code" : @4}];
    array = [array valueForKeyPath:@"@distinctUnionOfObjects.name"];
    NSLog(@"%@",array);
}
@end
