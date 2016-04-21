//
//  RYGroupBuyTableViewController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/19.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYGroupBuyTableViewController.h"
#import "RYTitleButton.h"

@interface RYGroupBuyTableViewController ()

@end

@implementation RYGroupBuyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavigationBarItems];
}

- (void)setUpNavigationBarItems {
    // 1.设置标题栏视图
    RYTitleButton *titleButton = [RYTitleButton buttonWithType:UIButtonTypeCustom];
    
    [titleButton setTitle:@"全部彩种" forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [titleButton sizeToFit];
    
    self.navigationItem.titleView = titleButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
