//
//  MNCAppsBodyCell.m
//  MNCAppsSDK
//
//  Created by Victor Toya on 16/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsBodyCell.h"

@implementation MNCAppsBodyCell

@synthesize container;
@synthesize image;
@synthesize button;
@synthesize title;
@synthesize desc;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self loadContainerView];
        [self loadImageView];
        [self loadButtonView];
        [self loadTitleView];
        [self loadDescView];
    }
    return self;
}

- (void)loadContainerView
{
    container = [[UIView alloc] init];
    [self addSubview:container];
    
    container.translatesAutoresizingMaskIntoConstraints = NO;
    [[container.topAnchor constraintEqualToAnchor:self.topAnchor constant:5] setActive:YES];
    [[container.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-5] setActive:YES];
    [[container.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:15] setActive:YES];
    [[container.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-15] setActive:YES];
}

- (void)loadImageView
{
    image = [[UIImageView alloc] init];
    image.layer.cornerRadius = 10;
    image.layer.masksToBounds = YES;
    [container addSubview:image];
    
    image.translatesAutoresizingMaskIntoConstraints = NO;
    [[image.topAnchor constraintEqualToAnchor:container.topAnchor constant:10] setActive:YES];
    [[image.bottomAnchor constraintEqualToAnchor:container.bottomAnchor constant:-10] setActive:YES];
    [[image.leadingAnchor constraintEqualToAnchor:container.leadingAnchor constant:10] setActive:YES];
    [[image.widthAnchor constraintEqualToConstant:60] setActive:YES];
}

- (void)loadButtonView
{
    button = [[UIButton alloc] init];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    
    if ([[MNCAppsState getLanguage] isEqualToString:@"id"])
    {
        [button setTitle:@"Buka" forState:UIControlStateNormal];
    }
    else
    {
        [button setTitle:@"Open" forState:UIControlStateNormal];
    }
    
    [container addSubview:button];
    
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [[button.topAnchor constraintEqualToAnchor:container.topAnchor constant:25] setActive:YES];
    [[button.bottomAnchor constraintEqualToAnchor:container.bottomAnchor constant:-25] setActive:YES];
    [[button.trailingAnchor constraintEqualToAnchor:container.trailingAnchor constant:-10] setActive:YES];
    [[button.widthAnchor constraintEqualToConstant:70] setActive:YES];
}

- (void)loadTitleView
{
    title = [[UILabel alloc] init];
    title.textColor = [UIColor MNCAppsColorText];
    title.font = [UIFont boldSystemFontOfSize:14];
    [container addSubview:title];
    
    title.translatesAutoresizingMaskIntoConstraints = NO;
    [[title.topAnchor constraintEqualToAnchor:container.topAnchor constant:15] setActive:YES];
    [[title.leadingAnchor constraintEqualToAnchor:image.trailingAnchor constant:10] setActive:YES];
    [[title.trailingAnchor constraintEqualToAnchor:button.leadingAnchor constant:-10] setActive:YES];
    [[title.heightAnchor constraintEqualToConstant:20] setActive:YES];
}

- (void)loadDescView
{
    desc = [[UILabel alloc] init];
    desc.numberOfLines = 3;
    desc.textColor = [UIColor MNCAppsColorDesc];
    desc.font = [UIFont systemFontOfSize:11];
    [container addSubview:desc];
    
    desc.translatesAutoresizingMaskIntoConstraints = NO;
    [[desc.topAnchor constraintEqualToAnchor:title.bottomAnchor constant:0] setActive:YES];
    [[desc.leadingAnchor constraintEqualToAnchor:image.trailingAnchor constant:10] setActive:YES];
    [[desc.trailingAnchor constraintEqualToAnchor:button.leadingAnchor constant:-10] setActive:YES];
}

- (void)setLayoutCell:(MNCAppsLayout *)layout
{
    container.layer.cornerRadius = [layout getCardRoundedSize];
    [container setBackgroundColor:[UIColor MNCAppsColorCell]];
    
    container.layer.shadowColor = [UIColor colorWithRed:0.255/255.0 green:0.255/255.0 blue:0.255/255.0 alpha:0.5].CGColor;
    container.layer.shadowOffset = CGSizeMake(1, 0.0f);
    container.layer.shadowRadius = 3.0f;
    container.layer.shadowOpacity = [layout getCardShadowOpacity];
    container.layer.masksToBounds = NO;
    
    button.layer.cornerRadius = [layout getButtonRoundedSize];
    [button setBackgroundColor: [UIColor colorWithHexString:[layout getButtonColor]]];
    [button setTitleColor:[UIColor colorWithHexString:[layout getButtonTextColor]] forState:UIControlStateNormal];

    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOffset = CGSizeMake(1, 0.0f);
    button.layer.shadowOpacity = [layout getButtonShadow];
    button.layer.shadowRadius = 2.0f;
}

- (void)setItem:(MNCAppsItem *)item
{
    appsItem = item;
    
    title.text = [item getAppName];
    
    if ([[MNCAppsState getLanguage] isEqualToString:@"id"])
    {
        desc.text = [[item getDescription] getIn];
    }
    else
    {
        desc.text = [[item getDescription] getEn];
    }
    
    [image sd_setImageWithURL:[NSURL URLWithString:[item getImage]]];
    [button addTarget:self action:@selector(onClickOpen:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClickOpen:(UIButton*)sender
{
    [self.delegate onRequestOpenItem:appsItem];
}

@end
