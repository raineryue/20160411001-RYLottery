//
//  MBProgressHUD+RY.h
//
//  Created by Rainer on 16/4/20.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "MBProgressHUD+RY.h"

@implementation MBProgressHUD (RY)
/**
 *  显示一个带图标的文本到某个视图上
 *  参数:
 *  text:文本内容
 *  icon:图标
 *  view:需要展示所在的视图
 */
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    // 1.当需要展示所在的视图为空时，默认显示在window的根视图上
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    // 2.创建提示信息对象
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // 3.设置提示信息对象的属性
    // 3.1.设置文本
    progressHUD.labelText = text;
    // 3.2.设置图片
    progressHUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 3.3.设置模式
    progressHUD.mode = MBProgressHUDModeCustomView;
    // 3.4.设置隐藏时候从父控件中移除
    progressHUD.removeFromSuperViewOnHide = YES;
    
    // 4.设置0.7秒之后自动消失
    [progressHUD hide:YES afterDelay:0.7];
}

/**
 *  显示一个错误文本到某个视图上
 *  参数:
 *  error:文本内容
 *  view:需要展示所在的视图
 */
+ (void)showError:(NSString *)error toView:(UIView *)view {
    [self show:error icon:@"error.png" view:view];
}

/**
 *  显示一个正确文本到某个视图上
 *  参数:
 *  success:文本内容
 *  view:需要展示所在的视图
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    [self show:success icon:@"success.png" view:view];
}

/**
 *  显示一个信息文本到某个视图上
 *  参数:
 *  message:文本内容
 *  view:需要展示所在的视图
 */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    // 1.当需要展示所在的视图为空时，默认显示在window的根视图上
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    // 2.创建提示信息对象
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // 3.设置提示信息对象的属性
    // 3.1.设置文本
    progressHUD.labelText = message;
    
    // 3.2.隐藏时候从父控件中移除
    progressHUD.removeFromSuperViewOnHide = YES;
    
    // 3.3.是否需要蒙版效果
    progressHUD.dimBackground = YES;
    
    // 4.返回对象
    return progressHUD;
}

/**
 *  显示一个正确信息
 *  参数:
 *  success:文本内容
 */
+ (void)showSuccess:(NSString *)success {
    [self showSuccess:success toView:nil];
}

/**
 *  显示一个错误信息
 *  参数:
 *  error:错误信息
 */
+ (void)showError:(NSString *)error {
    [self showError:error toView:nil];
}

/**
 *  显示一个文本
 *  参数:
 *  message:文本内容
 */
+ (MBProgressHUD *)showMessage:(NSString *)message {
    return [self showMessage:message toView:nil];
}

/**
 *  隐藏某个视图上的提示框
 *  参数:
 *  view:需要展示所在的视图
 */
+ (void)hideProgressHUDForView:(UIView *)view {
    [self hideHUDForView:view animated:YES];
}

/**
 *  隐藏提示框
 */
+ (void)hideProgressHUD {
    [self hideProgressHUDForView:nil];
}

@end
