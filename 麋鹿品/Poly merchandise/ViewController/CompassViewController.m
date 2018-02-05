//
//  CompassViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/1.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CompassViewController.h"
#import "ViewModel.h"
#import "HotCell.h"
#import "CompassHeaderView.h"
#import "CompassDetailViewController.h"

#define CellID @"HotCell"

@interface CompassViewController () <UITableViewDelegate,UITableViewDataSource,CompassHeaderViewDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *hotList;
@property(nonatomic, strong) NSMutableArray *updataList;
@property(nonatomic, assign) BOOL isSelected;
@property(nonatomic, strong) CompassHeaderView *headerView;
@property(nonatomic, assign) int page;
@property(nonatomic, assign) int index;

@end

@implementation CompassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isSelected = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0);
    
    [self tableView];
    [self headerView];
    [self addRefresh];
    [self getUpdataList];
}

// 加载UpDataList数据
- (void)getUpdataList
{
    __weak typeof(self) weakSelf = self;
    [ViewModel hotData:FORMAT(kUpDataURL,_index) Completion:^(id result) {
        [weakSelf.updataList addObjectsFromArray:result];
    } Failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

- (void)addRefresh
{
    __weak typeof(self) weakSelf = self;
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 0;
        weakSelf.index = 0;
        [weakSelf getData];
    }];
    _tableView.mj_header.ignoredScrollViewContentInsetTop = 40;
    _tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        if (_isSelected) {
            weakSelf.page++;
        }else{
            weakSelf.index++;
        }
        [weakSelf getData];
    }];
    [_tableView.mj_header beginRefreshing];
}

- (void)getData
{
    __weak typeof(self) weakSelf = self;
    if (_isSelected) {
        [ViewModel hotData:FORMAT(kHotURL,_page) Completion:^(id result) {
            if (weakSelf.page == 0) {
                [weakSelf.hotList removeAllObjects];
            }
            
            [weakSelf.hotList addObjectsFromArray:result];
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.tableView.mj_footer endRefreshing];
            
        } Failure:^(NSError *error) {
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.tableView.mj_footer endRefreshing];
            NSLog(@"%@",error);
        }];
    }else{
        [ViewModel hotData:FORMAT(kUpDataURL,_index) Completion:^(id result) {
            if (weakSelf.index == 0) {
                [weakSelf.updataList removeAllObjects];
            }
            [weakSelf.updataList addObjectsFromArray:result];
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.tableView.mj_footer endRefreshing];
        } Failure:^(NSError *error) {
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.tableView.mj_footer endRefreshing];
            NSLog(@"%@",error);
        }];
    }
}

#pragma mark - Setter & Getter


- (NSMutableArray *)hotList
{
    if (!_hotList) {
        _hotList = [[NSMutableArray alloc] init];
    }
    return _hotList;
}

- (NSMutableArray *)updataList
{
    if (!_updataList) {
        _updataList = [[NSMutableArray alloc] init];
    }
    return _updataList;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H-49-64)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerNib:[UINib nibWithNibName:CellID bundle:nil] forCellReuseIdentifier:CellID];
        
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}

- (CompassHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[CompassHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 40)];
        _headerView.delegate = self;
        [self.view addSubview:_headerView];
    }
    return _headerView;
}

#pragma mark - UITableViewDelegate/DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_isSelected) {
        return self.hotList.count;
    }else{
        return self.updataList.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HotCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    if (_isSelected) {
        cell.model = self.hotList[indexPath.row];
    }else{
        cell.model = self.updataList[indexPath.row];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CompassDetailViewController *dVC = [[CompassDetailViewController alloc] init];
    
    if (_isSelected) {
        HotModel *model = self.hotList[indexPath.row];
        dVC.id = model.id;
    }else{
        HotModel *model = self.updataList[indexPath.row];
        dVC.id = model.id;
    }
    dVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dVC animated:YES];
}

#pragma mark - CompassHeaderViewDelegate

- (void)changeDataWithSelected
{
    _isSelected = !_isSelected;
    [self.tableView reloadData];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = self.tableView.contentOffset.y;
    _headerView.y = - offset-40;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
