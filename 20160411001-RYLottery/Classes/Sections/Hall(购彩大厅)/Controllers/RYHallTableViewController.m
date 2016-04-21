//
//  RYHallTableViewController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/13.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYHallTableViewController.h"
#import "RYCoverView.h"
#import "RYContentView.h"
#import "RYPopMenuView.h"
#import "RYPopMenuItemModel.h"

@interface RYHallTableViewController ()

@property (nonatomic, weak) RYPopMenuView *popMenuView;
@property (nonatomic, assign) BOOL isPopMenuHiden;

@end

@implementation RYHallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderingModeAlwaysOriginal:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(activityBarButtonClickAction:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderingModeAlwaysOriginal:@"Development"] style:UIBarButtonItemStylePlain target:self action:@selector(popBarButtonClickAction:)];
}

- (void)activityBarButtonClickAction:(UIBarButtonItem *)barButtonItem {
    // 弹出活动框
    [RYCoverView show];
}

- (void)popBarButtonClickAction:(UIBarButtonItem *)barButtonItem {
    if (!self.isPopMenuHiden)
        [self popMenuView];
    else
        [self.popMenuView dismissPopMenuView];
    
    self.isPopMenuHiden = !self.isPopMenuHiden;
}

- (RYPopMenuView *)popMenuView {
    if (nil == _popMenuView) {
        RYPopMenuItemModel *popMenuItem = [RYPopMenuItemModel  popMenuItemModelWithTitle:@"1" image:[UIImage imageNamed:@"Development"]];
        RYPopMenuItemModel *popMenuItem1 = [RYPopMenuItemModel  popMenuItemModelWithTitle:@"2" image:[UIImage imageNamed:@"Development"]];
        RYPopMenuItemModel *popMenuItem2 = [RYPopMenuItemModel  popMenuItemModelWithTitle:@"3" image:[UIImage imageNamed:@"Development"]];
        RYPopMenuItemModel *popMenuItem3 = [RYPopMenuItemModel  popMenuItemModelWithTitle:@"4" image:[UIImage imageNamed:@"Development"]];
        RYPopMenuItemModel *popMenuItem4 = [RYPopMenuItemModel  popMenuItemModelWithTitle:@"5" image:[UIImage imageNamed:@"Development"]];
        RYPopMenuItemModel *popMenuItem5 = [RYPopMenuItemModel  popMenuItemModelWithTitle:@"6" image:[UIImage imageNamed:@"Development"]];
        
        NSArray *popMenuItemArray = @[popMenuItem, popMenuItem1, popMenuItem2, popMenuItem3, popMenuItem4, popMenuItem5];
        
        CGPoint origin = CGPointMake(0, 0);
        
        RYPopMenuView *popMenuView = [RYPopMenuView showPopMenuViewInView:self.view popMenuItem:popMenuItemArray origin:origin];
        
        _popMenuView = popMenuView;
    }
    
    return _popMenuView;
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
