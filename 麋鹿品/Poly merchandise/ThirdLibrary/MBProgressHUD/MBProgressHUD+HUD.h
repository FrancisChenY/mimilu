//
//  MBProgressHUD+HUD.h
//  IFreeApp
//
//  Created by wuyiguang on 2016/10/11.
//  Copyright © 2016年 YG. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (HUD)

/**
 *  纯文本提示
 *
 *  @param text 提示的文字
 *
 *  @return MBProgressHUD
 */
+ (instancetype)HUDWithText:(NSString *)text;

/**
 *  带菊花提示
 *
 *  @param text 提示文字
 *
 *  @return MBProgressHUD
 */
+ (instancetype)HUDIndicaterWithText:(NSString *)text;

@end
