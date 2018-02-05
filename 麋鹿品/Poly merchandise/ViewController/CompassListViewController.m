//
//  CompassListViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CompassListViewController.h"
#import "ViewModel.h"
#import "CompassCell.h"

#define cellID @"CompassCell"

@interface CompassListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *dataList;

@end

@implementation CompassListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getData];
}

#pragma mark - Setter/Getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:cellID bundle:nil] forCellReuseIdentifier:cellID];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)getData{
    
    __weak typeof(self) weakSelf = self;
    [ViewModel compassWithCompletion:^(id result) {
        weakSelf.dataList = result;
        [weakSelf.tableView reloadData];
    } Failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CompassCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.model = self.dataList[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

@end
