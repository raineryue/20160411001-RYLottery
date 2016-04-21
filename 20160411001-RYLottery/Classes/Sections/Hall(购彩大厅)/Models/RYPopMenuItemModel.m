//
//  RYPopMenuItemModel.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/17.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYPopMenuItemModel.h"

@implementation RYPopMenuItemModel

- (instancetype)initPopMenuItemModelWithTitle:(NSString *)title image:(UIImage *)image {
    if (self = [super init]) {
        self.title = title;
        self.image = image;
    }
    
    return self;
}

+ (instancetype)popMenuItemModelWithTitle:(NSString *)title image:(UIImage *)image {
    return [[RYPopMenuItemModel alloc] initPopMenuItemModelWithTitle:title image:image];
}

@end
