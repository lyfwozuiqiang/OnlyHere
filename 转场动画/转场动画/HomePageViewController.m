//
//  HomePageViewController.m
//  转场动画
//
//  Created by 刘伟 on 2019/4/11.
//  Copyright © 2019 刘伟. All rights reserved.
//

#import "HomePageViewController.h"

#import "NextViewController.h"
#import "PresentTransitionAnimator.h"
#import "PushTransitionAnimator.h"

@interface HomePageViewController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) PresentTransitionAnimator *presentTransitionAnimator;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    self.navigationController.delegate = self;
}

#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return self.presentTransitionAnimator;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return self.presentTransitionAnimator;
}

#pragma mark - UINavigationControllerDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    return [PushTransitionAnimator new];
}

#pragma mark - Action
- (IBAction)presentButtonClick {
    
    NextViewController *nextViewController = [NextViewController new];
    nextViewController.transitioningDelegate = self;
    [self presentViewController:nextViewController animated:YES completion:nil];
}

- (IBAction)pushButtonClick {
    
    NextViewController *nextViewController = [NextViewController new];
    [self.navigationController pushViewController:nextViewController animated:YES];
}

#pragma mark - Lazy
- (PresentTransitionAnimator *)presentTransitionAnimator {
    
    if (!_presentTransitionAnimator) {
        
        _presentTransitionAnimator = [[PresentTransitionAnimator alloc] init];
    }
    
    return _presentTransitionAnimator;
}
@end
