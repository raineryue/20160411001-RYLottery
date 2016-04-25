//
//  RYSettingItemGroup.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/21.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYSettingItemGroup.h"
#import "RYSettingItem.h"

@implementation RYSettingItemGroup

/**
 *  根据设置行信息数组创建一个组信息
 */
+ (instancetype)settingItemGroupWithSettingItems:(NSArray *)settingItems {
    RYSettingItemGroup *settingItemGroup = [[RYSettingItemGroup alloc] init];
    
    settingItemGroup.settingItems = settingItems;
    
    return settingItemGroup;
}

/**
 *  复写该方法用来输出该对象的属性
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p> {settingItems = %@, headerTitle = %@, footerTitle = %@}", self.class, self, self.settingItems, self.headerTitle, self.footerTitle];
}

@end
