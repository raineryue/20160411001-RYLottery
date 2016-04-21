//
//  RYArenaNavigationController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/19.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYArenaNavigationController.h"

@interface RYArenaNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation RYArenaNavigationController

#pragma mark - 控制器加载
/**
 *  当前类或者其子类第一次使用的时候才会掉用
 */
+ (void)initialize {
    if (self == [RYArenaNavigationController class]) {
        // 1.获取当前使用类下的导航条:以后经常用这个，因为有些导航条的样式是不需要修改的，如：调用相册时
        UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedIn:self, nil];

        // 2.获取拉伸好的导航条背景图片
        UIImage *navigationBarBackgoundImage = [UIImage imageWithStretchableImage:@"NLArenaNavBar64" leftCapScale:0.5 topCapScale:0.5];
        
        // 3.设置导航条的背景颜色:如果要设置导航栏的背景图片forBarMetrics必须使用UIBarMetricsDefault，默认导航控制器的子控制器的view尺寸会变化
        [navigationBar setBackgroundImage:navigationBarBackgoundImage forBarMetrics:UIBarMetricsDefault];
    }
}

/**
 *  控制器视图加载完成
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     * 系统导航控制器的手势self.interactivePopGestureRecognizer内容如下:
     *
     * <UIScreenEdgePanGestureRecognizer: 0x7f95224a4860; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7f95224a4410>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7f95224a35a0>)>>
     *
     * 以上的信息解释：
     * UIScreenEdgePanGestureRecognizer:滑动手势类型（此手势继承UIPanGestureRecognizer）
     * target:_UINavigationInteractiveTransition
     * action:handleNavigationTransition:
     *
     * 结论：
     * 分析可得系统返回手势也是通过给视图添加滑动手势并且实现target的action实现的
     * 方案：
     * 可以取出系统手势的target和action方法，添加到自定义的滑动手势上，让自定义的的滑动手势执行系统的handleNavigationTransition:方法
     *
     */
    // 自定义滑动手势（用来实现滑动返回功能，非系统提供的边缘滑动返回）其实这里的self.interactivePopGestureRecognizer.delegate即为系统滑动返回手势的target
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    // 设置手势代理决定是否执行手势
    panGestureRecognizer.delegate = self;
    
    // 给当前视图添加滑动手势
    [self.view addGestureRecognizer:panGestureRecognizer];
}

#pragma mark - 父类方法重写
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
    }
    
    // 2.调用super的该方法实现跳转（这里必须放在最后，否则在根控制器时就会隐藏底部视图）
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 控件点击事件
/**
 *  导航栏返回按钮点击事件处理
 */
- (void)backBarButtonItemClickAction:(UIBarButtonItem *)backBarButtonItem {
    [self popViewControllerAnimated:YES];
}

#pragma mark - 手势代理方法
/**
 *  返回该手势是否开始
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 判断当前栈顶控制器是否等于当前控制器中的第一个控制器，如果是则表示为根控制器，那么就不允许该手势开始
    return (self.topViewController != [self.viewControllers firstObject]);
}

@end
