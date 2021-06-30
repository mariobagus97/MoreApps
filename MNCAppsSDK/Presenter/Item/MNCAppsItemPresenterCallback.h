//
//  MNCAppsItemPresenterCallback.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 18/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNCAppsResponse.h"
#import "MNCAppsError.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MNCAppsItemPresenterCallback

- (void)onGetAppsSuccess:(MNCAppsResponse *)response;

- (void)onGetAppsFailed:(MNCAppsError *)error;

@end

NS_ASSUME_NONNULL_END
