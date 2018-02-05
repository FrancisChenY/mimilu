//
//  Author.h
//  Poly merchandise
//
//  Created by qianfeng on 16/11/11.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"

@interface Author : JSONModel

@property (nonatomic, strong) NSString *user_id;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *avatar;

@end
