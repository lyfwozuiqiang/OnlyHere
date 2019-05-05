//
//  CircleExpandView.m
//  动画演示
//
//  Created by 刘伟 on 2019/4/23.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import "CircleExpandView.h"

@interface CircleExpandView ()

@property (strong, nonatomic) NSTimer *timer;

@end
@implementation CircleExpandView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(creatExpandLayer) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
    
    return self;
}

- (void)removeFromSuperview {
    
    [self.timer invalidate];
    self.timer = nil;
    [super removeFromSuperview];
}

- (void)creatExpandLayer {
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = [UIColor cyanColor].CGColor;
    shapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    shapeLayer.lineWidth = 3;
    shapeLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.layer insertSublayer:shapeLayer atIndex:0];
    
    UIBezierPath *startBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.width/2) radius:1 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    UIBezierPath *endBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.width/2) radius:130 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.duration = 5.f;
    pathAnimation.fromValue = (__bridge id)(startBezierPath.CGPath);
    pathAnimation.toValue = (__bridge id)(endBezierPath.CGPath);
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = 5.f;
    opacityAnimation.fromValue = @0.7f;
    opacityAnimation.toValue = @0.f;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[opacityAnimation,pathAnimation];
    animationGroup.duration = 5;
    [shapeLayer addAnimation:animationGroup forKey:@"animationGroup"];
    
    [self performSelector:@selector(removeLayer:) withObject:shapeLayer afterDelay:4.9];
}

- (void)removeLayer:(CAShapeLayer *)shapeLayer {
    
    [shapeLayer removeFromSuperlayer];
}

@end
