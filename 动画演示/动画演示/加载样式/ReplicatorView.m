//
//  ReplicatorView.m
//  动画演示
//
//  Created by 刘伟 on 2019/10/18.
//  Copyright © 2019 HelloWorld. All rights reserved.
//

#import "ReplicatorView.h"

@implementation ReplicatorView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self histogramAnimationWithSuperFrame:frame];
        self.backgroundColor = [UIColor cyanColor];
    }
    
    return self;
}

- (void)histogramAnimationWithSuperFrame:(CGRect)frame {

    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(50, 0, SCREENWIDTH - 100, frame.size.height);
    replicatorLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    replicatorLayer.instanceCount = 4;
    replicatorLayer.instanceDelay = 0.5;
    replicatorLayer.masksToBounds = YES;
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(40, 0, 0);
    [self.layer addSublayer:replicatorLayer];
    
    CALayer *histogramLayer = [CALayer layer];
    histogramLayer.frame = CGRectMake((SCREENWIDTH - 100 - 100) / 2, frame.size.height - 60, 20, 100);
    histogramLayer.backgroundColor = [UIColor yellowColor].CGColor;
    [replicatorLayer addSublayer:histogramLayer];
    
    CABasicAnimation *heightAnimation = [CABasicAnimation animationWithKeyPath:@"bounds.size.height"];
    heightAnimation.toValue = @30;
    heightAnimation.autoreverses = YES;
    heightAnimation.repeatCount = HUGE;
    heightAnimation.duration = 0.5;
    [histogramLayer addAnimation:heightAnimation forKey:@""];
}

@end
