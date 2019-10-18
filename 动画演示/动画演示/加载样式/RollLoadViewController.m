//
//  RollLoadViewController.m
//  动画演示
//
//  Created by 刘伟 on 2019/10/18.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import "RollLoadViewController.h"

#import "ReplicatorView.h"

@interface RollLoadViewController ()

@property (strong, nonatomic) CAShapeLayer *shapeLayer;
@end

@implementation RollLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.shapeLayer = [[CAShapeLayer alloc] init];
    self.shapeLayer.frame = CGRectMake((SCREENWIDTH - 100)/2, 100, 100, 100);
    self.shapeLayer.backgroundColor = [UIColor cyanColor].CGColor;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    self.shapeLayer.strokeColor = [UIColor magentaColor].CGColor;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.shapeLayer.path = bezierPath.CGPath;
    self.shapeLayer.lineWidth = 10;
    self.shapeLayer.strokeStart = 0.0;
    self.shapeLayer.strokeEnd = 0.0;
    self.shapeLayer.lineCap = kCALineCapRound;
    [self.view.layer addSublayer:self.shapeLayer];

    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basicAnimation.fromValue = @0;
    basicAnimation.toValue = @1.05;
    basicAnimation.duration = 3;
    basicAnimation.repeatCount = HUGE;
    [self.shapeLayer addAnimation:basicAnimation forKey:@"basicAnimation"];
    
    ReplicatorView *replicatorView = [[ReplicatorView alloc] initWithFrame:CGRectMake(0, 300, SCREENWIDTH, 100)];
    [self.view addSubview:replicatorView];
}

- (void)dealloc {
    NSLog(@"%@_dealloc",self.class);
}

@end
