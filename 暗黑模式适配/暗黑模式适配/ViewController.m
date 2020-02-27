//
//  ViewController.m
//  暗黑模式适配
//
//  Created by 刘伟 on 2020/2/26.
//  Copyright © 2020 None. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleUnspecified;
    
//    self.view.backgroundColor = [UIColor colorNamed:@"TitleColor"];
    
    UIColor *dymicColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return [UIColor redColor];
        }else {
            return [UIColor greenColor];
        }
    }];
    self.view.backgroundColor = dymicColor;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    
//    self.view.backgroundColor = [UIColor colorNamed:@"TitleColor"];
}

@end
