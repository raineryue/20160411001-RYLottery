//
//  RYArenaNavigationController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/19.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYArenaNavigationController.h"

@interface RYArenaNavigationController () <UINavigationControllerDelegate>

@property (nonatomic, strong) id popGestureRecognizerDelegate;

@end

@implementation RYArenaNavigationController

+ (void)initialize
{
    if (self == [RYArenaNavigationController class]) {
        UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedIn:self, nil];

        UIImage *navigationBarBackgoundImage = [UIImage imageWithStretchableImage:@"NLArenaNavBar64" leftCapScale:0.5 topCapScale:0.5];
        
        [navigationBar setBackgroundImage:navigationBarBackgoundImage forBarMetrics:UIBarMetricsDefault];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 这里还原导航控制器的手势操作
//    self.interactivePopGestureRecognizer.delegate = nil;
    
    self.popGestureRecognizerDelegate = self.interactivePopGestureRecognizer.delegate;
    
    self.delegate = self;
}

/**
 *  复写导航控制器的pushViewController:animated:方法，实现非根控制器跳转底部TabBar视图的隐藏
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 1.这里判断当前导航控制器中的控制器总个数是否为0:如果为0则表示只有根控制器，不需要隐藏底部视图；如果不为0则表示有其他控制器，则需要隐藏底部视图
    if (self.viewControllers.count != 0) {
        // 1.1.隐藏需要push的控制器的底部TabBar视图
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 1.2.设置统一的非根控制器返回按钮的背景图片
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderingModeAlwaysOriginal:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtonItemClickAction:)];
        
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    
    // 2.调用super的该方法实现跳转（这里必须放在最后，否则在根控制器时就会隐藏底部视图）
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (viewController == [self.viewControllers firstObject]) {
        self.interactivePopGestureRecognizer.delegate = self.popGestureRecognizerDelegate;
    }
}

/**
 *  导航栏返回按钮点击事件处理
 */
- (void)backBarButtonItemClickAction:(UIBarButtonItem *)backBarButtonItem {
    [self popViewControllerAnimated:YES];
}

@end
