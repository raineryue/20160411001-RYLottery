//
//  RYAnnouncePrizeViewController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/22.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYAnnouncePrizeViewController.h"
#import "RYSwitchSettingItem.h"
#import "RYSettingItemGroup.h"
#import "RYSettingTableViewCell.h"

@interface RYAnnouncePrizeViewController ()

@end

@implementation RYAnnouncePrizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGroup];
}

- (void)setUpGroup {
    RYSwitchSettingItem *settingItem = [RYSwitchSettingItem settingItemWithImage:nil title:@"双色球"];
    settingItem.detailTitle = @"每周二、四、日开奖";
    RYSwitchSettingItem *settingItem1 = [RYSwitchSettingItem settingItemWithImage:nil title:@"大乐透"];
    settingItem1.detailTitle = @"每周一、三、六开奖";
    RYSwitchSettingItem *settingItem2 = [RYSwitchSettingItem settingItemWithImage:nil title:@"3D"];
    settingItem2.detailTitle = @"每天开奖、包括试机选号提醒";
    RYSwitchSettingItem *settingItem3 = [RYSwitchSettingItem settingItemWithImage:nil title:@"七乐彩"];
    settingItem3.detailTitle = @"每周一、三、五开奖";
    RYSwitchSettingItem *settingItem4 = [RYSwitchSettingItem settingItemWithImage:nil title:@"七星彩"];
    settingItem4.detailTitle = @"每周二、五、日开奖";
    RYSwitchSettingItem *settingItem5 = [RYSwitchSettingItem settingItemWithImage:nil title:@"排列3"];
    settingItem5.detailTitle = @"每天开奖";
    RYSwitchSettingItem *settingItem6 = [RYSwitchSettingItem settingItemWithImage:nil title:@"排列5"];
    settingItem6.detailTitle = @"每天开奖";
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem, settingItem1, settingItem2, settingItem3, settingItem4, settingItem5, settingItem6]];
    
    [self.settingArray addObject:settingItemGroup];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RYSettingTableViewCell *tableViewCell = [RYSettingTableViewCell settingTableViewCellWithTableView:tableView tableViewCellStyle:UITableViewCellStyleSubtitle];
    
    RYSettingItemGroup *settingItemGroup = self.settingArray[indexPath.section];
    
    tableViewCell.item = settingItemGroup.settingItems[indexPath.row];
    
    return tableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
