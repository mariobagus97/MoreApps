//
//  MNCAppsError.m
//  MNCAppsSDK
//
//  Created by Victor Toya on 15/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsError.h"

@implementation MNCAppsError

- (instancetype)initWithCode:(int)integer andMessage:(NSString *)string
{
    self = [super init];
    if (self) {
        code = integer;
        message = string;
    }
    return self;
}

- (int)getCode
{
    return code;
}

- (void)setCode:(int)integer
{
    code = integer;
}

- (NSString *)getMessage
{
    return message;
}

- (void)setMessage:(NSString *)string
{
    message = string;
}

@end
