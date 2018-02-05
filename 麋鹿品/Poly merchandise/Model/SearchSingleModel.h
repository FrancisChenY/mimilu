//
//  SearchSingleModel.h
//  Poly merchandise
//
//  Created by qianfeng on 16/11/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"

@protocol Subclass <NSObject>

@end

@interface Subclass : JSONModel

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;

@end

@interface SearchSingleModel : JSONModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray <Subclass> *subclass;

@end
