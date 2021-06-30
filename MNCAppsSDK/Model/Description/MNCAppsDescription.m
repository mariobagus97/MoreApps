//
//  MNCAppsDescription.m
//  MNCAppsSDK
//
//  Created by Victor Toya on 11/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsDescription.h"
#import "MNCAppsState.h"

@implementation MNCAppsDescription

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        english = [dictionary valueForKey:@"en"];
        indonesia = [dictionary valueForKey:@"id"];
    }
    return self;
}

- (NSString *)getEn
{
    return english;
}

- (void)setEn:(NSString *)string
{
    english = string;
}

- (NSString *)getIn
{
    return indonesia;
}

- (void)setIn:(NSString *)string
{
    indonesia = string;
}

@end
