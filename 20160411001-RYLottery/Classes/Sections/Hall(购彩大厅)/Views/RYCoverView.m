//
//  RYCoverView.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/15.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYCoverView.h"
#import "RYContentView.h"

@implementation RYCoverView

+ (void)show {
    // 弹出蒙板
    RYCoverView *coverView = [[RYCoverView alloc] initWithFrame:RYScreenBounds];
    
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.5;
    
    [RYKeyWindow addSubview:coverView];
    
    // 弹出菜单
    RYContentView *contentView = [RYContentView contentViewWithContentImageName:@"xiaopingguo"];
    
    CGFloat contentViewWHh = 200;
    CGFloat contentViewX = (RYScreenBounds.size.width - contentViewWHh) * 0.5;
    CGFloat contentViewY = (RYScreenBounds.size.height - contentViewWHh) * 0.5;
    contentView.frame = CGRectMake(contentViewX, contentViewY, contentViewWHh, contentViewWHh);
    
    contentView.block = ^{
        [coverView dismiss];
    };
    
    [contentView show];
}

+ (void)dismiss {
    [RYCoverView dismiss];
}

- (void)dismiss {
    self.alpha = 1.0;
    [self removeFromSuperview];
}

@end
