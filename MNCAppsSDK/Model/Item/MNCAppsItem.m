//
//  MNCAppsItem.m
//  MNCAppsSDK
//
//  Created by Victor Toya on 11/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsItem.h"

@implementation MNCAppsItem

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        
        appID = [dictionary valueForKey:@"appID"];
        appName = [dictionary valueForKey:@"appName"];
        webUrl = [dictionary valueForKey:@"webUrl"];
        youtube = [dictionary valueForKey:@"youtube"];
        image = [dictionary valueForKey:@"image"];
        
        order = [[dictionary valueForKey:@"order"] intValue];
        
        category = [[MNCAppsCategory alloc] initWithDictionary:[dictionary objectForKey:@"category"]];
        description = [[MNCAppsDescription alloc] initWithDictionary:[dictionary objectForKey:@"description"]];
        android = [[MNCAppsAndroid alloc] initWithDictionary:[dictionary objectForKey:@"android"]];
        ios = [[MNCAppsIOS alloc] initWithDictionary:[dictionary objectForKey:@"ios"]];
        
        open = [[MNCAppsOpen alloc] initWithString:[dictionary valueForKey:@"open"]];
    }
    return self;
}

- (NSString *)getAppID
{
    return appID;
}

- (void)setAppID:(NSString *)string
{
    appID = string;
}

- (NSString *)getAppName
{
    return appName;
}

- (void)setAppName:(NSString *)string
{
    appName = string;
}

- (NSString *)getWebUrl
{
    return webUrl;
}

- (void)setWebUrl:(NSString *)string
{
    webUrl = string;
}

- (NSString *)getYoutube
{
    return youtube;
}

- (void)setYoutube:(NSString *)string
{
    youtube = string;
}

- (NSString *)getImage
{
    return image;
}

- (void)setImage:(NSString *)string
{
    image = string;
}

- (int)getOrder
{
    return order;
}

- (void)setOrder:(int)number
{
    order = number;
}

- (MNCAppsCategory *)getCategory
{
    return category;
}

- (void)setCategory:(MNCAppsCategory *)object
{
    category = object;
}

- (MNCAppsDescription *)getDescription
{
    return description;
}

- (void)setDescription:(MNCAppsDescription *)object
{
    description = object;
}

- (MNCAppsAndroid *)getAndroid
{
    return android;
}

- (void)setAndroid:(MNCAppsAndroid *)object
{
    android = object;
}

- (MNCAppsIOS *)getIOS
{
    return ios;
}

- (void)setIOS:(MNCAppsIOS *)object
{
    ios = object;
}

- (MNCAppsOpen *)getOpen
{
    return open;
}

- (void)setOpen:(MNCAppsOpen *)object
{ 
    open = object;
}

@end
