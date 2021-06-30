//
//  MNCAppsItem.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 11/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNCAppsCategory.h"
#import "MNCAppsDescription.h"
#import "MNCAppsAndroid.h"
#import "MNCAppsIOS.h"
#import "MNCAppsOpen.h"

NS_ASSUME_NONNULL_BEGIN

@interface MNCAppsItem : NSObject
{
    NSString *appID;
    NSString *appName;
    NSString *webUrl;
    NSString *youtube;
    NSString *image;
    
    int order;
    
    MNCAppsCategory *category;
    MNCAppsDescription *description;
    MNCAppsAndroid *android;
    MNCAppsIOS *ios;
    
    MNCAppsOpen *open;
}

- (NSString *)getAppID;
- (void)setAppID:(NSString *)string;

- (NSString *)getAppName;
- (void)setAppName:(NSString *)string;

- (NSString *)getWebUrl;
- (void)setWebUrl:(NSString *)string;

- (NSString *)getYoutube;
- (void)setYoutube:(NSString *)string;

- (NSString *)getImage;
- (void)setImage:(NSString *)string;

- (int)getOrder;
- (void)setOrder:(int)number;

- (MNCAppsCategory *)getCategory;
- (void)setCategory:(MNCAppsCategory *)object;

- (MNCAppsDescription *)getDescription;
- (void)setDescription:(MNCAppsDescription *)object;

- (MNCAppsAndroid *)getAndroid;
- (void)setAndroid:(MNCAppsAndroid *)object;

- (MNCAppsIOS *)getIOS;
- (void)setIOS:(MNCAppsIOS *)object;

- (MNCAppsOpen *)getOpen;
- (void)setOpen:(MNCAppsOpen *)object;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
