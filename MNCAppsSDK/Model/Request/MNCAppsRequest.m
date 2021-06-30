//
//  MNCRequestItem.m
//  MNCAppsSDK
//
//  Created by Muhammad Ario Bagus on 15/03/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsRequest.h"

@implementation MNCAppsRequest

- (NSString *)getUserID
{
    return userid;
}

- (void)setUserID:(NSString *)string
{
    userid = string;
}

- (NSString *)getBundleid
{
    return bundleid;
}

- (void)setBundleid:(NSString *)string
{
    bundleid = string;
}

- (int)getIntervals
{
    return intervals;
}

- (void)setIntervals:(int)value
{
    intervals = value;
}

- (NSString *)getLanguage
{
    return language;
}

- (void)setLanguage:(NSString *)string
{
    language = string;
}

@end
