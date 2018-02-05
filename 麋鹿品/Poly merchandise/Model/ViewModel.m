//
//  ViewModel.m
//  Poly merchandise
//
//  Created by qianfeng on 16/10/29.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

+ (void)homeData:(NSString *)url Completion:(Completion)completion Failure:(Failure)failure{
    
    [HttpRequest GET:url paramas:nil success:^(id responseObject) {
        NSMutableArray *homeList =[[NSMutableArray alloc] init];
        for (id obj in responseObject[@"data"][@"topic"]) {
            HomeModel *model = [HomeModel instanceWithHomeModel:obj];
            [homeList addObject:model];
        }
        completion(homeList);
        
    } progess:nil failure:^(NSError *error) {
        failure(error);
    }];
}

+ (void)bannerDataWithCompletion:(Completion)completion Failuer:(Failure)failure{
    
    [HttpRequest GET:kHomeURL1 paramas:nil success:^(id responseObject) {
        NSMutableArray *banner = [[NSMutableArray alloc] init];
        for (id obj in responseObject[@"data"][@"banner"]) {
            BannerModel *model = [[BannerModel alloc] initWithDictionary:obj error:nil];
            [banner addObject:model];
        }
        completion(banner);
        
    } progess:nil failure:^(NSError *error) {
        
        failure(error);
    }];
    
}

+ (void)hotData:(NSString *)url Completion:(Completion)completion Failure:(Failure)failure{
    [HttpRequest GET:url paramas:nil success:^(id responseObject) {
        NSMutableArray *hotList = [[NSMutableArray alloc] init];
        for (id obj in responseObject[@"data"][@"topic"]) {
            HotModel *model = [HotModel instanceWithHotModel:obj];
            [hotList addObject:model];
        }
        
        completion(hotList);
    } progess:nil failure:^(NSError *error) {
        failure(error);
    }];
    
}

+ (void)singleWithCompletion:(Completion)completion Failure:(Failure)failure
{
    NSMutableArray *singleList = [[NSMutableArray alloc] init];
    [HttpRequest GET:kCategoryURL paramas:nil success:^(id responseObject) {
        NSMutableArray *category = [[NSMutableArray alloc] init];
        for (id obj in responseObject[@"data"][@"category_list"]) {
            SingleModel *model = [[SingleModel alloc] initWithDictionary:obj error:nil];
            [category addObject:model];
        }
        [singleList addObject:category];
    } progess:nil failure:^(NSError *error) {
        failure(error);
    }];
    
    [HttpRequest GET:kRecommenedURL paramas:nil success:^(id responseObject) {
        NSMutableArray *recommened = [[NSMutableArray alloc] init];
        for (id obj in responseObject[@"data"]) {
            RecommendedModel *model = [[RecommendedModel alloc] initWithDictionary:obj error:nil];
            [recommened addObject:model];
        }
        [singleList addObject:recommened];
    } progess:nil failure:^(NSError *error) {
        
    }];
    
    completion(singleList);
}

+ (void)categoryWithCompletion:(Completion)completion Failuer:(Failure)failure
{
    NSMutableArray *category = [[NSMutableArray alloc] init];
    [HttpRequest GET:kCategoryURL paramas:nil success:^(id responseObject) {
        for (id obj in responseObject[@"data"][@"category_list"]) {
            SingleModel *model = [[SingleModel alloc] initWithDictionary:obj error:nil];
            [category addObject:model];
        }
        completion(category);
    } progess:nil failure:^(NSError *error) {
        failure(error);
    }];
}

+ (void)searchWithCompletion:(Completion)completion Failure:(Failure)failure
{
    [HttpRequest GET:kSearchSingleURL paramas:nil success:^(id responseObject) {
        NSMutableArray *searchList = [[NSMutableArray alloc] init];
        for (id obj in responseObject[@"data"]) {
            SearchSingleModel *model = [[SearchSingleModel alloc] initWithDictionary:obj error:nil];
            [searchList addObject:model];
        }
        completion(searchList);
    } progess: nil failure:^(NSError *error) {
        failure(error);
    }];
}

+ (void)ListWithCompletion:(Completion)completion Failure:(Failure)failure
{
    [HttpRequest GET:kSearchListURL paramas:nil success:^(id responseObject) {
        NSMutableArray *list = [[NSMutableArray alloc] init];
        for (id obj in responseObject[@"data"]) {
            SearchListModel *model = [[SearchListModel alloc] initWithDictionary:obj error:nil];
            [list addObject:model];
        }
        completion(list);
    } progess:nil failure:^(NSError *error) {
        failure(error);
    }];
}

+ (void)listDetailData:(NSString *)url Completion:(Completion)completion Failure:(Failure)failure
{
    [HttpRequest GET:url paramas:nil success:^(id responseObject) {
        NSMutableArray *homeList =[[NSMutableArray alloc] init];
        for (id obj in responseObject[@"data"]) {
            HomeModel *model = [HomeModel instanceWithHomeModel:obj];
            [homeList addObject:model];
        }
        completion(homeList);
        
    } progess:nil failure:^(NSError *error) {
        failure(error);
    }];
}

+ (void)singleButtonData:(NSString *)url Completion:(Completion)completion Failure:(Failure)failure
{
    [HttpRequest GET:url paramas:nil success:^(id responseObject) {
        NSMutableArray *list = [[NSMutableArray alloc] init];
        for (id obj in responseObject[@"data"][@"class_list"]) {
            SingleButtonModel *model = [[SingleButtonModel alloc] initWithDictionary:obj error:nil];
            [list addObject:model];
        }
        completion(list);
        
    } progess:nil failure:^(NSError *error) {
        failure(error);
    }];
}

+ (void)singleListData:(NSString *)url Completion:(Completion)completion Failure:(Failure)failure
{
    [HttpRequest GET:url paramas:nil success:^(id responseObject) {
        NSMutableArray *list = [[NSMutableArray alloc] init];
        for (id obj in responseObject[@"data"]) {
            SingleListModel *model = [[SingleListModel alloc] initWithDictionary:obj error:nil];
            [list addObject:model];
        }
        completion(list);
    } progess: nil failure:^(NSError *error) {
        failure(error);
    }];
}

+ (void)singleCategoryData:(NSString *)url Completion:(Completion)completion Failure:(Failure)failure
{
    [HttpRequest GET:url paramas:nil success:^(id responseObject) {
        NSMutableArray *list = [[NSMutableArray alloc] init];
        for (id obj in responseObject[@"data"]) {
            SingleCategoryModel *model = [[SingleCategoryModel alloc] initWithDictionary:obj error:nil];
            [list addObject:model];
        }
        completion(list);
        
    } progess:nil failure:^(NSError *error) {
        failure(error);
    }];
}

+ (void)compassWithCompletion:(Completion)completion Failure:(Failure)failure
{
    [HttpRequest GET:kListURL paramas:nil success:^(id responseObject) {
        NSMutableArray *list = [[NSMutableArray alloc] init];
        for (id obj in responseObject[@"data"][@"rec_groups"]) {
            CompassModel *model = [[CompassModel alloc] initWithDictionary:obj error:nil];
            [list addObject:model];
        }
        completion(list);
    } progess:nil failure:^(NSError *error) {
        failure(error);
    }];
}

@end
