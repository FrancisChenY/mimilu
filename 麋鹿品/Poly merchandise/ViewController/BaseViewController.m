//
//  BaseViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/10/29.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "BaseViewController.h"
#import "CompassDetailViewController.h"
#import "HomeCell.h"

#define CellHome @"HomeCell"

@interface BaseViewController () <UITableViewDelegate,UITableViewDataSource>


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self getData];
}

- (void)getData{
    
    __weak typeof(self) weakSelf = self;
    [ViewModel homeData:_url Completion:^(id result) {
        weakSelf.dataList = result;
        [weakSelf.tableView reloadData];
        
    } Failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}



#pragma mark - Setter & Getter

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offset = self.tableView.contentOffset.y;
    if ([self.delegate respondsToSelector:@selector(changeFrame:)]) {
        [self.delegate changeFrame:offset];
    }
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H-49-64-40)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerNib:[UINib nibWithNibName:CellHome bundle:nil] forCellReuseIdentifier:CellHome];
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate/dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellHome forIndexPath:indexPath];
    
    cell.model = self.dataList[indexPath.row];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CompassDetailViewController *cVC = [[CompassDetailViewController alloc] init];
    cVC.id = [self.dataList[indexPath.row] id];
    
    cVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
