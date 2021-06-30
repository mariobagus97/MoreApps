//
//  MNCAppsBody.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 16/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNCAppsRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface MNCAppsBody : UIView

- (void)invalidateiPadView;

- (void)setPresentedByScreen:(BOOL)state;

- (void)setDarkMode:(BOOL)state;

- (instancetype)initWithFrame:(CGRect)frame andRequest:(MNCAppsRequest *)request;

@end

NS_ASSUME_NONNULL_END
