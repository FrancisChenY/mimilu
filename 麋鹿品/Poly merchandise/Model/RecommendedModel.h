//
//  RecommendedModel.h
//  Poly merchandise
//
//  Created by qianfeng on 16/11/2.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "JSONModel.h"
#import "Author.h"
@protocol Author <NSObject>

@end


@interface RecommendedModel : JSONModel

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *datestr;
@property (nonatomic, strong) NSString *mini_pic_url;
@property (nonatomic, strong) Author *author;

@end
