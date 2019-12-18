//
//  ViewController.m
//  数据精度处理
//
//  Created by 刘伟 on 2019/12/18.
//  Copyright © 2019 刘伟. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSInteger,CaculateType) {
    CaculateTypeAdding,
    CaculateTypeSubtracting,
    CaculateTypeMultiplying,
    CaculateTypeDividing,
    CaculateTypeRaisingToPower,//x的n次方
    CaculateTypeMultiplyingByPowerOf10,//*10的n次方
};

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self normalDeal];
    
    [self decimalNumberUseCaculateType:CaculateTypeRaisingToPower];
}

- (void)normalDeal {
    float a = 1.0f;
    float b = 0.9f;
    float c = 0.8f;
    float a_b = a - b;
    float b_c = b - c;
    if (a_b == b_c) { //结果打印 a_b != b_c
        NSLog(@"a_b == b_c");
    }else {
        NSLog(@"a_b != b_c");
    }
}

- (void)decimalNumberUseCaculateType:(CaculateType)caculateType {
    float a = 1.0f;
    float b = 0.9f;
    float c = 0.81f;
    NSDecimalNumber *numberA = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",a]];
    NSDecimalNumber *numberB = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",b]];
    NSDecimalNumber *numberC = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",c]];
    NSUInteger numberD = 3;
    short numberE = 3;
    switch (caculateType) {
        case CaculateTypeAdding:{
            NSDecimalNumber *addDecimalNumber = [numberA decimalNumberByAdding:numberB];
            NSLog(@"%f",addDecimalNumber.doubleValue);
            break;
        }
        case CaculateTypeSubtracting:{
            NSDecimalNumber *subtractingNumber = [numberA decimalNumberBySubtracting:numberB];
            NSLog(@"%f",subtractingNumber.doubleValue);
            break;
        }
           
        case CaculateTypeMultiplying:{
            NSDecimalNumber *multiplyingNumber = [numberC decimalNumberByMultiplyingBy:numberB];
            NSLog(@"%f",multiplyingNumber.doubleValue);
            break;
        }
        case CaculateTypeDividing:{
            NSDecimalNumber *dividingNumber = [numberC decimalNumberByDividingBy:numberB];
            NSLog(@"%f",dividingNumber.doubleValue);
            break;
        }
        case CaculateTypeRaisingToPower:{
            NSDecimalNumber *raisingToPowerNumber = [numberC decimalNumberByRaisingToPower:numberD];
            NSLog(@"%f",raisingToPowerNumber.doubleValue);
            break;
        }
        default:{
            NSDecimalNumber *powerNumber = [numberB decimalNumberByMultiplyingByPowerOf10:numberE];
            NSLog(@"%f",powerNumber.doubleValue);
        }
        break;
    }
}

@end
