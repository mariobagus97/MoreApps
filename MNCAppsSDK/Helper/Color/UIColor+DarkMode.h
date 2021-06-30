//
//  UIColor+DarkMode.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 19/03/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MNCAppsState.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIColor(DarkMode)

+ (UIColor *)MNCAppsColorBackground;

+ (UIColor *)MNCAppsColorTintNavigationBar;

+ (UIColor *)MNCAppsColorCell;

+ (UIColor *)MNCAppsColorText;

+ (UIColor *)MNCAppsColorDesc;

@end

NS_ASSUME_NONNULL_END
