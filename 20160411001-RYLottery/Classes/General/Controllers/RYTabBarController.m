//
//  RYTabBarController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/13.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYTabBarController.h"
#import "RYArenaViewController.h"
#import "RYDiscoverTableViewController.h"
#import "RYHallTableViewController.h"
#import "RYHistoryTableViewController.h"
#import "RYMyLotteryViewController.h"
#import "RYTabBar.h"
#import "RYNavigationController.h"
#import "RYArenaNavigationController.h"

@interface RYTabBarController () <RYTabBarDelegate>

@property (nonatomic, weak) RYTabBar *customTabBar;
@property (nonatomic, strong) NSMutableArray *itemArray;

@end

@implementation RYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置所有的子控制器
    [self setUpAllChildViewControllers];
    
    // 2.设置tabBar
    self.customTabBar.items = self.itemArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    for (UIView *childView in self.tabBar.subviews) {
        if (![childView isKindOfClass:[RYTabBar class]]) {
            [childView removeFromSuperview];
        }
    }
}

/**
 *  设置所有的子控制器
 */
- (void)setUpAllChildViewControllers {
    // 1.购彩大厅
    RYHallTableViewController *hallTableViewController = [[RYHallTableViewController alloc] init];
    [self setUpChildViewController:hallTableViewController itemTitle:@"购彩大厅" imageName:@"TabBar_LotteryHall_new" selectImageName:@"TabBar_LotteryHall_selected_new"];
    
    // 2.竞技场
    RYArenaViewController *arenaViewController = [[RYArenaViewController alloc] init];
    [self setUpChildViewController:arenaViewController itemTitle:@"" imageName:@"TabBar_Arena_new" selectImageName:@"TabBar_Arena_selected_new"];
    
    // 3.发现
    UIStoryboard *storyboar = [UIStoryboard storyboardWithName:@"RYDiscoverTableViewController" bundle:nil];
    
    RYDiscoverTableViewController *discoverTableViewController = storyboar.instantiateInitialViewController;
    [self setUpChildViewController:discoverTableViewController itemTitle:@"发现" imageName:@"TabBar_Discovery_new" selectImageName:@"TabBar_Discovery_selected_new"];
    
    // 4.开奖信息
    RYHistoryTableViewController *historyTableViewController = [[RYHistoryTableViewController alloc] init];
    [self setUpChildViewController:historyTableViewController itemTitle:@"开奖信息" imageName:@"TabBar_History_new" selectImageName:@"TabBar_History_selected_new"];
    
    // 5.我的彩票
    RYMyLotteryViewController *myLotteryViewController = [[RYMyLotteryViewController alloc] init];
    [self setUpChildViewController:myLotteryViewController itemTitle:@"我的彩票" imageName:@"TabBar_MyLottery_new" selectImageName:@"TabBar_MyLottery_selected_new"];
}

/**
 *  给控制器添加子控制器
 */
- (void)setUpChildViewController:(UIViewController *)viewController itemTitle:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName {
    // 1.设置控制器tabBar的按钮属性
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    
    viewController.navigationItem.title = title;
    
    // 2.给自定义的tabBar属性复制
    [self.itemArray addObject:viewController.tabBarItem];
    
    // 3.创建一个导航控制器对象，把控制器设置根控制器
    UINavigationController *navigationController = [[RYNavigationController alloc] initWithRootViewController:viewController];
    
    if ([viewController isKindOfClass:[RYArenaViewController class]]) {
        navigationController = [[RYArenaNavigationController alloc] initWithRootViewController:viewController];
    }
    
    // 4.将控制器作为当前的子控制器
    [self addChildViewController:navigationController];
}

/**
 *  懒加载自定义TabBar控件
 */
- (RYTabBar *)customTabBar {
    if (nil == _customTabBar) {
        // 1.把控制器的系统tabBar移除，这里调用移除操作并不会马上销毁，一般在下一次运行循环的时候就会判断这个对象有没有抢引用，如果没有才会销毁
//        [self.tabBar removeFromSuperview];
        
        // 2.创建一个自定义的TabBar对象
        RYTabBar *tabBar = [[RYTabBar alloc] init];
        
        tabBar.delegate = self;
        
        // 3.设置自定义TabBar对象的位置大小
        tabBar.frame = self.tabBar.bounds;
        
        // 4.强引用对象
        _customTabBar = tabBar;
        
        // 5.将自定义TabBar对象添加到当前控制器的视图上
        [self.tabBar addSubview:_customTabBar];
    }
    
    return _customTabBar;
}

/**
 *  懒加载item数组
 */
- (NSMutableArray *)itemArray {
    if (nil == _itemArray) {
        _itemArray = [NSMutableArray array];
    }
    
    return _itemArray;
}

/**
 *  随机一个颜色
 */
- (UIColor *)arc4randomColor{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

#pragma mark - 代理事件实现
/**
 *  TabBar代理事件
 */
- (void)tabBar:(RYTabBar *)tabBar didClickTabBarButton:(NSInteger)index {
    self.selectedIndex = index;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
