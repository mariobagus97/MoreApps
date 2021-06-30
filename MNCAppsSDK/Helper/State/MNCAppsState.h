//
//  MncAppsState.h
//  MNCAppsSDK
//
//  Created by Muhammad Ario Bagus on 10/03/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNCAppsState : NSObject

+ (NSBundle *)frameworkBundle;


+ (BOOL)isDarkMode;

+ (void)setDarkMode:(BOOL)state;


+ (NSString *)getLanguage;

+ (void)setLanguage:(NSString *)string;


+ (UIColor *)getButtonColor;

+ (void)setButtonColor:(UIColor *)color;


+ (id)getScreenController;

+ (void)setScreenController:(id)object;


+ (BOOL)isDebuging;

+ (void)showDevelopmentLog:(id)log;

+ (void)showPublicLog:(id)log;

@end

NS_ASSUME_NONNULL_END
