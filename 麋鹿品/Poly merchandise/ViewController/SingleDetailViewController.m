//
//  SingleDetailViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/8.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SingleDetailViewController.h"
#import "CustomeCollectionViewLayout.h"
#import "ViewModel.h"
#import "SingleDetailCell.h"
#import "SingleCellViewController.h"

#define CellID @"SingleDetailCell"

@interface SingleDetailViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CustomeCollectionViewLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) CustomeCollectionViewLayout *customeLayout;
@property (nonatomic, assign) int index;

@end

@implementation SingleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self collectionView];
    [self addRefresh];
}

#pragma mark - Setter & Getter

- (NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [[NSMutableArray alloc] init];
    }
    return _dataList;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _customeLayout = [[CustomeCollectionViewLayout alloc] init];
        _customeLayout.layoutDelegate = self;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64) collectionViewLayout:_customeLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:CellID bundle:nil] forCellWithReuseIdentifier:CellID];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

#pragma mark - 自定义方法
- (void)addRefresh
{
    __weak typeof(self) weakSelf = self;
    _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.index = 0;
        [weakSelf getData];
    }];
    
    _collectionView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        weakSelf.index++;
        [weakSelf getData];
    }];
    [_collectionView.mj_header beginRefreshing];
    
}

- (void)getData{
    __weak typeof(self) weakSelf = self;
    [ViewModel singleListData:FORMAT(kSingleListURl,_id,_index) Completion:^(id result) {
        if (_index == 0) {
            [weakSelf.dataList removeAllObjects];
        }
        [weakSelf.dataList addObjectsFromArray:result];
        [weakSelf.collectionView reloadData];
        [weakSelf.collectionView.mj_header endRefreshing];
        [weakSelf.collectionView.mj_footer endRefreshing];
        
    } Failure:^(NSError *error) {
        [weakSelf.collectionView.mj_header endRefreshing];
        [weakSelf.collectionView.mj_footer endRefreshing];
        NSLog(@"%@",error);
    }];
    
}

#pragma mark - UICollectionViewDelegate/DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SingleDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellID forIndexPath:indexPath];
    cell.model = self.dataList[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SingleCellViewController *cVC = [[SingleCellViewController alloc] init];
    cVC.id = [self.dataList[indexPath.row] id];
    [self.navigationController pushViewController:cVC animated:YES];
}

#pragma mark - CustomeCollectionViewLayoutDelegate

- (NSInteger) numberOfColumnWithCollectionView:(UICollectionView *)collectionView
                          collectionViewLayout:( CustomeCollectionViewLayout *)collectionViewLayout{
    return 2;
}

- (CGFloat)marginOfCellWithCollectionView:(UICollectionView *)collectionView
                     collectionViewLayout:(CustomeCollectionViewLayout *)collectionViewLayout{
    return 1;
}

- (CGFloat)minHeightOfCellWithCollectionView:(UICollectionView *)collectionView
                        collectionViewLayout:(CustomeCollectionViewLayout *)collectionViewLayout{
    return 215;
}

- (CGFloat)maxHeightOfCellWithCollectionView:(UICollectionView *)collectionView
                        collectionViewLayout:(CustomeCollectionViewLayout *)collectionViewLayout{
    return 1;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
