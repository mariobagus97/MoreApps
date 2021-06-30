//
//  MNCAppsOpen.m
//  MNCAppsSDK
//
//  Created by Victor Toya on 09/03/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsOpen.h"

@implementation MNCAppsOpen

- (instancetype)initWithString:(NSString *)string
{
    self = [super init];
    if (self) {
        if ([string isEqualToString:@"web"])
        {
            openEnum = MNCAPPS_OPEN_WEB;
        }
        else if ([string isEqualToString:@"app"])
        {
            openEnum = MNCAPPS_OPEN_APP;
        }
        else {
            openEnum = MNCAPPS_OPEN_NULL;
        }
    }
    return self;
}

- (instancetype)initWithEnum:(MNCAppsOpenEnum)type
{
    self = [super init];
    if (self) {
        openEnum = type;
    }
    return self;
}

- (NSString *)toString
{
    switch (openEnum) {
        case MNCAPPS_OPEN_WEB:
            return @"web";
            break;
            
        case MNCAPPS_OPEN_APP:
            return @"app";
            break;
            
        default:
            return @"";
            break;
    }
}

- (MNCAppsOpenEnum)type
{
    return openEnum;
}

@end
