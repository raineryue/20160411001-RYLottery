//
//  RYSettingTableViewCell.h
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/22.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RYSettingItem;

@interface RYSettingTableViewCell : UITableViewCell

/** Cell的数据源模型属性 */
@property (nonatomic, strong) RYSettingItem *item;

/**
 *  创建一个Cell
 *  参数:
 *  tableView:表格
 *  tableViewCellStyle:表格行样式
 */
+ (instancetype)settingTableViewCellWithTableView:(UITableView *)tableView tableViewCellStyle:(UITableViewCellStyle)tableViewCellStyle;

@end
