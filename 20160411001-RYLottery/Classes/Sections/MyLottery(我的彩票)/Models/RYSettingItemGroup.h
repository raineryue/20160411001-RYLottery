//
//  RYSettingItemGroup.h
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/21.
//  Copyright © 2016年 Rainer. All rights reserved.
//  设置界面组模型

#import <Foundation/Foundation.h>

@class RYSettingItem;

@interface RYSettingItemGroup : NSObject

/** 当前组的行信息数组<RYSettingItem *>  */
@property (nonatomic, strong) NSArray *settingItems;
/** 当前组的头部标题 */
@property (nonatomic, copy) NSString *headerTitle;
/** 当前组的尾部标题 */
@property (nonatomic, copy) NSString *footerTitle;

/**
 *  根据设置行信息数组创建一个组信息
 */
+ (instancetype)settingItemGroupWithSettingItems:(NSArray *)settingItems;

@end
