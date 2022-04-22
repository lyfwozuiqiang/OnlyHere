//
//  WebViewController.m
//  RiceGrain
//
//  Created by 刘伟 on 2020/6/16.
//  Copyright © 2020 None. All rights reserved.
//

#import "WebViewController.h"

#import <WebKit/WebKit.h>

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) WKWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (instancetype)initWithNavigationTitle:(NSString *)title url:(NSString *)url {
    self = [super init];
    if (self) {
        self.title = title;
        [self loadRequest:url];
    }
    return self;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.webView.frame = self.containerView.bounds;
    [self.containerView addSubview:self.webView];
}

//MARK: - Method
- (void)loadRequest:(NSString *)url {
    NSURL *requestUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];
    [self.webView loadRequest:request];
}

//MARK: - Lazy
- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectZero];
    }
    return _webView;
}
@end
