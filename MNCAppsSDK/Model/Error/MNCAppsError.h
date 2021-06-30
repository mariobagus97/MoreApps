//
//  MNCAppsError.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 15/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNCAppsError : NSObject
{
    int code;
    NSString *message;
}

- (int)getCode;
- (void)setCode:(int)integer;

- (NSString *)getMessage;
- (void)setMessage:(NSString *)string;

- (instancetype)initWithCode:(int)integer andMessage:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
