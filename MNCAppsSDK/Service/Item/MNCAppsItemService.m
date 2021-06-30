//
//  MNCAppsItemService.m
//  MNCAppsSDK
//
//  Created by Victor Toya on 18/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsItemService.h"

@implementation MNCAppsItemService

- (void)getMNCAppsItemsWithRequest:(MNCAppsRequest *)request
{
    appsRequest = request;
    
    if ([self availableStoredData] && [request getIntervals] > 0)
    {
        if ([self dataIsOutdated])
        {
            [self getServiceResponseWithRequest:request];
        }
        else
        {
            [self.delegate onGetAppsItemSuccess:appsResponse];
        }
    }
    else
    {
        [self getServiceResponseWithRequest:request];
    }
}

- (BOOL)availableStoredData
{
    NSDictionary *dictionary = [[NSUserDefaults standardUserDefaults] objectForKey:@"MNCAppsSDKSavedResponse"];
    NSDictionary *response = [dictionary objectForKey:@"response"];
    NSString *status = [dictionary valueForKey:@"status"];
    NSDate *createdDate = [dictionary valueForKey:@"createdDate"];
    
    [MNCAppsState showDevelopmentLog:[NSString stringWithFormat:@"availableStoredData %@", dictionary]];
    
    appsResponse = [[MNCAppsResponse alloc] initWithDictionary:response andStatus:[status intValue]];
    [appsResponse setCreatedDate:createdDate];
    
    if ([dictionary objectForKey:@"response"])
    {
        [MNCAppsState showDevelopmentLog:[NSString stringWithFormat:@"availableStoredData YES"]];
        return YES;
    }
    else
    {
        [MNCAppsState showDevelopmentLog:[NSString stringWithFormat:@"availableStoredData NO"]];
        return NO;
    }
}

- (BOOL)dataIsOutdated
{
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:[appsRequest getIntervals]];
    
    NSCalendar *calendars = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *storedDate = [appsResponse getCreatedDate];
    NSDate *resultDate = [calendars dateByAddingComponents:offsetComponents toDate:storedDate options:0];
    NSDate *today = [NSDate date];
    
    [MNCAppsState showDevelopmentLog:[NSString stringWithFormat:@"today date %@", today]];
    [MNCAppsState showDevelopmentLog:[NSString stringWithFormat:@"local saved data at %@", storedDate]];
    [MNCAppsState showDevelopmentLog:[NSString stringWithFormat:@"local saved data add intervals :: %@", resultDate]];
    
    if ([today compare:resultDate] == NSOrderedAscending)
    {
        [MNCAppsState showDevelopmentLog:@"dataIsOutdated NO"];
        return NO;
    }
    else
    {
        [MNCAppsState showDevelopmentLog:@"dataIsOutdated YES"];
        return YES;
    }
}

- (void)getServiceResponseWithRequest:(MNCAppsRequest *)request
{
    NSMutableString *stringURL = [[NSMutableString alloc] init];
    [stringURL appendString:@"https://firebasestorage.googleapis.com/v0/b/mnc-apps-libs.appspot.com/o/json%2F"];
    [stringURL appendFormat:@"%@", [request getUserID]];
    [stringURL appendString:@"%2F"];
    [stringURL appendFormat:@"%@", [request getBundleid]];
    [stringURL appendString:@"-android?alt=media"];
    
    [MNCAppsState showDevelopmentLog:stringURL];
    
    NSURL *url = [NSURL URLWithString:stringURL];
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    [urlRequest setTimeoutInterval:20];
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            
            if (data != nil && httpResponse.statusCode == 200)
            {
                NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                [MNCAppsState showDevelopmentLog:[NSString stringWithFormat:@"getServiceResponseWithRequest %@", dictionary]];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    self->appsResponse = [[MNCAppsResponse alloc] initWithDictionary:dictionary andStatus:(int)httpResponse.statusCode];
                    [self->appsResponse setCreatedDate:[NSDate date]];
        
                    [self saveDataWithDictionary:dictionary andStatus:(int)httpResponse.statusCode andCreatedDate:[NSDate date]];
                    [self.delegate onGetAppsItemSuccess:self->appsResponse];
                });
            }
            else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    MNCAppsError *error = [[MNCAppsError alloc] initWithCode:(int)httpResponse.statusCode andMessage:@"Failed to retreive data"];
                    [self.delegate onGetAppsItemFailed:error];
                });
            }
        }];
        
        [task resume];
}

- (void)saveDataWithDictionary:(NSDictionary *)dictionary andStatus:(int)code andCreatedDate:(NSDate *)date
{
    NSMutableDictionary *save = [[NSMutableDictionary alloc] init];
    [save setObject:dictionary forKey:@"response"];
    [save setValue:[NSString stringWithFormat:@"%d", code] forKey:@"status"];
    [save setValue:date forKey:@"createdDate"];
    
    [[NSUserDefaults standardUserDefaults] setObject:save forKey:@"MNCAppsSDKSavedResponse"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
