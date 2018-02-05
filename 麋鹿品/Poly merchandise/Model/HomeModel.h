//
//  HomeModel.h
//  Poly merchandise
//
//  Created by qianfeng on 16/10/29.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"

@protocol User <NSObject>

@end

@interface User : JSONModel

@property (nonatomic, strong) NSString <Optional> *nickname;
@property (nonatomic, strong) NSString <Optional> *avatar;

@end

@protocol Pics <NSObject>


@end

@interface Pics : JSONModel

@property (nonatomic, strong) NSString *url;

@end

@interface HomeModel : JSONModel

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray <Pics> *pics;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *likes;
@property (nonatomic, strong) User *user;

+ (instancetype) instanceWithHomeModel:(id)obj;

@end
