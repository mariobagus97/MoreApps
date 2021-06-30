//
//  MNCAppsOpen.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 09/03/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    MNCAPPS_OPEN_NULL,
    MNCAPPS_OPEN_WEB,
    MNCAPPS_OPEN_APP
} MNCAppsOpenEnum;

@interface MNCAppsOpen : NSObject
{
    MNCAppsOpenEnum openEnum;
}

- (instancetype)initWithString:(NSString *)string;

- (instancetype)initWithEnum:(MNCAppsOpenEnum)type;

- (NSString *)toString;

- (MNCAppsOpenEnum)type;

@end

NS_ASSUME_NONNULL_END
