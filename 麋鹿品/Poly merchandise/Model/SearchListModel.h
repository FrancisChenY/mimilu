//
//  SearchListModel.h
//  Poly merchandise
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"

@interface SearchListModel : JSONModel

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *en_name;
@property (nonatomic, strong) NSString *icon;

@end
