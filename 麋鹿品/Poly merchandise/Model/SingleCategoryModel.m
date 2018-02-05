//
//  SingleCategoryModel.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/11.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SingleCategoryModel.h"

@implementation SingleCategoryModel

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"dynamic.likes":@"likes"}];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}

@end
