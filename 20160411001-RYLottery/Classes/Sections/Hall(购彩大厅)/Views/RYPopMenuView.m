//
//  RYPopMenuView.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/17.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYPopMenuView.h"
#import "RYDivideLineView.h"

// 每行总列数
#define RYMenuColCount 3

// 按钮的宽高
#define RYButtonItemWH RYScreenWidth / RYMenuColCount

@interface RYPopMenuView ()

@property (nonatomic, strong) NSArray<RYPopMenuItemModel *> *popMenuItemArray;
@property (nonatomic, strong) NSMutableArray<UIButton *> *popMenuButtonItemArray;
@property (nonatomic, strong) NSMutableArray<RYDivideLineView *> *verticalDivideLineViewArray;
@property (nonatomic, strong) NSMutableArray<RYDivideLineView *> *horizontalDivideLineViewArray;

@end

@implementation RYPopMenuView

+ (instancetype)showPopMenuViewInView:(UIView *)view popMenuItem:(NSArray<RYPopMenuItemModel *> *)popMenuItemArray origin:(CGPoint)origin{
    // 1.算出一共多少行
    CGFloat rowCount = (popMenuItemArray.count - 1) / RYMenuColCount + 1;
    
    // 2.显示弹出菜单
    CGFloat popMenuViewW = RYScreenWidth;
    CGFloat popMenuVIewH = RYButtonItemWH * rowCount;
    
    RYPopMenuView *popMenuView = [[RYPopMenuView alloc] initWithFrame:CGRectMake(origin.x, origin.y, popMenuViewW, popMenuVIewH)];
    
    popMenuView.backgroundColor = [UIColor blackColor];
    popMenuView.popMenuItemArray = popMenuItemArray;
    
    // 背景视图
    UIView *backgroundView = [[UIView alloc] initWithFrame:popMenuView.frame];
    
    backgroundView.backgroundColor = popMenuView.backgroundColor;
    
    [view addSubview:backgroundView];
    
    [view addSubview:popMenuView];
    
    // 4.添加子按钮
    [popMenuView setUpSubButtonItems];
    
    // 5.添加分割线
    [popMenuView setUpDivideLines];
    
    // 6.添加动画效果
    popMenuView.transform = CGAffineTransformMakeTranslation(0, -popMenuView.height);
    
    [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        popMenuView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
    
    return popMenuView;
}

/**
 *  隐藏视图
 */
- (void)dismissPopMenuView {
    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -self.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)setUpSubButtonItems {
    [self.popMenuItemArray enumerateObjectsUsingBlock:^(RYPopMenuItemModel *obj, NSUInteger idx, BOOL *stop) {
        UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [itemButton setTitle:obj.title forState:UIControlStateNormal];
        [itemButton setImage:obj.image forState:UIControlStateNormal];
        
        [self addSubview:itemButton];
        [self.popMenuButtonItemArray addObject:itemButton];
    }];
}

- (void)setUpDivideLines {
    // 1.添加纵向分割线：verticalCount = 总列数 - 1;
    // 计算纵向分割线的总数
    CGFloat verticalCount = RYMenuColCount - 1;

    for (int i = 0; i < verticalCount; i++) {
        CGSize size = CGSizeMake(1, self.height);
        
        RYDivideLineView *divideLineView = [RYDivideLineView divideLineViewWithSize:size color:[UIColor whiteColor]];

        [self addSubview:divideLineView];
        [self.verticalDivideLineViewArray addObject:divideLineView];
    }
    
    // 2.添加横向分割线：horizontalCount = 总行数 - 1
    // 计算横向分割线的总数
    CGFloat horizontalCount = (self.popMenuItemArray.count - 1) / RYMenuColCount;
    
    for (int i = 0; i < horizontalCount; i++) {
        CGSize size = CGSizeMake(self.width, 1);
        
        RYDivideLineView *divideLineView = [RYDivideLineView divideLineViewWithSize:size color:[UIColor whiteColor]];
        
        [self addSubview:divideLineView];
        [self.horizontalDivideLineViewArray addObject:divideLineView];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 1.布局所有的按钮子控件
    __block CGFloat itemButtonX = 0;
    __block CGFloat itemButtonY = 0;
    
    [self.popMenuButtonItemArray enumerateObjectsUsingBlock:^(UIButton *itemButton, NSUInteger idx, BOOL *stop) {
        NSInteger currentCol = idx % RYMenuColCount;
        NSInteger currentRow = idx / RYMenuColCount;

        itemButtonX = currentCol * RYButtonItemWH;
        itemButtonY = currentRow * RYButtonItemWH;

        itemButton.frame = CGRectMake(itemButtonX, itemButtonY, RYButtonItemWH, RYButtonItemWH);
    }];
    
    // 2.布局垂直分割线
    [self.verticalDivideLineViewArray enumerateObjectsUsingBlock:^(RYDivideLineView *divideLineView, NSUInteger idx, BOOL *stop) {
        CGRect frame = divideLineView.frame;
        
        frame.origin.x = RYButtonItemWH * (idx + 1);
        frame.origin.y = 0;
        
        divideLineView.frame = frame;
    }];
    
    // 3.布局水平分割线
    [self.horizontalDivideLineViewArray enumerateObjectsUsingBlock:^(RYDivideLineView *divideLineView, NSUInteger idx, BOOL *stop) {
        CGRect frame = divideLineView.frame;
        
        frame.origin.x = 0;
        frame.origin.y = RYButtonItemWH * (idx + 1);
        
        divideLineView.frame = frame;
    }];
}

#pragma mark - 属性懒加载

- (NSMutableArray *)popMenuButtonItemArray {
    if (nil == _popMenuButtonItemArray) {
        _popMenuButtonItemArray = [NSMutableArray array];
    }
    
    return _popMenuButtonItemArray;
}

- (NSMutableArray *)verticalDivideLineViewArray {
    if (nil == _verticalDivideLineViewArray) {
        _verticalDivideLineViewArray = [NSMutableArray array];
    }
    
    return _verticalDivideLineViewArray;
}

- (NSMutableArray *)horizontalDivideLineViewArray {
    if (nil == _horizontalDivideLineViewArray) {
        _horizontalDivideLineViewArray = [NSMutableArray array];
    }
    
    return _horizontalDivideLineViewArray;
}

@end
