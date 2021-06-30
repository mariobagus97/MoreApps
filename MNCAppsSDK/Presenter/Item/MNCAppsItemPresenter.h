//
//  MNCAppsItemPresenter.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 16/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNCAppsItemPresenterCallback.h"
#import "MNCAppsItemService.h"
#import "MNCAppsRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface MNCAppsItemPresenter : NSObject <MNCAppsItemServiceCallback>
{
    MNCAppsItemService *service;
}

- (void)getMNCAppsItemsWithRequest:(MNCAppsRequest *)request;

@property(nonatomic, weak) id<MNCAppsItemPresenterCallback> delegate;

@end

NS_ASSUME_NONNULL_END
