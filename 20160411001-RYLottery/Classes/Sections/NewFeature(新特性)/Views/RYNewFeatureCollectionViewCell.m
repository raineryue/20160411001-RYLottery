//
//  RYNewFeatureCollectionViewCell.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/20.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYNewFeatureCollectionViewCell.h"

@interface RYNewFeatureCollectionViewCell ()

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation RYNewFeatureCollectionViewCell

- (UIImageView *)imageView {
    if (nil == _imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        
        imageView.frame = self.bounds;
        
        _imageView = imageView;
        
        [self.contentView addSubview:imageView];
    }
    
    return _imageView;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    
    self.imageView.image = image;
}

@end
