//
//  MNCAppsWebView.m
//  MNCAppsSDK
//
//  Created by Victor Toya on 09/03/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsWebView.h"
#import "MNCAppsState.h"

#import "UIColor+DarkMode.h"

@implementation MNCAppsWebView

- (instancetype)initWithUrl:(NSString*)UrlString
{
    self = [super init];
    if (self) {
        webUrl = UrlString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor MNCAppsColorBackground];
    [self performSelector:@selector(loadWebView) withObject:nil afterDelay:0.1];
}

- (void)loadWebView
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 21)];
    MNCLogo = [[UIImageView alloc] initWithFrame:titleView.frame];
    MNCLogo.image = [UIImage imageNamed:@"icMncApps.png" inBundle:[MNCAppsState frameworkBundle] compatibleWithTraitCollection:nil];
    [titleView addSubview:MNCLogo];
    
    UINavigationItem* navItem = [[UINavigationItem alloc] init];
    navItem.titleView = titleView;
    
    navbar = [[UINavigationBar alloc] init];
    navbar.backgroundColor = [UIColor MNCAppsColorBackground];
    [navbar setBarTintColor:[UIColor MNCAppsColorTintNavigationBar]];
    
    UIImage *image = [UIImage imageNamed:@"back.png" inBundle:[MNCAppsState frameworkBundle] compatibleWithTraitCollection:nil];
    UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [back setImage:image forState:UIControlStateNormal];
    [back addTarget:self action:@selector(onCloseMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    btnBack = [[UIBarButtonItem alloc] initWithCustomView:back];
    btnBack.customView.translatesAutoresizingMaskIntoConstraints = NO;
    [[btnBack.customView.widthAnchor constraintEqualToConstant:30] setActive:YES];
    [[btnBack.customView.heightAnchor constraintEqualToConstant:30] setActive:YES];
    
    if ([MNCAppsState isDarkMode])
    {
        UIImage *tintImage = [MNCLogo.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        MNCLogo.image = tintImage;
        MNCLogo.tintColor = [UIColor whiteColor];
        btnBack.tintColor = [UIColor whiteColor];
    }
    else
    {
        btnBack.tintColor = [UIColor blackColor];
    }
    
    navItem.leftBarButtonItem = btnBack;
    [navbar setItems:@[navItem]];
    [self.view addSubview:navbar];

    navbar.translatesAutoresizingMaskIntoConstraints = NO;
    [[navbar.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:0] setActive:YES];
    [[navbar.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:0] setActive:YES];
    [[navbar.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:0] setActive:YES];
    
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:theConfiguration];
    webView.backgroundColor = [UIColor MNCAppsColorBackground];
    webView.navigationDelegate = self;
    NSURL *nsurl=[NSURL URLWithString:webUrl];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [webView loadRequest:nsrequest];
    [self.view addSubview:webView];

    webView.translatesAutoresizingMaskIntoConstraints = NO;
    [[webView.topAnchor constraintEqualToAnchor:navbar.bottomAnchor constant:0] setActive:YES];
    [[webView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:0] setActive:YES];
    [[webView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:0] setActive:YES];
    [[webView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:0] setActive:YES];
}

- (void)onCloseMenu:(UIBarButtonItem *)item
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
