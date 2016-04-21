//
//  RYNavigationController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/13.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYNavigationController.h"

@interface RYNavigationController () <UINavigationControllerDelegate>

@property (nonatomic, strong) id popGestureRecognizerDelegate;

@end

@implementation RYNavigationController

/**
 *  加载类的时候调用
 *  当程序已启动的时候就会掉用该方法（在main函数前面掉用）
 */
+ (void)load {

}

/**
 *  控制器视图加载完成
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 记录导航控制器滑动手势的代理
    self.popGestureRecognizerDelegate = self.interactivePopGestureRecognizer.delegate;
    
    // 设置导航控制器的代理
    self.delegate = self;
}

/**
 *  当前类或者其子类第一次使用的时候才会掉用
 */
+ (void)initialize
{
    // 获取当前应用下的所有的导航条
//    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    // 1.获取当前使用类下的导航条:以后经常用这个，因为有些导航条的样式是不需要修改的，如：调用相册时
    UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    // 2.设置导航条的背景颜色:如果要设置导航栏的背景图片forBarMetrics必须使用UIBarMetricsDefault，默认导航控制器的子控制器的view尺寸会变化
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    // 3.设置导航条标题颜色
    // 3.1.标题富文本属性设置
    NSMutableDictionary *titleTextAttributes = [NSMutableDictionary dictionary];
    
    titleTextAttributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    titleTextAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    
    [navigationBar setTitleTextAttributes:titleTextAttributes];
    
    /***********************************************************************
     *
     *  这里是另外一种实现导航栏返回按钮设置为白色尖头的方法，但一般提供了图片尽量使用设置
     *  左边按钮为白色箭头图片的方式实现
     *
     ***********************************************************************/
//    // 4.设置导航栏的主题颜色
//    [navigationBar setTintColor:[UIColor whiteColor]];
//    
//    // 5.设置导航栏返回按钮只留一个箭头
//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -200) forBarMetrics:UIBarMetricsDefault];
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
        
        // 1.3.这里清空导航控制器的手势代理（为了实现手势返回）
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    
    // 2.调用super的该方法实现跳转（这里必须放在最后，否则在根控制器时就会隐藏底部视图）
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 导航控制器代理方法

/**
 *  当控制器展示完成的时候调用
 */
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断当前展示的控制器是否为导航控制器的根控制器
    if (viewController == [self.viewControllers firstObject]) {
        // 如果时根控制器则还原导航控制器的手势代理
        self.interactivePopGestureRecognizer.delegate = self.popGestureRecognizerDelegate;
    }
}

/**
 *  导航栏返回按钮点击事件处理
 */
- (void)backBarButtonItemClickAction:(UIBarButtonItem *)backBarButtonItem {
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
