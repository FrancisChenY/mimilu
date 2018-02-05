//
//  SingleListModel.h
//  Poly merchandise
//
//  Created by qianfeng on 16/11/9.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"

@interface SingleListModel : JSONModel

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *item_id;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *likes;

@end
