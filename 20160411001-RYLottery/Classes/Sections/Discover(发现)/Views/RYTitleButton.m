//
//  RYTitleButton.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/19.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYTitleButton.h"

@implementation RYTitleButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.imageView.x > self.titleLabel.x) {        
        self.titleLabel.x = self.imageView.x;
        
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
    
}

@end
