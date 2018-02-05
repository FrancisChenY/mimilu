//
//  SingleCategoryViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/11.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SingleCategoryViewController.h"
#import "CustomeCollectionViewLayout.h"
#import "ViewModel.h"
#import "SingleCategoryCell.h"
#import "CategoryDetailViewController.h"

#define CellID @"SingleCategoryCell"

@interface SingleCategoryViewController () <UICollectionViewDelegate,UICollectionViewDataSource,CustomeCollectionViewLayoutDelegate>

@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) UICollectionView  *collectionView;
@property (nonatomic, assign) int index;


@end

@implementation SingleCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    [self collectionView];
    [self addRefresh];
}

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
    [ViewModel singleCategoryData:[NSString stringWithFormat:kCategoryCellURL,_id,_index] Completion:^(id result) {
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

#pragma mark - Setter&Getter

- (NSMutableArray *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return  _dataList;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        CustomeCollectionViewLayout *layout = [[CustomeCollectionViewLayout alloc] init];
        layout.layoutDelegate = self;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H-64) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:CellID bundle:nil] forCellWithReuseIdentifier:CellID];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDelegate/DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SingleCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellID forIndexPath:indexPath];
    cell.model = self.dataList[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryDetailViewController *cVC = [[CategoryDetailViewController alloc] init];
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
    return 5;
}

- (CGFloat)minHeightOfCellWithCollectionView:(UICollectionView *)collectionView
                        collectionViewLayout:(CustomeCollectionViewLayout *)collectionViewLayout{
    return 230;
}

- (CGFloat)maxHeightOfCellWithCollectionView:(UICollectionView *)collectionView
                        collectionViewLayout:(CustomeCollectionViewLayout *)collectionViewLayout{
    return 20;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
