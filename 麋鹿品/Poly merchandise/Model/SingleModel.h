//
//  SingleModel.h
//  Poly merchandise
//
//  Created by qianfeng on 16/11/2.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"

@interface SingleModel : JSONModel

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *en_name;
@property (nonatomic, strong) NSString *pic;

@end
