//
//  MNCAppsLayout.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 11/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNCAppsLayout : NSObject
{
    int cardShadowOpacity;
    int cardRoundedSize;
    int buttonRoundedSize;
    int buttonShadow;
    
    NSString *layoutType;
    
    NSString *buttonColor;
    NSString *buttonTextColor;
    
}

- (float)getCardShadowOpacity;
- (void)setCardShadowOpacity:(int)opacity;

- (int)getCardRoundedSize;
- (void)setCardRoundedSize:(int)size;

- (int)getButtonRoundedSize;
- (void)setButtonRoundedSize:(int)size;

- (float)getButtonShadow;
- (void)setButtonShadow:(int)size;

- (NSString *)getLayoutType;
- (void)setLayoutType:(NSString *)string;

- (NSString *)getButtonColor;
- (void)setButtonColor:(NSString *)string;

- (NSString *)getButtonTextColor;
- (void)setButtonTextColor:(NSString *)string;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
