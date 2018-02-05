//
//  YGMacro.h
//  YGMacro
//
//  Created by wuyiguang on 14/09/11.
//  Copyright (c) 2014年 YG. All rights reserved.
//

#ifndef ___YGMacro_h
#define ___YGMacro_h

#import "AppDelegate.h"


#define kDataDB     ([NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"data.db"])


/**
 * 默认图片
 */
#define kDefaultImage    ([UIImage imageNamed:@"appproduct_appdefault"])

/**
 * 获取AppDelegate
 */
#define kAppDel ((AppDelegate *)[UIApplication sharedApplication].delegate)

/**
 * 格式化字符串
 */
#define FORMAT(fmt, ...) [NSString stringWithFormat:(fmt), ##__VA_ARGS__]

/**
 * 获取设备的宽高
 */
#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

/**
 * 获取物理屏幕的bounds
 */
#define SCREEN_BOUNDS ([UIScreen mainScreen].bounds)

/**
 * 判断是否为iPad设备
 */
#define ISPAD ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad))

/**
 * 判断是否为iPhone设备
 */
#define ISIPHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

//是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

/**
 * 获取当前版本号，整数
 */
#define System_Version(version) ([[[UIDevice currentDevice] systemVersion] intValue] >= version)

/**
 * 设置RGB颜色(0x??????)，16进制
 */
#define COLOR_RGB16(rgbValue) ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0])

/**
 * 设置RGB颜色(rgb)
 */
#define COLORRGB(r, g, b) ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0])

/**
 * 获取Library/Caches路径
 */
#define CACHEPATH ([NSString stringWithFormat:@"%@/Library/Caches", NSHomeDirectory()])

/**
 * 这是一个消除performSelector警告的宏
 */
#define clearWarning_preformSel(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

/**
 * 这是一个强制消除警告的宏
 */
#define clearWarning_force(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-bridge-casts-disallowed-in-nonarc\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

/**
 * 回到主线程同步执行
 */
#define sync_main_safe(block) \
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

/**
 * 回到主线程异步执行
 */
#define async_main_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

/**
 * 重写NSLog，Debug模式下打印类名和当前行数
 * 防止release版本中含有多余的打印信息
 */
#if DEBUG
#define NSLog(fmt, ...) fprintf(stderr,"[%s %d]%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:fmt, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif


#endif

