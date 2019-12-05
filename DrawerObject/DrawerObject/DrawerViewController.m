//
//  DrawerViewController.m
//  DrawerObject
//
//  Created by 刘伟 on 2019/12/4.
//

#import "DrawerViewController.h"

#import "TabBarViewController.h"
#import "TestViewController.h"

@interface DrawerViewController ()

@property (strong, nonatomic) UIView *coverView;
@property (strong, nonatomic) TabBarViewController *tabBarController;

@end

@implementation DrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBarController = [TabBarViewController new];
    [self addChildViewController:self.tabBarController];
    self.tabBarController.view.frame = self.view.bounds;
    self.tabBarController.view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.tabBarController.view.layer.shadowOffset = CGSizeMake(-2, 0);
    self.tabBarController.view.layer.shadowOpacity = 0.1;
    [self.view addSubview:self.tabBarController.view];
    
    UIScreenEdgePanGestureRecognizer *edgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
    edgePanGesture.edges = UIRectEdgeLeft;
    [self.tabBarController.view addGestureRecognizer:edgePanGesture];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)tapGestureAction:(UITapGestureRecognizer *)tap {
    [UIView animateWithDuration:0.4 animations:^{
        tap.view.transform = CGAffineTransformIdentity;
    }];
}

- (void)panGestureAction:(UIScreenEdgePanGestureRecognizer *)gesture {
    CGPoint touchPoint = [gesture translationInView:self.view];
    NSLog(@"%@",NSStringFromCGPoint(touchPoint));
    if (touchPoint.x < 0) {
        gesture.view.transform = CGAffineTransformIdentity;
        return;
    }
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            [self.tabBarController.view addSubview:self.coverView];
            break;
        }
            
        case UIGestureRecognizerStateChanged: {
            gesture.view.transform = CGAffineTransformMakeTranslation(touchPoint.x, 0);
            self.coverView.alpha = touchPoint.x/2/SCREEN_WIDTH;
            break;
        }
            
        case UIGestureRecognizerStateEnded: {
            [UIView animateWithDuration:0.4 animations:^{
                self.coverView.alpha = 0.4f;
                gesture.view.transform = CGAffineTransformMakeTranslation(SCREEN_WIDTH - 100, 0);
            }];
            break;
        }
            
        default:
            break;
    }
}

- (IBAction)containButtonClick {
    TestViewController *testVc = [TestViewController new];
    [self.navigationController pushViewController:testVc animated:YES];
}

- (void)coverViewClick {
    
    [UIView animateWithDuration:0.4 animations:^{
        self.coverView.alpha = 0.f;
        self.tabBarController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.coverView removeFromSuperview];
        }
    }];
}

- (UIView *)coverView {
    
    if (!_coverView) {
        _coverView = [[UIView alloc] initWithFrame:self.view.bounds];
        _coverView.alpha = 0.f;
        _coverView.backgroundColor = [UIColor blackColor];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverViewClick)];
        [_coverView addGestureRecognizer:tapGesture];
    }
    
    return _coverView;
}

@end
