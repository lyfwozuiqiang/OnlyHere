//
//  PresentTransitionAnimator.m
//  转场动画
//
//  Created by 刘伟 on 2019/4/11.
//  Copyright © 2019 刘伟. All rights reserved.
//

#import "PresentTransitionAnimator.h"

@implementation PresentTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return 0.35;
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
    
    fromView.alpha = 1.f;
    toView.alpha = 0.f;
    
    [containerView addSubview:toView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        fromView.alpha = 0.f;
        toView.alpha = 1.f;
    } completion:^(BOOL finished) {
        if (finished) {
            BOOL canceled = [transitionContext transitionWasCancelled];
            [transitionContext completeTransition:!canceled];
        }
    }];
}

@end
