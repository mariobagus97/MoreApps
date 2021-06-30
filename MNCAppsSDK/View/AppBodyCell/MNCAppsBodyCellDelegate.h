//
//  MNCAppsBodyCellDelegate.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 09/03/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MNCAppsItem.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MNCAppsBodyCellDelegate

- (void)onRequestOpenItem:(MNCAppsItem *)item;

- (BOOL)canOpenURLScheme:(MNCAppsItem *)item;

@end

NS_ASSUME_NONNULL_END
