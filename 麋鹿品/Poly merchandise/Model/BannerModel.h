//
//  BannerModel.h
//  Poly merchandise
//
//  Created by qianfeng on 16/10/31.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"

@interface BannerModel : JSONModel

@property (nonatomic, strong) NSString *photo;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *extend;

@end
