//
//  RYArenaViewController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/13.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYArenaViewController.h"

@interface RYArenaViewController ()

@end

@implementation RYArenaViewController

/**
 *  复写loadView方法，重新定义控制器根视图
 */
- (void)loadView {
    [super loadView];
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NLArenaBackground"]];
    
    backgroundImageView.userInteractionEnabled = YES;
    backgroundImageView.frame = self.view.bounds;
    
    self.view = backgroundImageView;
    
}

/**
 *  视图加载完成方法
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置导航栏信息
    [self setUpNavigationBarItems];
    
    // 2.设置子控件信息
    [self setUpSubviews];
}

/**
 *  设置导航栏信息
 */
- (void)setUpNavigationBarItems {
    // 1.设置导航栏标题视图
    // 1.1.创建一个segmentedControl内容数组
    NSArray *items = @[@"足球", @"篮球"];
    
    // 1.2.创建一个UISegmentedControl对象
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    
    // 1.3.设置默认选中
    segmentedControl.selectedSegmentIndex = 0;
    
    // 1.4.设置宽度
    segmentedControl.width += 60;
    
    // 1.5.设置背景图片
    [segmentedControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segmentedControl setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    // 1.6.设置主题颜色
    [segmentedControl setTintColor:RYColor(0, 142, 143)];
    
    // 1.7.设置导航栏标题视图
    self.navigationItem.titleView = segmentedControl;
}

- (void)setUpSubviews {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [button setTitle:@"购买足彩" forState:UIControlStateNormal];
    
    button.center = self.view.center;
    button.bounds = CGRectMake(0, 0, 100, 40);
    
    [button addTarget:self action:@selector(buttonClickAtion:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)buttonClickAtion:(UIButton *)button {
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:viewController animated:YES];
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
