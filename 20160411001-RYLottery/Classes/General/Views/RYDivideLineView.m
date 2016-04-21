//
//  RYDivideLineView.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/18.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYDivideLineView.h"

@implementation RYDivideLineView

- (instancetype)initDivideLineViewWithSize:(CGSize)size color:(UIColor *)color {
    if (self = [super init]) {
        self.backgroundColor = color;
        
        self.bounds = (CGRect){CGPointZero, size};
    }
    
    return self;
}

+ (instancetype)divideLineViewWithSize:(CGSize)size color:(UIColor *)color {
    return [[RYDivideLineView alloc] initDivideLineViewWithSize:size color:color];
}

@end
