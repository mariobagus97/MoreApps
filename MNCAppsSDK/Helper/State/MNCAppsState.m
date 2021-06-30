//
//  MncAppsState.m
//  MNCAppsSDK
//
//  Created by Muhammad Ario Bagus on 10/03/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsState.h"
#import "MNCAppsDescription.h"

@implementation MNCAppsState
static id screen;
static BOOL darkMode;
static NSString *language;
static UIColor *buttonColor;

+ (NSBundle *)frameworkBundle
{
    NSString* mainBundlePath = [[NSBundle mainBundle] resourcePath];
    NSString* frameworkBundlePath = [mainBundlePath stringByAppendingPathComponent:@"Frameworks/MNCAppsSDK.framework"];
    
    return [NSBundle bundleWithPath:frameworkBundlePath];
}

+ (BOOL)isDarkMode
{
    @synchronized (self) {
        return darkMode;
    }
}

+ (void)setDarkMode:(BOOL)state
{
    @synchronized (self) {
        darkMode = state;
    }
}

+ (NSString *)getLanguage
{
    @synchronized (self) {
        return language;
    }
}

+ (void)setLanguage:(NSString *)string
{
    @synchronized (self) {
        language = string;
    }
}

+ (UIColor *)getButtonColor
{
    @synchronized (self) {
        return buttonColor;
    }
}

+ (void)setButtonColor:(UIColor *)color
{
    @synchronized (self) {
        buttonColor = color;
    }
}

+ (id)getScreenController
{
    @synchronized (self)
    {
        return screen;
    }
}

+ (void)setScreenController:(id)object
{
    @synchronized (self)
    {
        screen = object;
    }
}

+ (BOOL)isDebuging
{
    return NO;
}

+ (void)showDevelopmentLog:(id)log
{
    if ([MNCAppsState isDebuging]) {
        NSLog(@"MNCAppsSDK Development Log ::: %@", log);
    }
}

+ (void)showPublicLog:(id)log
{
    NSLog(@"MNCAppsSDK Log ::: %@", log);
}

@end
