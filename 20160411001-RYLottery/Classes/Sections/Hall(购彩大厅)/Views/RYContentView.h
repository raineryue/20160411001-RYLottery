//
//  RYContentView.h
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/15.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RYContentViewBlock)();

@interface RYContentView : UIView

@property (nonatomic, copy) RYContentViewBlock block;

- (instancetype)initContentViewWithContentImageName:(NSString *)imageName;

+ (instancetype)contentViewWithContentImageName:(NSString *)imageName;

- (void)show;

@end
