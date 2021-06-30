//
//  MNCAppsItemService.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 18/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNCAppsItemServiceCallback.h"
#import "MNCAppsState.h"
#import "MNCAppsRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface MNCAppsItemService : NSObject
{
    MNCAppsResponse *appsResponse;
    MNCAppsRequest *appsRequest;
}

- (void)getMNCAppsItemsWithRequest:(MNCAppsRequest *)request;

@property(nonatomic, weak) id<MNCAppsItemServiceCallback> delegate;

@end

NS_ASSUME_NONNULL_END
