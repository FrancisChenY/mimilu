//
//  BaseDetailViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/5.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BaseDetailViewController.h"

@interface BaseDetailViewController ()

@end

@implementation BaseDetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H-64-40);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getData
{
    __weak typeof(self) weakSelf = self;
    [ViewModel listDetailData:self.url Completion:^(id result) {
        weakSelf.dataList = result;
        [weakSelf.tableView reloadData];
    } Failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

@end
