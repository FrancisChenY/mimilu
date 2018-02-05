//
//  SingleCellViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/10.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SingleCellViewController.h"

@interface SingleCellViewController ()

@end

@implementation SingleCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)getData
{
    __weak typeof(self)  weakSelf = self;
    [HttpRequest GET:FORMAT(kSingleListDetailURL,self.id) paramas:nil success:^(id responseObject) {
        
        [weakSelf.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:responseObject[@"data"][@"product"][@"share_url"]]]];
    } progess:nil failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
