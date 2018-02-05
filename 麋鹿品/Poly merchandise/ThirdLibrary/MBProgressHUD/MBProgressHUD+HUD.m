//
//  MBProgressHUD+HUD.m
//  IFreeApp
//
//  Created by wuyiguang on 2016/10/11.
//  Copyright © 2016年 YG. All rights reserved.
//

#import "MBProgressHUD+HUD.h"

@implementation MBProgressHUD (HUD)

+ (instancetype)HUDWithText:(NSString *)text
{
    // 创建HUD提示并在window上显示
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kAppDel.window animated:YES];
    // 提示类型
    // 纯文本提示
    hud.mode = MBProgressHUDModeText;
    // 提示的文字
    hud.labelText = text;
    // 显示阴影遮盖层
//    hud.dimBackground = YES;
    // N秒之后自动隐藏
    [hud hide:YES afterDelay:1.5];
    // 当隐藏后将hud从父视图上移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 设置提示框背景颜色
//    hud.color = [UIColor redColor];
    
    // 修改偏移量，默认在中间
//    hud.yOffset = 200;
    
    // 正方形
//    hud.square = YES;
    
    // 设置进度
//    hud.progress
    
    return hud;
}

+ (instancetype)HUDIndicaterWithText:(NSString *)text
{
    // 创建HUD提示并在window上显示
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kAppDel.window animated:YES];
    // 提示类型
    // 带菊花提示
    hud.mode = MBProgressHUDModeIndeterminate;
    // 提示的文字
    hud.labelText = text;
    // 当隐藏后将hud从父视图上移除
    hud.removeFromSuperViewOnHide = YES;
    
//    hud.hidden
    
    return hud;
}

@end
