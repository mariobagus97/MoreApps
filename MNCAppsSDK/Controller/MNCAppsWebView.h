//
//  MNCAppsWebView.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 09/03/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MNCAppsWebView : UIViewController <WKNavigationDelegate>
{
    NSString *webUrl;
    
    UIImageView *MNCLogo;
    
    UINavigationBar *navbar;
    UINavigationItem *navTitle;
    UIBarButtonItem *btnBack;
}

- (instancetype)initWithUrl:(NSString*)UrlString;

@end


NS_ASSUME_NONNULL_END
