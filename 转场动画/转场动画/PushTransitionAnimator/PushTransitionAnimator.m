//
//  PushTransitionAnimator.m
//  转场动画
//
//  Created by 刘伟 on 2019/4/11.
//  Copyright © 2019 刘伟. All rights reserved.
//

#import "PushTransitionAnimator.h"

@interface PushTransitionAnimator ()<CAAnimationDelegate>

@end
@implementation PushTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.5;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = transitionContext.containerView;
    UIView *fromView,*toView;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    }else{
        fromView = fromViewController.view;
        toView = toViewController.view;
    }
    
    fromView.frame = [transitionContext initialFrameForViewController:fromViewController];
    toView.frame = [transitionContext finalFrameForViewController:toViewController];
    
    BOOL isPush = [self isPushFromViewController:fromViewController toViewController:toViewController];
    if (isPush) {
        [containerView addSubview:toView];
    }else{
        [containerView insertSubview:toView atIndex:0];
    }
    
    CGRect mainScreenBouns = [UIScreen mainScreen].bounds;
    UIBezierPath *startBezierPath, *endBezierPath;
    if (isPush) {
        startBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointZero radius:1 startAngle:0 endAngle:2*M_PI clockwise:YES];
        endBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointZero radius:sqrt(pow(mainScreenBouns.size.width, 2) + pow(mainScreenBouns.size.height, 2)) startAngle:0 endAngle:2*M_PI clockwise:YES];
    }else {
        startBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointZero radius:sqrt(pow(mainScreenBouns.size.width, 2) + pow(mainScreenBouns.size.height, 2)) startAngle:0 endAngle:2*M_PI clockwise:YES];
        endBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointZero radius:1 startAngle:0 endAngle:2*M_PI clockwise:YES];
    }
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = mainScreenBouns;
    if (isPush) {
        toView.layer.mask = shapeLayer;
    }else {
        fromView.layer.mask = shapeLayer;
    }
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    basicAnimation.duration = [self transitionDuration:transitionContext];
    basicAnimation.fromValue = (__bridge id)(startBezierPath.CGPath);
    basicAnimation.toValue = (__bridge id)(endBezierPath.CGPath);
    basicAnimation.delegate = self;
    [basicAnimation setValue:transitionContext forKey:@"transitionContext"];
    [shapeLayer addAnimation:basicAnimation forKey:@"pathAnimation"];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
   
    id transitionContext = [anim valueForKey:@"transitionContext"];
    [transitionContext completeTransition:YES];
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    BOOL isPush = [self isPushFromViewController:fromViewController toViewController:toViewController];
    if (isPush) {
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        toView.layer.mask = nil;
    }else {
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        fromView.layer.mask = nil;
    }
}

#pragma mark - Method
- (BOOL)isPushFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController {
    
    return ([toViewController.navigationController.viewControllers indexOfObject:toViewController] > [fromViewController.navigationController.viewControllers indexOfObject:fromViewController]);
}
@end
