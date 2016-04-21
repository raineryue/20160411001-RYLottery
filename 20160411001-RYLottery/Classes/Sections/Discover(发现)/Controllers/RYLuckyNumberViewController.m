//
//  RYLuckyNumberViewController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/19.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYLuckyNumberViewController.h"

@interface RYLuckyNumberViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *lightImageViwe;

@end

@implementation RYLuckyNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"幸运选号";
    
    UIImage *image0 = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *image1 = [UIImage imageNamed:@"lucky_entry_light1"];
    
    self.lightImageViwe.animationImages = @[image0, image1];
    self.lightImageViwe.animationDuration = 0.5;
    [self.lightImageViwe startAnimating];
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
