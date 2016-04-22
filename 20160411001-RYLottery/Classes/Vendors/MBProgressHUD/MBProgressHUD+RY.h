//
//  MBProgressHUD+RY.h
//
//  Created by Rainer on 16/4/20.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (RY)
/**
 *  显示一个带图标的文本到某个视图上
 *  参数:
 *  text:文本内容
 *  icon:图标
 *  view:需要展示所在的视图
 */
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view;

/**
 *  显示一个错误文本到某个视图上
 *  参数:
 *  error:文本内容
 *  view:需要展示所在的视图
 */
+ (void)showError:(NSString *)error toView:(UIView *)view;

/**
 *  显示一个正确文本到某个视图上
 *  参数:
 *  success:文本内容
 *  view:需要展示所在的视图
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

/**
 *  显示一个信息文本到某个视图上
 *  参数:
 *  message:文本内容
 *  view:需要展示所在的视图
 */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

/**
 *  显示一个正确信息
 *  参数:
 *  success:文本内容
 */
+ (void)showSuccess:(NSString *)success;

/**
 *  显示一个错误信息
 *  参数:
 *  error:错误信息
 */
+ (void)showError:(NSString *)error;

/**
 *  显示一个文本
 *  参数:
 *  message:文本内容
 */
+ (MBProgressHUD *)showMessage:(NSString *)message;

/**
 *  隐藏某个视图上的提示框
 *  参数:
 *  view:需要展示所在的视图
 */
+ (void)hideProgressHUDForView:(UIView *)view;

/**
 *  隐藏提示框
 */
+ (void)hideProgressHUD;

@end
