//
//  RYBaseSettingTableViewController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/22.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYBaseSettingTableViewController.h"
#import "RYSettingItemGroup.h"
#import "RYArrowSettingItem.h"
#import "RYSwitchSettingItem.h"
#import "RYSettingTableViewCell.h"

@interface RYBaseSettingTableViewController ()

@end

@implementation RYBaseSettingTableViewController

#pragma mark - 控制器加载
/**
 *  初始化类
 */
- (instancetype)init {
    // 创建一个分组样式的表格
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    
    return self;
}

/**
 *  控制器视图加载完成
 */
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 表格视图代理方法
/**
 *  返回共有多少组
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.settingArray.count;
}

/**
 *  返回每组共有共有多少
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    RYSettingItemGroup *settingItemGroup = self.settingArray[section];
    
    return settingItemGroup.settingItems.count;
}

/**
 *  返回每组每行的Cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RYSettingTableViewCell *tableViewCell = [RYSettingTableViewCell settingTableViewCellWithTableView:tableView tableViewCellStyle:UITableViewCellStyleValue1];
    
    RYSettingItemGroup *settingItemGroup = self.settingArray[indexPath.section];
    
    tableViewCell.item = settingItemGroup.settingItems[indexPath.row];
    
    return tableViewCell;
}

/**
 *  返回每组的头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    RYSettingItemGroup *settingItemGroup = self.settingArray[section];
    
    return settingItemGroup.headerTitle;
}

/**
 *  返回每组尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    RYSettingItemGroup *settingItemGroup = self.settingArray[section];
    
    return settingItemGroup.footerTitle;
}

/**
 *  选中行点击事件
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取出当前组的模型
    RYSettingItemGroup *settingItemGroup = self.settingArray[indexPath.section];
    // 取出当前组的当前行的模型
    RYSettingItem *settingItem = settingItemGroup.settingItems[indexPath.row];
    
    // 判断是否需要执行操作
    if (settingItem.itemOperation) {
        settingItem.itemOperation(indexPath);
    }
    
    // 判断是否需要执行跳转
    if ([settingItem isKindOfClass:[RYArrowSettingItem class]]) {
        // 将模型转为箭头模型（因为只有箭头模型才需要跳转）
        RYArrowSettingItem *arrowSettingItem = (RYArrowSettingItem *)settingItem;
        
        // 判断本行是否有跳转控制器
        if (arrowSettingItem.distViewController) {
            // 取出跳转控制器并且创建对象
            UIViewController *viewController = [[arrowSettingItem.distViewController alloc] init];
            
            viewController.title = settingItem.title;
            
            // 执行跳转
            [self.navigationController pushViewController:viewController animated:YES];
        }
    }
    
    // 取消选中行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 属性懒加载
/**
 *  设置界面数据源数组
 */
- (NSMutableArray *)settingArray {
    if (nil == _settingArray) {
        _settingArray = [NSMutableArray array];
    }
    
    return _settingArray;
}

@end
