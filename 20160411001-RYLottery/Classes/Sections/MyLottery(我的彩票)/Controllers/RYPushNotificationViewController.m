//
//  RYPushNotificationViewController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/22.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYPushNotificationViewController.h"
#import "RYArrowSettingItem.h"
#import "RYSettingItemGroup.h"
#import "RYAnnouncePrizeViewController.h"
#import "RYScoreTeleviseViewController.h"

@interface RYPushNotificationViewController ()

@end

@implementation RYPushNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推送和提醒";
    
    [self setUpGroup];
}

- (void)setUpGroup {
    RYArrowSettingItem *settingItem = [RYArrowSettingItem settingItemWithImage:nil title:@"开奖推送"];
    
    settingItem.distViewController = [RYAnnouncePrizeViewController class];
    
    RYArrowSettingItem *settingItem1 = [RYArrowSettingItem settingItemWithImage:nil title:@"比分直播推送"];
    settingItem1.distViewController = [RYScoreTeleviseViewController class];
    
    RYArrowSettingItem *settingItem2 = [RYArrowSettingItem settingItemWithImage:nil title:@"中奖动画"];
    RYArrowSettingItem *settingItem3 = [RYArrowSettingItem settingItemWithImage:nil title:@"购彩提醒"];
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem, settingItem1, settingItem2, settingItem3]];
    
    [self.settingArray addObject:settingItemGroup];
}


@end
