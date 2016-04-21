//
//  RYPopMenuItemModel.h
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/17.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RYPopMenuItemModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;

- (instancetype)initPopMenuItemModelWithTitle:(NSString *)title image:(UIImage *)image;

+ (instancetype)popMenuItemModelWithTitle:(NSString *)title image:(UIImage *)image;

@end
