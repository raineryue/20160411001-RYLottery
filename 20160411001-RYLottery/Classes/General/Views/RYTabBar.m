//
//  RYTabBar.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/13.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYTabBar.h"
#import "RYBarButton.h"

@interface RYTabBar ()

@property (nonatomic, strong) RYBarButton *selectTabBarButton;

@end

@implementation RYTabBar

/**
 *  复写items的setter添加子控件
 */
- (void)setItems:(NSArray *)items {
    _items = items;
    
    [items enumerateObjectsUsingBlock:^(UITabBarItem *tabBarItem, NSUInteger idx, BOOL *stop) {
        RYBarButton *tabBarButton  = [RYBarButton buttonWithType:UIButtonTypeCustom];
        
        tabBarButton.tag = idx;
        
        [tabBarButton setTitle:tabBarItem.title forState:UIControlStateNormal];
        
        [tabBarButton setImage:tabBarItem.image forState:UIControlStateNormal];
        [tabBarButton setImage:tabBarItem.selectedImage forState:UIControlStateSelected];
        
        [tabBarButton addTarget:self action:@selector(tabBarButtonClickAction:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:tabBarButton];
        
        if (0 == idx) {
            [self tabBarButtonClickAction:tabBarButton];
        }
    }];
}

- (void)tabBarButtonClickAction:(RYBarButton *)tabBarButton {
    tabBarButton.selected = YES;
    
    self.selectTabBarButton.selected = NO;
    
    self.selectTabBarButton = tabBarButton;
    
    if (self.delegate) {
        [self.delegate tabBar:self didClickTabBarButton:tabBarButton.tag];
    }
}

- (RYBarButton *)selectTabBarButton {
    if (nil == _selectTabBarButton) {
        _selectTabBarButton = [RYBarButton buttonWithType:UIButtonTypeCustom];
    }
    
    return _selectTabBarButton;
}

/**
 *  重新布局子控件
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSArray *subviewArray = self.subviews;
    
    __block CGFloat tabBarButtonX = 0;
    CGFloat tabBarButtonY = 0;
    CGFloat tabBarButtonW = self.width / subviewArray.count;
    CGFloat tabBarButtonH = self.height;
    
    [subviewArray enumerateObjectsUsingBlock:^(UIButton *tabBarButton, NSUInteger idx, BOOL *stop) {
        tabBarButtonX = tabBarButtonW * idx;
        
        tabBarButton.frame = CGRectMake(tabBarButtonX, tabBarButtonY, tabBarButtonW, tabBarButtonH);
    }];
}

@end
