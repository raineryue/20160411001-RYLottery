//
//  RYTabBar.h
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/13.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RYTabBar;

@protocol RYTabBarDelegate <NSObject>

@optional
- (void)tabBar:(RYTabBar *)tabBar didClickTabBarButton:(NSInteger)index;

@end

@interface RYTabBar : UIView

@property (nonatomic, strong) NSArray<UITabBarItem *> *items;

@property (nonatomic, weak) id<RYTabBarDelegate> delegate;

@end
