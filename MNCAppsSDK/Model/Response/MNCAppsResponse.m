//
//  MNCAppsResponse.m
//  MNCAppsSDK
//
//  Created by Victor Toya on 15/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsResponse.h"

@implementation MNCAppsResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary andStatus:(int)integer
{
    self = [super init];
    if (self) {
        layout = [[MNCAppsLayout alloc] initWithDictionary:[dictionary objectForKey:@"layout"]];
        
        NSArray *array = [dictionary objectForKey:@"items"];
        NSMutableArray *list = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < [array count]; i++)
        {
            MNCAppsItem *item = [[MNCAppsItem alloc] initWithDictionary:[array objectAtIndex:i]];
            [list addObject:item];
        }
    
        [self setItems:list];
        status = integer;
    }
    return self;
}

- (MNCAppsLayout *)getLayout
{
    return layout;
}

- (void)setLayout:(MNCAppsLayout *)object
{
    layout = object;
}

- (NSMutableArray *)getItems
{
    return items;
}

- (void)setItems:(NSMutableArray *)array
{
    items = array;
}

- (int)getStatus
{
    return status;
}

- (void)setStatus:(int)integer
{
    status = integer;
}

- (NSDate *)getCreatedDate
{
    return createdDate;
}

- (void)setCreatedDate:(NSDate *)date
{
    createdDate = date;
}

@end
