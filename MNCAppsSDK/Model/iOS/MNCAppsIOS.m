//
//  MNCAppsIOS.m
//  MNCAppsSDK
//
//  Created by Victor Toya on 11/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsIOS.h"

@implementation MNCAppsIOS

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        scheme = [dictionary valueForKey:@"scheme"];
        store = [dictionary valueForKey:@"store"];
    }
    return self;
}

- (NSString *)getScheme
{
    if (scheme == nil || [scheme isEqual:[NSNull null]]) {
        scheme = @"";
    }
    
    return scheme;
}

- (void)setScheme:(NSString *)string
{
    scheme = string;
}

- (NSString *)getStore
{
    return store;
}

- (void)setStore:(NSString *)string
{
    store = string;
}


@end
