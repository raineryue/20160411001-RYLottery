//
//  RYPopMenuView.h
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/17.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYPopMenuItemModel.h"

@interface RYPopMenuView : UIView

+ (instancetype)showPopMenuViewInView:(UIView *)view popMenuItem:(NSArray<RYPopMenuItemModel *> *)popMenuItemArray origin:(CGPoint)origin;

- (void)dismissPopMenuView;

@end
