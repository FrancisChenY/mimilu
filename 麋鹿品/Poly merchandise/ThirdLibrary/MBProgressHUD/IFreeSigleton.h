//
//  IFreeSigleton.h
//  IFreeApp
//
//  Created by wuyiguang on 2016/10/11.
//  Copyright © 2016年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IFreeSigleton : NSObject

+ (instancetype)shared;

/**
 *  监听网络状态
 */
- (void)startNetworkReachability;

@end
