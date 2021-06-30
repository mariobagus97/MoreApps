//
//  MNCRequestItem.h
//  MNCAppsSDK
//
//  Created by Muhammad Ario Bagus on 15/03/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNCAppsRequest : NSObject{
    NSString *userid;
    NSString *bundleid;
    NSString *language;
    int timeToFetch;
}

- (NSString *)getUserID;
- (void)setUserID:(NSString *)string;

- (NSString *)getBundleid;
- (void)setBundleid:(NSString *)string;

- (int)getTimeToFetch;
- (void)setTimeToFetch:(int)value;

- (NSString *)getLanguage;
- (void)setLanguage:(NSString *)string;


@end

NS_ASSUME_NONNULL_END
