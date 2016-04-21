//
//  RYLuckyNumberView.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/19.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYLuckyNumberView.h"

@implementation RYLuckyNumberView

- (void)drawRect:(CGRect)rect {
    UIImage *backgroundImage = [UIImage imageNamed:@"luck_entry_background"];
    
    [backgroundImage drawInRect:rect];
}

@end
