//
//  RYScoreTeleviseViewController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/22.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYScoreTeleviseViewController.h"
#import "RYArrowSettingItem.h"
#import "RYSwitchSettingItem.h"
#import "RYSettingItemGroup.h"

@interface RYScoreTeleviseViewController ()

@end

@implementation RYScoreTeleviseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpGroup1];
    [self setUpGroup2];
    [self setUpGroup3];
    [self setUpGroup4];
    [self setUpGroup5];
    [self setUpGroup6];
    [self setUpGroup7];
    [self setUpGroup8];
    [self setUpGroup9];
    [self setUpGroup10];
    [self setUpGroup11];
}

- (void)setUpGroup1 {
    RYSwitchSettingItem *settingItem = [RYSwitchSettingItem settingItemWithImage:nil title:@"推送我关注的比赛"];
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem]];
    settingItemGroup.footerTitle = @"开启后，当我投注或关注的比赛开始、进球和结束时，会自动发送推送消息提醒我";
    
    [self.settingArray addObject:settingItemGroup];
}

- (void)setUpGroup2 {
    RYSettingItem *settingItem = [RYSettingItem settingItemWithImage:nil title:@"起始时间"];
    settingItem.detailTitle = @"00:00";

    // block循环引用问题解决:以下两种方式
    //    __weak RYScoreTeleviseViewController *weakSelf = self;
    __weak typeof(self) weakSelf = self;
    
    settingItem.itemOperation = ^(NSIndexPath *indexPath){
        // 点击当前Cell行弹出键盘，使用以下代码（这里是新特性），cell随着键盘上移不会挡住其他控件
        UITextField *textField = [[UITextField alloc] init];
        
        // 让文本框成为第一响应者
        [textField becomeFirstResponder];
        
        // 根据indexPath取出选择的行
        UITableViewCell *tableViwCell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        // 将文本框添加到当前点击的Cell上，实现cell的上移功能
        [tableViwCell addSubview:textField];
    };
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem]];
    settingItemGroup.headerTitle = @"只在以下时间段接受比分直播推送";
    
    [self.settingArray addObject:settingItemGroup];
}

- (void)setUpGroup3 {
    RYSettingItem *settingItem = [RYSettingItem settingItemWithImage:nil title:@"结束时间"];
    settingItem.detailTitle = @"00:00";
    // block循环引用问题解决:以下两种方式
    //    __weak RYScoreTeleviseViewController *weakSelf = self;
    __weak typeof(self) weakSelf = self;
    
    settingItem.itemOperation = ^(NSIndexPath *indexPath){
        // 点击当前Cell行弹出键盘，使用以下代码（这里是新特性），cell随着键盘上移不会挡住其他控件
        UITextField *textField = [[UITextField alloc] init];
        
        // 让文本框成为第一响应者
        [textField becomeFirstResponder];
        
        // 根据indexPath取出选择的行
        UITableViewCell *tableViwCell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        // 将文本框添加到当前点击的Cell上，实现cell的上移功能
        [tableViwCell addSubview:textField];
    };
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem]];
    settingItemGroup.headerTitle = @"只在以下时间段接受比分直播推送";
    
    [self.settingArray addObject:settingItemGroup];
}

- (void)setUpGroup4 {
    RYSettingItem *settingItem = [RYSettingItem settingItemWithImage:nil title:@"起始时间"];
    settingItem.detailTitle = @"00:00";
    // block循环引用问题解决:以下两种方式
    //    __weak RYScoreTeleviseViewController *weakSelf = self;
    __weak typeof(self) weakSelf = self;
    
    settingItem.itemOperation = ^(NSIndexPath *indexPath){
        // 点击当前Cell行弹出键盘，使用以下代码（这里是新特性），cell随着键盘上移不会挡住其他控件
        UITextField *textField = [[UITextField alloc] init];
        
        // 让文本框成为第一响应者
        [textField becomeFirstResponder];
        
        // 根据indexPath取出选择的行
        UITableViewCell *tableViwCell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        // 将文本框添加到当前点击的Cell上，实现cell的上移功能
        [tableViwCell addSubview:textField];
    };
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem]];
    settingItemGroup.headerTitle = @"只在以下时间段接受比分直播推送";
    
    [self.settingArray addObject:settingItemGroup];
}

- (void)setUpGroup5 {
    RYSettingItem *settingItem = [RYSettingItem settingItemWithImage:nil title:@"结束时间"];
    settingItem.detailTitle = @"00:00";
    // block循环引用问题解决:以下两种方式
    //    __weak RYScoreTeleviseViewController *weakSelf = self;
    __weak typeof(self) weakSelf = self;
    
    settingItem.itemOperation = ^(NSIndexPath *indexPath){
        // 点击当前Cell行弹出键盘，使用以下代码（这里是新特性），cell随着键盘上移不会挡住其他控件
        UITextField *textField = [[UITextField alloc] init];
        
        // 让文本框成为第一响应者
        [textField becomeFirstResponder];
        
        // 根据indexPath取出选择的行
        UITableViewCell *tableViwCell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        // 将文本框添加到当前点击的Cell上，实现cell的上移功能
        [tableViwCell addSubview:textField];
    };
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem]];
    settingItemGroup.headerTitle = @"只在以下时间段接受比分直播推送";
    
    [self.settingArray addObject:settingItemGroup];
}

- (void)setUpGroup6 {
    RYSettingItem *settingItem = [RYSettingItem settingItemWithImage:nil title:@"起始时间"];
    settingItem.detailTitle = @"00:00";
    // block循环引用问题解决:以下两种方式
    //    __weak RYScoreTeleviseViewController *weakSelf = self;
    __weak typeof(self) weakSelf = self;
    
    settingItem.itemOperation = ^(NSIndexPath *indexPath){
        // 点击当前Cell行弹出键盘，使用以下代码（这里是新特性），cell随着键盘上移不会挡住其他控件
        UITextField *textField = [[UITextField alloc] init];
        
        // 让文本框成为第一响应者
        [textField becomeFirstResponder];
        
        // 根据indexPath取出选择的行
        UITableViewCell *tableViwCell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        // 将文本框添加到当前点击的Cell上，实现cell的上移功能
        [tableViwCell addSubview:textField];
    };
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem]];
    settingItemGroup.headerTitle = @"只在以下时间段接受比分直播推送";
    
    [self.settingArray addObject:settingItemGroup];
}

- (void)setUpGroup7 {
    RYSettingItem *settingItem = [RYSettingItem settingItemWithImage:nil title:@"结束时间"];
    settingItem.detailTitle = @"00:00";
    // block循环引用问题解决:以下两种方式
    //    __weak RYScoreTeleviseViewController *weakSelf = self;
    __weak typeof(self) weakSelf = self;
    
    settingItem.itemOperation = ^(NSIndexPath *indexPath){
        // 点击当前Cell行弹出键盘，使用以下代码（这里是新特性），cell随着键盘上移不会挡住其他控件
        UITextField *textField = [[UITextField alloc] init];
        
        // 让文本框成为第一响应者
        [textField becomeFirstResponder];
        
        // 根据indexPath取出选择的行
        UITableViewCell *tableViwCell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        // 将文本框添加到当前点击的Cell上，实现cell的上移功能
        [tableViwCell addSubview:textField];
    };
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem]];
    settingItemGroup.headerTitle = @"只在以下时间段接受比分直播推送";
    
    [self.settingArray addObject:settingItemGroup];
}

- (void)setUpGroup8 {
    RYSettingItem *settingItem = [RYSettingItem settingItemWithImage:nil title:@"起始时间"];
    settingItem.detailTitle = @"00:00";
    // block循环引用问题解决:以下两种方式
    //    __weak RYScoreTeleviseViewController *weakSelf = self;
    __weak typeof(self) weakSelf = self;
    
    settingItem.itemOperation = ^(NSIndexPath *indexPath){
        // 点击当前Cell行弹出键盘，使用以下代码（这里是新特性），cell随着键盘上移不会挡住其他控件
        UITextField *textField = [[UITextField alloc] init];
        
        // 让文本框成为第一响应者
        [textField becomeFirstResponder];
        
        // 根据indexPath取出选择的行
        UITableViewCell *tableViwCell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        // 将文本框添加到当前点击的Cell上，实现cell的上移功能
        [tableViwCell addSubview:textField];
    };
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem]];
    settingItemGroup.headerTitle = @"只在以下时间段接受比分直播推送";
    
    [self.settingArray addObject:settingItemGroup];
}

- (void)setUpGroup9 {
    RYSettingItem *settingItem = [RYSettingItem settingItemWithImage:nil title:@"结束时间"];
    settingItem.detailTitle = @"00:00";
    
    // block循环引用问题解决:以下两种方式
//    __weak RYScoreTeleviseViewController *weakSelf = self;
    __weak typeof(self) weakSelf = self;
    
    settingItem.itemOperation = ^(NSIndexPath *indexPath){
        // 点击当前Cell行弹出键盘，使用以下代码（这里是新特性），cell随着键盘上移不会挡住其他控件
        UITextField *textField = [[UITextField alloc] init];
        
        // 让文本框成为第一响应者
        [textField becomeFirstResponder];
        
        // 根据indexPath取出选择的行
        UITableViewCell *tableViwCell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        // 将文本框添加到当前点击的Cell上，实现cell的上移功能
        [tableViwCell addSubview:textField];
    };
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem]];
    settingItemGroup.headerTitle = @"只在以下时间段接受比分直播推送";
    
    [self.settingArray addObject:settingItemGroup];
}

- (void)setUpGroup10 {
    RYSettingItem *settingItem = [RYSettingItem settingItemWithImage:nil title:@"起始时间"];
    settingItem.detailTitle = @"00:00";
    // block循环引用问题解决:以下两种方式
    //    __weak RYScoreTeleviseViewController *weakSelf = self;
    __weak typeof(self) weakSelf = self;
    
    settingItem.itemOperation = ^(NSIndexPath *indexPath){
        // 点击当前Cell行弹出键盘，使用以下代码（这里是新特性），cell随着键盘上移不会挡住其他控件
        UITextField *textField = [[UITextField alloc] init];
        
        // 让文本框成为第一响应者
        [textField becomeFirstResponder];
        
        // 根据indexPath取出选择的行
        UITableViewCell *tableViwCell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        // 将文本框添加到当前点击的Cell上，实现cell的上移功能
        [tableViwCell addSubview:textField];
    };
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem]];
    settingItemGroup.headerTitle = @"只在以下时间段接受比分直播推送";
    
    [self.settingArray addObject:settingItemGroup];
}

- (void)setUpGroup11 {
    RYSettingItem *settingItem = [RYSettingItem settingItemWithImage:nil title:@"结束时间"];
    settingItem.detailTitle = @"00:00";
    
    // block循环引用问题解决:以下两种方式
    //    __weak RYScoreTeleviseViewController *weakSelf = self;
    __weak typeof(self) weakSelf = self;
    
    settingItem.itemOperation = ^(NSIndexPath *indexPath){
        // 点击当前Cell行弹出键盘，使用以下代码（这里是新特性），cell随着键盘上移不会挡住其他控件
        UITextField *textField = [[UITextField alloc] init];
        
        // 让文本框成为第一响应者
        [textField becomeFirstResponder];
        
        // 根据indexPath取出选择的行
        UITableViewCell *tableViwCell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        // 将文本框添加到当前点击的Cell上，实现cell的上移功能
        [tableViwCell addSubview:textField];
    };
    
    RYSettingItemGroup *settingItemGroup = [RYSettingItemGroup settingItemGroupWithSettingItems:@[settingItem]];
    settingItemGroup.headerTitle = @"只在以下时间段接受比分直播推送";
    
    [self.settingArray addObject:settingItemGroup];
}

@end
