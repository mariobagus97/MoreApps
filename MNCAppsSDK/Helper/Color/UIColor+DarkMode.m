//
//  UIColor+DarkMode.m
//  MNCAppsSDK
//
//  Created by Victor Toya on 19/03/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "UIColor+DarkMode.h"

@implementation UIColor(DarkMode)

+ (UIColor *)MNCAppsColorBackground
{
    if ([MNCAppsState isDarkMode])
    {
        return [UIColor colorWithRed:28.0/255.0 green:28.0/255.0 blue:30.0/255.0 alpha:1.0];
    }
    else
    {
        return [UIColor whiteColor];
    }
}

+ (UIColor *)MNCAppsColorTintNavigationBar
{
    if ([MNCAppsState isDarkMode])
    {
        return [UIColor colorWithRed:9.0/255.0 green:9.0/255.0 blue:11.0/255.0 alpha:1.0];
    }
    else
    {
        return [UIColor whiteColor];
    }
}

+ (UIColor *)MNCAppsColorCell
{
    if ([MNCAppsState isDarkMode])
    {
        return [UIColor colorWithRed:44.0/255.0 green:44.0/255.0 blue:46.0/255.0 alpha:1.0];
    }
    else
    {
        return [UIColor whiteColor];
    }
}

+ (UIColor *)MNCAppsColorText
{
    if ([MNCAppsState isDarkMode])
    {
        return [UIColor whiteColor];
    }
    else
    {
        return [UIColor blackColor];
    }
}

+ (UIColor *)MNCAppsColorDesc
{
    if ([MNCAppsState isDarkMode])
    {
        return [UIColor whiteColor];
    }
    else
    {
        return [UIColor grayColor];
    }
}

@end
