//
//  AppMacro.h
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/15.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

#define RYBundleShortVersion @"CFBundleShortVersionString"

#define RYScreenBounds [UIScreen mainScreen].bounds
#define RYScreenWidth RYScreenBounds.size.width
#define RYScreenHeight RYScreenBounds.size.height

#define RYKeyWindow [UIApplication sharedApplication].keyWindow

#define RYColor(r, g, b) [UIColor colorWithRed:r / 255.0 green:g /255.0 blue:b / 255.0 alpha:1]

#endif /* AppMacro_h */
