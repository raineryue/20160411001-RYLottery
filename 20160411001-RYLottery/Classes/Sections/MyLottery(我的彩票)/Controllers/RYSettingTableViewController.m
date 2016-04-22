//
//  RYSettingTableViewController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/20.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYSettingTableViewController.h"
#import "RYSettingItemGroup.h"
#import "RYArrowSettingItem.h"
#import "RYSwitchSettingItem.h"
#import "DRNRealTimeBlurView.h"
#import "MBProgressHUD+RY.h"
#import "RYConvertCodeViewController.h"

@interface RYSettingTableViewController ()

@end

@implementation RYSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    
    // 设置数据源
    [self setUpGroup1];
    [self setUpGroup2];
    [self setUpGroup3];
}

- (void)setUpGroup1 {
    RYArrowSettingItem *settingItem = [RYArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];

    settingItem.distViewController = [RYConvertCodeViewController class];
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem]];
    
    [self.settingArray addObject:settingItemGroup];
}

- (void)setUpGroup2 {
    RYArrowSettingItem *settingItem = [RYArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒"];
    RYSwitchSettingItem *settingItem1 = [RYSwitchSettingItem settingItemWithImage:[UIImage imageNamed:@"more_homeshake"] title:@"使用摇一摇机选"];
    RYSwitchSettingItem *settingItem2 = [RYSwitchSettingItem settingItemWithImage:[UIImage imageNamed:@"sound_Effect"] title:@"声音效果"];
    RYSwitchSettingItem *settingItem3 = [RYSwitchSettingItem settingItemWithImage:[UIImage imageNamed:@"More_LotteryRecommend"] title:@"购彩小助手"];
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem, settingItem1, settingItem2, settingItem3]];
    
    [self.settingArray addObject:settingItemGroup];
}

- (void)setUpGroup3 {
    RYArrowSettingItem *settingItem = [RYArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreUpdate"] title:@"检查新版本"];
    
    settingItem.itemOperation = ^{
        // 创建一个和屏幕同等大小的高莫斯效果视图
        DRNRealTimeBlurView *realTimeBlurView = [[DRNRealTimeBlurView alloc] initWithFrame:RYScreenBounds];
        
        [RYKeyWindow addSubview:realTimeBlurView];
        
        [MBProgressHUD showSuccess:@"没有最新版本"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [realTimeBlurView removeFromSuperview];
        });
    };
    
    RYArrowSettingItem *settingItem1 = [RYArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreShare"] title:@"分享"];
    RYArrowSettingItem *settingItem2 = [RYArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreNetease"] title:@"产品推荐"];
    RYArrowSettingItem *settingItem3 = [RYArrowSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreAbout"] title:@"关于"];
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem, settingItem1, settingItem2, settingItem3]];
    
    [self.settingArray addObject:settingItemGroup];
}



@end
