//
//  MNCAppsScreen.m
//  MNCAppsSDK
//
//  Created by Victor Toya on 16/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsScreen.h"
#import "MNCAppsBody.h"
#import "MNCAppsState.h"

#import "UIColor+DarkMode.h"

@interface MNCAppsScreen ()
{
    MNCAppsBody *appsBody;
    
    UIImageView *MNCLogo;
    
    UINavigationBar *navbar;
    UINavigationItem *navTitle;
    UIBarButtonItem *btnBack;
}

@end

@implementation MNCAppsScreen

- (void)setDarkMode:(BOOL)state
{
    [MNCAppsState setDarkMode:state];
}

- (instancetype)initWithRequest:(MNCAppsRequest*)request
{
    self = [super init];
    if (self) {
        [MNCAppsState setScreenController:self];
        
        appsBody = [[MNCAppsBody alloc] initWithFrame:CGRectMake(0, 0, 0, 0) andRequest:request];
        [appsBody setPresentedByScreen:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor MNCAppsColorBackground];
    [self performSelector:@selector(loadAppBodyView) withObject:nil afterDelay:0.1];
}

- (void)onCloseMenu:(UIBarButtonItem *)item
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [appsBody invalidateiPadView];
}

- (void)loadAppBodyView
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
    
    UIImageView *separator = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 1)];
    separator.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.2];
    [self.view addSubview:separator];
    
    separator.translatesAutoresizingMaskIntoConstraints = NO;
    [[separator.topAnchor constraintEqualToAnchor:navbar.bottomAnchor constant:0] setActive:YES];
    [[separator.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:0] setActive:YES];
    [[separator.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:0] setActive:YES];
    [[separator.heightAnchor constraintEqualToConstant:1] setActive:YES];
    
    [self.view addSubview:appsBody];

    appsBody.translatesAutoresizingMaskIntoConstraints = NO;
    [[appsBody.topAnchor constraintEqualToAnchor:separator.bottomAnchor constant:0] setActive:YES];
    [[appsBody.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:0] setActive:YES];
    [[appsBody.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:0] setActive:YES];
    [[appsBody.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:0] setActive:YES];

}


@end
