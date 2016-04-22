//
//  RYSettingItem.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/21.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYSettingItem.h"

@implementation RYSettingItem

/**
 *  根据图标和标题快速创建一个属性类对象
 */
+ (instancetype)settingItemWithImage:(UIImage *)image title:(NSString *)title {
    RYSettingItem *settingItem = [[self alloc] init];
    
    settingItem.image = image;
    settingItem.title = title;
    
    return settingItem;
}

/**
 *  复写该方法用来输出该对象的属性
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p> {image = %@, title = %@, detailTitle = %@}", self.class, self, self.image, self.title, self.detailTitle];
}

@end
