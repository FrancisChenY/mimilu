//
//  HotModel.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/1.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "HotModel.h"

@implementation Pic

@end

@implementation HotModel


+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

+ (instancetype)instanceWithHotModel:(id)obj
{
    HotModel *model = [[HotModel alloc] initWithDictionary:obj error:nil];
    return model;
}

@end
