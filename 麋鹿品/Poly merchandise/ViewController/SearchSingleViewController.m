//
//  SearchSingleViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SearchSingleViewController.h"
#import "ViewModel.h"
#import "SearchSingleCell.h"
#import "SingleDetailViewController.h"
#import "SingleTableViewCell.h"

#define CellName @"SearchSingleCell"
#define CellID @"SingleTableViewCell"

@interface SearchSingleViewController () <UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *dataList;

@end

@implementation SearchSingleViewController
{
    NSIndexPath *_indexpath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    [self getData];
}

#pragma mark - Setter & Getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 80, SCREEN_H-64-40)];
        _tableView.delegate= self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView registerNib:[UINib nibWithNibName:CellID bundle:nil] forCellReuseIdentifier:CellID];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(80, 0, SCREEN_W-80, SCREEN_H-64-40) collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerNib:[UINib nibWithNibName:CellName bundle:nil] forCellWithReuseIdentifier:CellName];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (void)getData
{
    __weak typeof(self) weakSelf = self;
    [ViewModel searchWithCompletion:^(id result) {
        weakSelf.dataList = result;
        [weakSelf.tableView reloadData];
        [weakSelf.collectionView reloadData];
    } Failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - UITableViewDelegate/DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SingleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    
    cell.name = [self.dataList[indexPath.row] name];
    if (indexPath.row == 0) {
        cell.selected = YES;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _indexpath = indexPath;
    [self.collectionView reloadData];
}


#pragma mark - UICollectionViewDelegate/DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    SearchSingleModel *model = self.dataList[_indexpath.row];
    return model.subclass.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SearchSingleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellName forIndexPath:indexPath];
    SearchSingleModel *model = self.dataList[_indexpath.row];
    cell.model = model.subclass[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (_collectionView.width - 40) / 3;
    return CGSizeMake(width, width+20);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SingleDetailViewController *sVC = [[SingleDetailViewController alloc] init];
    SearchSingleModel *model = self.dataList[_indexpath.row];
    sVC.id = [model.subclass[indexPath.row] id];
    sVC.title = [model.subclass[indexPath.row] name];
    [self.navigationController pushViewController:sVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
