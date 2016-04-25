//
//  RYSettingItem.h
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/21.
//  Copyright © 2016年 Rainer. All rights reserved.
//  设置业务属性类

#import <Foundation/Foundation.h>

@interface RYSettingItem : NSObject

/** 图标 */
@property (nonatomic, strong) UIImage *image;
/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 子标题 */
@property (nonatomic, copy) NSString *detailTitle;
/** 保存行点击操作事件 */
@property (nonatomic, copy) void(^itemOperation)(NSIndexPath *indexPath);

/**
 *  根据图标和标题快速创建一个属性类对象
 */
+ (instancetype)settingItemWithImage:(UIImage *)image title:(NSString *)title;

@end
