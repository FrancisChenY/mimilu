//
//  HomeModel.m
//  Poly merchandise
//
//  Created by qianfeng on 16/10/29.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "HomeModel.h"

@implementation User

@end

@implementation Pics

@end

@implementation HomeModel

+ (instancetype)instanceWithHomeModel:(id)obj
{
    HomeModel *model = [[HomeModel alloc] initWithDictionary:obj error:nil];
    return model;
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

@end
