//
//  HotModel.h
//  Poly merchandise
//
//  Created by qianfeng on 16/11/1.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"
#import "HomeModel.h"

@protocol Pic <NSObject>

@end

@interface Pic : JSONModel

@property (nonatomic, strong) NSString *url;

@end

@interface HotModel : JSONModel

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *views;
@property (nonatomic, strong) NSString *order_time_str;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSArray <Pic> *pics;

+ (instancetype)instanceWithHotModel:(id)obj;

@end
