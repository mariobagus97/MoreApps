//
//  MNCAppsBody.m
//  MNCAppsSDK
//
//  Created by Victor Toya on 16/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsBody.h"
#import "MNCAppsBodyCell.h"
#import "MNCAppsBodyCollectionCell.h"
#import "MNCAppsItemPresenter.h"
#import "MNCAppsState.h"
#import "MNCAppsWebView.h"

#import "UIColor+DarkMode.h"

@interface MNCAppsBody() <MNCAppsItemPresenterCallback, MNCAppsBodyCellDelegate, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *appItems;
    UITableView *tableView;
    UICollectionView *collectionView;
    UICollectionViewFlowLayout *layout;
    
    MNCAppsItemPresenter *presenter;
    MNCAppsLayout *cellLayout;
    
    BOOL isPresentedByScreen;
}

@end

@implementation MNCAppsBody

- (instancetype)initWithFrame:(CGRect)frame andRequest:(MNCAppsRequest*)request
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];

        appItems = [[NSMutableArray alloc] init];

        presenter = [[MNCAppsItemPresenter alloc] init];
        presenter.delegate = self;
        [presenter getMNCAppsItemsWithRequest:request];
        [MNCAppsState setLanguage:[request getLanguage]];

        [self performSelector:@selector(loadBackgroundColor) withObject:nil afterDelay:0.1];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [self loadCollectionView];
        }
        else
        {
            [self loadTableView];
        }
    }
    return self;
}

- (void)loadBackgroundColor
{
    // Background color need to set after delay 0.1 because it need to wait all process in initWithFrame: method to be done before it set.
    self.backgroundColor = [UIColor MNCAppsColorBackground];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        collectionView.backgroundColor = [UIColor MNCAppsColorBackground];
    }
    else
    {
        tableView.backgroundColor = [UIColor MNCAppsColorBackground];
    }
}

- (void)invalidateiPadView
{    
    if (collectionView)
    {
        [layout performSelector:@selector(invalidateLayout) withObject:nil afterDelay:0.1];
    }
}

- (void)setPresentedByScreen:(BOOL)state
{
    isPresentedByScreen = state;
}

- (void)setDarkMode:(BOOL)state
{
    [MNCAppsState setDarkMode:state];
}

//MARK: - UITableView

- (void)loadTableView
{
    tableView = [[UITableView alloc] init];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 90;
    tableView.allowsSelection = NO;
    tableView.separatorColor = [UIColor clearColor];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.contentInset =  UIEdgeInsetsMake(10, 0, 0, 0);
    
    [self addSubview:tableView];
    
    [tableView registerClass:MNCAppsBodyCell.self forCellReuseIdentifier:@"appBodyCell"];
    
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [[tableView.topAnchor constraintEqualToAnchor:self.topAnchor constant:0] setActive:YES];
    [[tableView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0] setActive:YES];
    [[tableView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:0] setActive:YES];
    [[tableView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:0] setActive:YES];
    [tableView reloadData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    MNCAppsBodyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"appBodyCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor MNCAppsColorBackground];
    cell.contentView.userInteractionEnabled = false;
    cell.delegate = self;
    
    [cell setItem:[appItems objectAtIndex:indexPath.row]];
    cell.button.tag = indexPath.row;
    
    if (cellLayout != nil)
    {
        [cell setLayoutCell:cellLayout];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [appItems count];
}

//MARK: - UICollectionView

- (void)loadCollectionView
{
    layout = [[UICollectionViewFlowLayout alloc] init];
    
    collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.allowsSelection = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator= NO;
    collectionView.contentInset =  UIEdgeInsetsMake(10, 0, 0, 0);
    [self addSubview:collectionView];
    
    [collectionView registerClass:MNCAppsBodyCollectionCell.self forCellWithReuseIdentifier:@"appBodyCollectionCell"];
    
    collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [[collectionView.topAnchor constraintEqualToAnchor:self.topAnchor constant:0] setActive:YES];
    [[collectionView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0] setActive:YES];
    [[collectionView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant:0] setActive:YES];
    [[collectionView.widthAnchor constraintLessThanOrEqualToConstant:800] setActive:YES];
    [collectionView reloadData];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MNCAppsBodyCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"appBodyCollectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor MNCAppsColorBackground];
    [cell setItem:[appItems objectAtIndex:indexPath.row]];
    
    cell.contentView.userInteractionEnabled = false;
    cell.delegate = self;
    cell.button.tag = indexPath.row;
    
    if (cellLayout != nil)
    {
        [cell setLayoutCell:cellLayout];
    }
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [appItems count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float width = (collectionView.frame.size.width/2)-5;
    return CGSizeMake(width, 90);
}

//MARK: - MNCAppsBodyCellDelegate

- (BOOL)canOpenURLScheme:(MNCAppsItem *)item
{
    //TODO: Future Release & Validation Between "Web" & "App"
    if ([[item getIOS] getScheme] != nil && ![[[item getIOS] getScheme] isEqualToString:@""])
    {
        NSURL *scheme = [NSURL URLWithString:[[item getIOS] getScheme]];
        
        if ([[UIApplication sharedApplication] canOpenURL:scheme])
        {
            return YES;
        }
        else
        {
            return NO;
        }
    }
    else
    {
        return NO;
    }
}

- (void)onRequestOpenItem:(nonnull MNCAppsItem *)item {
    if ([[item getOpen] type] == MNCAPPS_OPEN_APP)
    {
        NSString *scheme = [[item getIOS] getScheme];
        NSURL *appStore = [NSURL URLWithString:[[item getIOS] getStore]];
        
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:scheme]])
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:scheme] options:@{} completionHandler:nil];
        }
        else
        {
            [[UIApplication sharedApplication] openURL:appStore options:@{} completionHandler:nil];
        }
    }
    else
    {
        UIViewController *controller = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        
        if (isPresentedByScreen && [MNCAppsState getScreenController] != nil)
        {
            [MNCAppsState showDevelopmentLog:@"isPresentedByScreen"];
            controller = [MNCAppsState getScreenController];
        }
        else if (controller.presentedViewController)
        {
            [MNCAppsState showDevelopmentLog:@"controller.presentedViewController"];
            controller = controller.presentedViewController;
        }
        
        MNCAppsWebView *webview = [[MNCAppsWebView alloc] initWithUrl:item.getWebUrl];
        webview.modalPresentationStyle = UIModalPresentationFullScreen;
        [controller presentViewController:webview animated:NO completion:nil];
    }
}

//MARK: - MNCAppsItemPresenterCallback

- (void)onGetAppsFailed:(nonnull MNCAppsError *)error {
    [MNCAppsState showPublicLog:[NSString stringWithFormat:@"ERROR %d - %@", [error getCode], [error getMessage]]];
}

- (void)onGetAppsSuccess:(nonnull MNCAppsResponse *)response
{
    [MNCAppsState showPublicLog:@"Successfully retrieve apps"];
    [MNCAppsState setButtonColor:[UIColor colorWithHexString:[[response getLayout] getButtonColor]]];
    
    appItems = [[response getItems] mutableCopy];
    cellLayout = [response getLayout];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [collectionView reloadData];
    }
    else
    {
        [tableView reloadData];
    }
}

@end
