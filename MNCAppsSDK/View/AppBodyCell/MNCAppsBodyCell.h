//
//  MNCAppsBodyCell.h
//  MNCAppsSDK
//
//  Created by Victor Toya on 16/02/21.
//  Copyright © 2021 MNC Innovation Center. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNCAppsItem.h"
#import "MNCAppsLayout.h"
#import "MNCAppsState.h"
#import "MNCAppsBodyCellDelegate.h"

#import "UIColor+DarkMode.h"
#import "UIColor+HexString.h"
#import "UIImageView+WebCache.h"

NS_ASSUME_NONNULL_BEGIN

@interface MNCAppsBodyCell : UITableViewCell
{
    MNCAppsItem *appsItem;
}

@property(strong, nonatomic) UIView *container;
@property(strong, nonatomic) UIImageView *image;
@property(strong, nonatomic) UIButton *button;
@property(strong, nonatomic) UILabel *title;
@property(strong, nonatomic) UILabel *desc;
@property(nonatomic, weak) id<MNCAppsBodyCellDelegate> delegate;

- (void)setLayoutCell:(MNCAppsLayout *)layout;

- (void)setItem:(MNCAppsItem *)item;

@end

NS_ASSUME_NONNULL_END
