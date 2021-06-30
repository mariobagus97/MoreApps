//
//  MNCAppsLayout.m
//  MNCAppsSDK
//
//  Created by Victor Toya on 11/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import "MNCAppsLayout.h"
#import <UIKit/UIKit.h>

@implementation MNCAppsLayout

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        layoutType = [dictionary valueForKey:@"layoutType"];
        cardShadowOpacity = [[dictionary valueForKey:@"cardShadowOpacity"] intValue];
        cardRoundedSize = [[dictionary valueForKey:@"cardRoundedSize"] intValue];
        buttonColor = [dictionary valueForKey:@"buttonColor"];
        buttonTextColor = [dictionary valueForKey:@"buttonTextColor"];
        buttonRoundedSize = [[dictionary valueForKey:@"buttonRoundedSize"] intValue];
        buttonShadow = [[dictionary valueForKey:@"buttonShadow"] intValue];
    }
    return self;
}

- (float)getCardShadowOpacity
{
    return (float)cardShadowOpacity / 3;
}

- (void)setCardShadowOpacity:(int)opacity
{
    cardShadowOpacity = opacity;
}

- (int)getCardRoundedSize
{
    return cardRoundedSize * 5;
}

- (void)setCardRoundedSize:(int)size
{
    cardRoundedSize = size;
}

- (int)getButtonRoundedSize
{
    return buttonRoundedSize * 5;
}

- (void)setButtonRoundedSize:(int)size
{
    buttonRoundedSize = size;
}

- (float)getButtonShadow
{
    return (float)cardShadowOpacity / 3;
}

- (void)setButtonShadow:(int)size
{
    buttonShadow = size;
}

- (NSString *)getLayoutType
{
    return layoutType;
}

- (void)setLayoutType:(NSString *)string
{
    layoutType = string;
}

- (NSString *)getButtonColor
{
    return buttonColor;
}

- (void)setButtonColor:(NSString *)string
{
    buttonColor = string;
}

- (NSString *)getButtonTextColor
{
    return buttonTextColor;
}

- (void)setButtonTextColor:(NSString *)string
{
    buttonTextColor = string;
}

@end
