//
//  MNCAppsItemServiceCallback.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 18/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNCAppsResponse.h"
#import "MNCAppsError.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MNCAppsItemServiceCallback

- (void)onGetAppsItemSuccess:(MNCAppsResponse *)response;

- (void)onGetAppsItemFailed:(MNCAppsError *)error;

@end

NS_ASSUME_NONNULL_END
