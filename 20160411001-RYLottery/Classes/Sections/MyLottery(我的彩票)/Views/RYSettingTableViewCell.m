//
//  RYSettingTableViewCell.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/22.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYSettingTableViewCell.h"
#import "RYArrowSettingItem.h"
#import "RYSwitchSettingItem.h"

@interface RYSettingTableViewCell ()

@property (nonatomic, strong) UIImageView *accessoryImageView;
@property (nonatomic, strong) UISwitch *accessorySwitch;

@end

@implementation RYSettingTableViewCell
/**
 *  根据表对象创建一个表格行
 */
+ (instancetype)settingTableViewCellWithTableView:(UITableView *)tableView {
    static NSString *tableViewCellIdentifier = @"settingTableViewCellIdentifier";
    
    RYSettingTableViewCell *settingTableViewCell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier];
    
    if (nil == settingTableViewCell) {
        settingTableViewCell = [[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:tableViewCellIdentifier];
    }
    
    return settingTableViewCell;
}

- (UIImageView *)accessoryImageView {
    if (nil == _accessoryImageView) {
        _accessoryImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    
    return _accessoryImageView;
}

- (UISwitch *)accessorySwitch {
    if (nil == _accessorySwitch) {
        _accessorySwitch = [[UISwitch alloc] init];
    }
    
    return _accessorySwitch;
}

/**
 *  复写数据源属性setter
 */
- (void)setItem:(RYSettingItem *)item {
    _item = item;
    
    // 设置视图数据
    [self setUpSubviewsData];
    // 设置辅助视图
    [self setUpAccessoryView];
}

/**
 *  设置视图数据
 */
- (void)setUpSubviewsData {
    self.imageView.image = self.item.image;
    self.textLabel.text = self.item.title;
    self.detailTextLabel.text = self.item.detailTitle;
}

/**
 *  设置辅助视图
 */
- (void)setUpAccessoryView {
    if ([self.item isKindOfClass:[RYArrowSettingItem class]]) {
        // 箭头
        self.accessoryView = self.accessoryImageView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    } else if ([self.item isKindOfClass:[RYSwitchSettingItem class]]) {
        // 开关
        self.accessoryView = self.accessorySwitch;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else {
        // 还原
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}

@end
