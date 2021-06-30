//
//  MNCAppsItemPresenter.m
//  MNCAppsSDK
//
//  Created by Victor Toya on 16/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsItemPresenter.h"

@implementation MNCAppsItemPresenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        service = [[MNCAppsItemService alloc] init];
        service.delegate = self;
    }
    return self;
}

- (void)getMNCAppsItemsWithRequest:(MNCAppsRequest*)request
{
    if ([request getUserID] == nil || [[request getUserID] isEqualToString:@""])
    {
        MNCAppsError *error = [[MNCAppsError alloc] initWithCode:0 andMessage:@"Invalid User Id"];
        [self.delegate onGetAppsFailed:error];
    }
    else if ([request getBundleid] == nil || [[request getBundleid] isEqualToString:@""])
    {
        MNCAppsError *error = [[MNCAppsError alloc] initWithCode:0 andMessage:@"Invalid Bundle Id"];
        [self.delegate onGetAppsFailed:error];
    }
    else if ([request getIntervals] < 0)
    {
        MNCAppsError *error = [[MNCAppsError alloc] initWithCode:0 andMessage:@"Invalid Interval Fetch Data"];
        [self.delegate onGetAppsFailed:error];
    }
    else
    {
        [service getMNCAppsItemsWithRequest:request];
    }
}

- (void)onGetAppsItemFailed:(nonnull MNCAppsError *)error {
    [self.delegate onGetAppsFailed:error];
}

- (void)onGetAppsItemSuccess:(nonnull MNCAppsResponse *)response {
    [self.delegate onGetAppsSuccess:response];
}

@end
