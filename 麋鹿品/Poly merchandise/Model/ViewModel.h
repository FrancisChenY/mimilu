//
//  ViewModel.h
//  Poly merchandise
//
//  Created by qianfeng on 16/10/29.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeModel.h"
#import "BannerModel.h"
#import "HotModel.h"
#import "SingleModel.h"
#import "RecommendedModel.h"
#import "SearchSingleModel.h"
#import "SearchListModel.h"
#import "SingleButtonModel.h"
#import "SingleListModel.h"
#import "SingleCategoryModel.h"
#import "CompassModel.h"

typedef void(^Completion)(id result);
typedef void(^Failure)(NSError *error);

@interface ViewModel : NSObject

+ (void)searchWithCompletion:(Completion)completion Failure:(Failure)failure;

+ (void)homeData:(NSString *)url Completion:(Completion)completion Failure:(Failure)failure;

+ (void)bannerDataWithCompletion:(Completion)completion Failuer:(Failure)failure;


+ (void)hotData:(NSString *)url Completion:(Completion)completion Failure:(Failure)failure;

+ (void)singleWithCompletion:(Completion)completion Failure:(Failure)failure;

+ (void)categoryWithCompletion:(Completion)completion Failuer:(Failure)failure;

+ (void)ListWithCompletion:(Completion)completion Failure:(Failure)failure;

+ (void)listDetailData:(NSString *)url Completion:(Completion)completion Failure:(Failure)failure;

+ (void)singleButtonData:(NSString *)url Completion:(Completion)completion Failure:(Failure)failure;

+ (void)singleListData:(NSString *)url Completion:(Completion)completion Failure:(Failure)failure;

+ (void)singleCategoryData:(NSString *)url Completion:(Completion)completion Failure:(Failure)failure;

+ (void)compassWithCompletion:(Completion)completion Failure:(Failure)failure;

@end
