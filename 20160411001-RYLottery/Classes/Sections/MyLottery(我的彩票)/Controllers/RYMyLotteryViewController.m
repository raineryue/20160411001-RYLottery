//
//  RYMyLotteryViewController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/19.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYMyLotteryViewController.h"
#import "RYSettingTableViewController.h"

@interface RYMyLotteryViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation RYMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置导航栏信息
    [self setUpNavigationBarButtonItems];
    
    // 2.设置子控件信息
    [self setUpChildSubviews];
}

/**
 *  设置导航栏信息
 */
- (void)setUpNavigationBarButtonItems {
    // 1.添加导航栏左边按钮204,60,78
    UIButton *leftBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [leftBarButton setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    //    [leftBarButton setImage:[UIImage imageNamed:@"FBMM_Barbutton_press"] forState:UIControlStateHighlighted];
    [leftBarButton setTitle:@"客服" forState:UIControlStateNormal];
    [leftBarButton setTitleColor:[UIColor colorWithRed:163/255.0 green:127/255.0 blue:129/255.0 alpha:1] forState:UIControlStateHighlighted];
    //    [leftBarButton setTitleColor:[UIColor colorWithRed:204/255.0 green:60/255.0 blue:78/255.0 alpha:1] forState:UIControlStateHighlighted];
    [leftBarButton addTarget:self action:@selector(customerBarButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
    // 自适应尺寸
    [leftBarButton sizeToFit];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarButton];
    
    // 2.添加导航栏右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderingModeAlwaysOriginal:@"Mylottery_config"] style:UIBarButtonItemStylePlain target:self action:@selector(settingBarButtonItemClickAction:)];
}

/**
 *  设置子控件信息
 */
- (void)setUpChildSubviews {
    // 1.获取登录按钮背景图片
    UIImage *loginButtonBackgroundImage = self.loginButton.currentBackgroundImage;
    
    // 2.拉伸登录按钮背景图片
    loginButtonBackgroundImage = [loginButtonBackgroundImage stretchableImageWithLeftCapWidth:loginButtonBackgroundImage.size.width * 0.5 topCapHeight:loginButtonBackgroundImage.size.height * 0.5];
    
    // 3.重新设置登录按钮背景图片
    [self.loginButton setBackgroundImage:loginButtonBackgroundImage forState:UIControlStateNormal];
}

/**
 *  客服按钮点击事件处理
 */
- (void)customerBarButtonClickAction:(UIButton *)customerButton {
    NSLog(@"%s", __func__);
}

/**
 *  设置按钮点击事件处理
 */
- (void)settingBarButtonItemClickAction:(UIBarButtonItem *)barButtonItem {
    RYSettingTableViewController *settingTableViewController = [[RYSettingTableViewController alloc] init];
    
    [self.navigationController pushViewController:settingTableViewController animated:YES];
}

/**
 *  登录按钮点击事件处理
 */
- (IBAction)loginButtonClickAction:(id)sender {
    NSLog(@"%s", __func__);
}

@end
