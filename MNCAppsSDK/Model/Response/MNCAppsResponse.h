//
//  MNCAppsResponse.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 15/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNCAppsLayout.h"
#import "MNCAppsItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface MNCAppsResponse : NSObject
{
    MNCAppsLayout *layout;
    NSMutableArray *items; //MNCAppsItem
    int status;
    
    NSDate *createdDate;
}

- (MNCAppsLayout *)getLayout;
- (void)setLayout:(MNCAppsLayout *)object;

- (NSMutableArray *)getItems;
- (void)setItems:(NSMutableArray *)array;

- (int)getStatus;
- (void)setStatus:(int)integer;

- (NSDate *)getCreatedDate;
- (void)setCreatedDate:(NSDate *)date;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary andStatus:(int)integer;

@end

NS_ASSUME_NONNULL_END
