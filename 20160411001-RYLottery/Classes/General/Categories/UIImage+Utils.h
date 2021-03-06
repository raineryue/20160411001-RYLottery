//
//  UIImage+Utils.h
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/13.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utils)

/**
 *  根据图片名称返回一个不被渲染的原始图片
 *  参数:
 *  imageName:图片名称
 *  返回值:
 *  instancetype:当前类（一张图片）
 */
+ (instancetype)imageWithRenderingModeAlwaysOriginal:(NSString *)imageName;

/**
 *  根据图片名称，左边拉伸比例，上边拉伸比例返回一个拉伸好的图片
 *  参数:
 *  imageName:图片名称
 *  leftCapsCale:左边拉伸比例（0～1）
 *  topCapScale:上边拉伸比例 （0～1）
 *  返回值:
 *  instancetype:当前类（一张图片）
 */
+ (instancetype)imageWithStretchableImage:(NSString *)imageName leftCapScale:(CGFloat)leftCapsCale topCapScale:(CGFloat)topCapScale;

@end
