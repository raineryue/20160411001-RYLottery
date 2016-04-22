//
//  RYContentView.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/15.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYContentView.h"

#define kCloseWH 20

@interface RYContentView ()

@property (nonatomic, weak) UIImageView *contentImageView;
@property (nonatomic, weak) UIButton *closeButton;

@end

@implementation RYContentView

- (instancetype)initContentViewWithContentImageName:(NSString *)imageName {
    if (self = [super init]) {
        self.contentImageView.image = [UIImage imageNamed:imageName];
    }
                
    return self;
}

+ (instancetype)contentViewWithContentImageName:(NSString *)imageName{
    return [[self alloc] initContentViewWithContentImageName:imageName];
}

- (void)show {
    [RYKeyWindow addSubview:self];
}

- (UIImageView *)contentImageView {
    if (nil == _contentImageView) {
        UIImageView *contentImageView = [[UIImageView alloc] init];
        
        contentImageView.userInteractionEnabled = YES;
        
        _contentImageView = contentImageView;
        
        [self addSubview:_contentImageView];
    }
    
    return _contentImageView;
}

- (UIButton *)closeButton {
    if (nil == _closeButton) {
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [closeButton setImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
        [closeButton addTarget:self action:@selector(closeButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _closeButton = closeButton;
        
        [self addSubview:_closeButton];
    }
    
    return _closeButton;
}

- (void)closeButtonClickAction:(UIButton *)closeButton {
    [UIView animateWithDuration:0.25 animations:^{
        CGAffineTransform transform = CGAffineTransformIdentity;
        
        transform = CGAffineTransformTranslate(transform, -self.center.x + 44, -self.center.y + 44);
        
        transform = CGAffineTransformScale(transform, 0.01, 0.01);
        
        self.transform = transform;
     } completion:^(BOOL finished) {
         [self removeFromSuperview];
         
         if (self.block) {
             self.block();
         }
     }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentImageView.frame = self.bounds;
    
    CGFloat closeX = self.frame.size.width - kCloseWH;
    self.closeButton.frame = CGRectMake(closeX, 0, kCloseWH, kCloseWH);
}

@end
