//
//  RYNavigationController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/13.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYNavigationController.h"
//#import <objc/runtime.h>

@interface RYNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation RYNavigationController

#pragma mark - 控制器加载
/**
 *  加载类的时候调用
 *  当程序已启动的时候就会掉用该方法（在main函数前面掉用）
 */
+ (void)load {

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
    // 4.设置导航栏的主题颜色
    [navigationBar setTintColor:[UIColor whiteColor]];
//
//    // 5.设置导航栏返回按钮只留一个箭头
//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -200) forBarMetrics:UIBarMetricsDefault];
}

/**
 *  控制器视图加载完成
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     // 记录导航控制器滑动手势的代理
     self.popGestureRecognizerDelegate = self.interactivePopGestureRecognizer.delegate;
     
     // 设置导航控制器的代理
     self.delegate = self;
     
     NSLog(@"%@", self.interactivePopGestureRecognizer);
     
     UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer = (UIScreenEdgePanGestureRecognizer *)self.interactivePopGestureRecognizer;
     
     screenEdgePanGestureRecognizer.edges = UIRectEdgeAll;
     
     NSLog(@"%ld", screenEdgePanGestureRecognizer.edges);
     */
    
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
     *
     * 获取参数方法分析：
     * self.interactivePopGestureRecognizer实际上是UIScreenEdgePanGestureRecognizer类，但是UIScreenEdgePanGestureRecognizer中并没有target属性
     * 那么需要去其父类UIPanGestureRecognizer中找，而UIPanGestureRecognizer中也没有，就需要到UIPanGestureRecognizer的父类UIGestureRecognizer中寻找
     * 可得UIGestureRecognizer中存在此属性但为私有属性
     *
     * 由以上分析可得出需要取出系统手势的target属性，给其赋值自定义的的手势处理事件，由查找可得target属性是系统类的私有属性，无法直接获得，因此可以使用
     * 运行时获取到系统类的私有属性
     * 取出某个对象里面的属性有两种方式：1.使用KVC:前提是需要知道属性名；2.使用运行时机制（需要导入<objc/runtime.h>框架）
     *
     * 运行时机制使用class_copyIvarList可以获取某个类(UIScreenEdgePanGestureRecognizer)下面的所有属性，但不会越界把父类中的属性也取出来
     * 返回值中Ivar：表示成员属性
     * 参数class：表示需要获取成员属性的类
     * 参数count：表示成员属性的总数（这里需要传一个地址）
     
     
     // 1.使用运行时机制获取target即_UINavigationInteractiveTransition对象在手势UIGestureRecognizer中的属性名
     unsigned int outCount = 0;
     
     Ivar *ivars = class_copyIvarList([UIGestureRecognizer class], &outCount);
     
     for (int i = 0; i < outCount; i++) {
     Ivar ivar = ivars[i];
     
     NSString *ivarName = @(ivar_getName(ivar));
     
     NSLog(@"属性名：%@", ivarName);
     }
     
     // 2.由以上运行时可得出target在UIGestureRecognizer中的属性名为_targets，因此可使用KVC取出target值
     NSArray *targets = [self.interactivePopGestureRecognizer valueForKeyPath:@"_targets"];
     
     // 3.取出对象
     id obj = [targets firstObject];
     
     // 4.取出target
     id target = [obj valueForKeyPath:@"_target"];
     
     // 为了防止多个手势的冲突，这里需要屏蔽系统的手势
     self.interactivePopGestureRecognizer.enabled = NO;
     
     
     // 自定义滑动手势（用来实现滑动返回功能，非系统提供的边缘滑动返回）
     UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
     */
    
    // 其实这里的self.interactivePopGestureRecognizer.delegate即为系统滑动返回手势的target，可以省掉以上使用运行时的代码
    // 自定义滑动手势（用来实现滑动返回功能，非系统提供的边缘滑动返回）
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    // 设置手势代理
    panGestureRecognizer.delegate = self;
    
    // 添加自定义手势到视图上
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
        
        // 1.3.这里清空导航控制器的手势代理（为了实现手势返回）
//        self.interactivePopGestureRecognizer.delegate = nil;
    }
    
    // 2.调用super的该方法实现跳转（这里必须放在最后，否则在根控制器时就会隐藏底部视图）
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 手势代理方法

/**
 *  返回该手势是否开始
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 判断当前栈顶控制器是否等于当前控制器中的第一个控制器，如果是则表示为根控制器，那么就不允许该手势开始
    return (self.topViewController != [self.viewControllers firstObject]);
}

/**
 *  当控制器展示完成的时候调用
 */
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    // 判断当前展示的控制器是否为导航控制器的根控制器
//    if (viewController == [self.viewControllers firstObject]) {
//        // 如果时根控制器则还原导航控制器的手势代理
//        self.interactivePopGestureRecognizer.delegate = self.popGestureRecognizerDelegate;
//    }
//}

#pragma mark - 控件点击事件
/**
 *  导航栏返回按钮点击事件处理
 */
- (void)backBarButtonItemClickAction:(UIBarButtonItem *)backBarButtonItem {
    [self popViewControllerAnimated:YES];
}

@end
