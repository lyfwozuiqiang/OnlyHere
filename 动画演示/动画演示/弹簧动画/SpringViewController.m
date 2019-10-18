//
//  SpringViewController.m
//  动画演示
//
//  Created by 刘伟 on 2019/4/22.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import "SpringViewController.h"

@interface SpringViewController ()

@property (weak, nonatomic) IBOutlet UIView *animationContentView;

@property (strong, nonatomic) CAShapeLayer *linerShapeLayer;
@property (strong, nonatomic) UIView *animationView;

@end

@implementation SpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       
        [self.animationContentView.layer addSublayer:self.linerShapeLayer];
        [self addLineShapeLayerSpringAnimtation];
        
        [self.animationContentView addSubview:self.animationView];
        [self addViewSpringAnimation];
    });
}

#pragma mark - Method
- (void)addLineShapeLayerSpringAnimtation {
    
    UIBezierPath *startBezierPath = [UIBezierPath bezierPath];
    [startBezierPath moveToPoint:CGPointMake(0, 0)];
    [startBezierPath addQuadCurveToPoint:CGPointMake(100, 0) controlPoint:CGPointMake(50, 0)];
    
    UIBezierPath *endBezierPath = [UIBezierPath bezierPath];
    [endBezierPath moveToPoint:CGPointMake(0, 0)];
    [endBezierPath addQuadCurveToPoint:CGPointMake(100, 0) controlPoint:CGPointMake(50, 20)];
    
    CABasicAnimation *pathBasicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathBasicAnimation.duration = 0.5f;
    pathBasicAnimation.repeatCount = HUGE;
    pathBasicAnimation.autoreverses = YES;
    pathBasicAnimation.fromValue = (__bridge id)(startBezierPath.CGPath);
    pathBasicAnimation.toValue = (__bridge id)(endBezierPath.CGPath);
    pathBasicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.linerShapeLayer addAnimation:pathBasicAnimation forKey:@"pathBasicAnimation"];
}

- (void)addViewSpringAnimation {

    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.animationView.frame = CGRectMake(95, 97 - (10 - 6), 10, 10);
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.animationView.frame = CGRectMake(95, 97 - 10, 10, 10);
            } completion:^(BOOL finished) {
                if (finished) {
                    //initialSpringVelocity则表示初始的速度，数值越大一开始移动越快。
                    //usingSpringWithDamping的范围为0.0f到1.0f，数值越小「弹簧」的振动效果越明显。
                    [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:3 options:UIViewAnimationOptionCurveEaseIn animations:^{
                        self.animationView.frame = CGRectMake(95, 97 - 50, 10, 10);
                    } completion:^(BOOL finished) {
                        if (finished) {
                            [self addViewSpringAnimation];
                        }
                    }];
                }
            }];
        }
    }];
}
#pragma mark - Lazy
- (CAShapeLayer *)linerShapeLayer {
    
    if (!_linerShapeLayer) {
        _linerShapeLayer = [CAShapeLayer layer];
        _linerShapeLayer.lineWidth = 6;
        _linerShapeLayer.frame = CGRectMake(50, 97, 100, 6);
        _linerShapeLayer.fillColor = [UIColor clearColor].CGColor;
        _linerShapeLayer.strokeColor = [UIColor yellowColor].CGColor;
        _linerShapeLayer.lineCap = kCALineCapRound;
    }
    
    return _linerShapeLayer;
}

- (UIView *)animationView {
    
    if (!_animationView) {
        _animationView = [[UIView alloc] initWithFrame:CGRectMake(95, 97 - 10, 10, 10)];
        _animationView.layer.cornerRadius = 5.f;
        _animationView.backgroundColor = [UIColor redColor];
    }
    
    return _animationView;
}

- (void)dealloc {
    
    NSLog(@"%@_dealloc",self.class);
}
@end
