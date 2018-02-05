//
//  IFreeSigleton.m
//  IFreeApp
//
//  Created by wuyiguang on 2016/10/11.
//  Copyright © 2016年 YG. All rights reserved.
//

#import "IFreeSigleton.h"
#import "AFNetworkReachabilityManager.h"

static IFreeSigleton *single = nil;

@implementation IFreeSigleton

+ (instancetype)shared
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [[self alloc] init];
    });
    return single;
}

- (void)startNetworkReachability
{
    // 网络监控
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    // 当网络状态发送改变时被调用
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        // 判断网络状态
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN: // 蜂窝数据
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi: // WiFi
                [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshUI" object:nil];
                
                break;
                
            case AFNetworkReachabilityStatusUnknown: // 状态不明确
            case AFNetworkReachabilityStatusNotReachable: // 没有网络
                [MBProgressHUD HUDWithText:@"当前网络不可用!"];
                break;
                
            default:
                break;
        }
    }];
    
    // 开始监听
    [manager startMonitoring];
    // 结束
//    [manager stopMonitoring];
}

@end
