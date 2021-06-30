//
//  MNCAppsCategory.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 11/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNCAppsCategory : NSObject
{
    NSString *english;
    NSString *indonesia;
}

- (NSString *)getEn;
- (void)setEn:(NSString *)string;

- (NSString *)getIn;
- (void)setIn:(NSString *)string;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
