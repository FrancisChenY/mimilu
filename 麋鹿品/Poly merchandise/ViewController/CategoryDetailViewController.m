//
//  CategoryDetailViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/12.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CategoryDetailViewController.h"

@interface CategoryDetailViewController ()



@end

@implementation CategoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)getData
{
    __weak typeof(self)  weakSelf = self;
    [HttpRequest GET:FORMAT(kCategoryDetailURL,self.id) paramas:nil success:^(id responseObject) {
        
        [weakSelf.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:responseObject[@"data"][@"post"][@"share_url"]]]];
    } progess:nil failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
