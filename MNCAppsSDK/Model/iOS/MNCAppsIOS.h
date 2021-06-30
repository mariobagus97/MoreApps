//
//  MNCAppsIOS.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 11/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNCAppsIOS : NSObject
{
    NSString *scheme;
    NSString *store;
}

- (NSString *)getScheme;
- (void)setScheme:(NSString *)string;

- (NSString *)getStore;
- (void)setStore:(NSString *)string;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
