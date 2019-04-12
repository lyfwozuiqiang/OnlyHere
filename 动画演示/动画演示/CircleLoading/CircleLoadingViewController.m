//
//  CircleLoadingViewController.m
//  动画演示
//
//  Created by 刘伟 on 2019/4/12.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import "CircleLoadingViewController.h"

@interface CircleLoadingViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation CircleLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = self.containerView.bounds;
    replicatorLayer.backgroundColor = [UIColor cyanColor].CGColor;
    replicatorLayer.cornerRadius = self.containerView.bounds.size.width/2;
    replicatorLayer.instanceCount = 20;
    replicatorLayer.instanceDelay = 1.0/20.0;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(2*M_PI/20, 0, 0, 1);
    [self.containerView.layer addSublayer:replicatorLayer];
    
    CAShapeLayer *dotLayer = [CAShapeLayer layer];
    dotLayer.bounds = CGRectMake(0, 0, 16, 16);
    dotLayer.position = CGPointMake(10, self.containerView.bounds.size.width/2);
    dotLayer.cornerRadius = 8;
    dotLayer.transform = CATransform3DMakeScale(0, 0, 0);
    dotLayer.backgroundColor = [UIColor purpleColor].CGColor;
    [replicatorLayer addSublayer:dotLayer];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 1.0;
    scaleAnimation.repeatCount = HUGE;
    scaleAnimation.fromValue = @1;
    scaleAnimation.toValue = @0;
    scaleAnimation.removedOnCompletion = NO;
    [dotLayer addAnimation:scaleAnimation forKey:nil];
}

- (void)dealloc {
    
    NSLog(@"%@_dealloc",self.class);
}
@end
