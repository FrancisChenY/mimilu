//
//  SearchListViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SearchListViewController.h"
#import "ViewModel.h"
#import "SearchListCell.h"
#import "ListDetailViewController.h"

#define cellID @"SearchListCell"

@interface SearchListViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *colletionView;
@property (nonatomic, strong) NSArray *dataList;

@end

@implementation SearchListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    [self getData];
}

- (void)getData
{
    __weak typeof(self) weakSelf = self;
    [ViewModel ListWithCompletion:^(id result) {
        weakSelf.dataList = result;
        [weakSelf.colletionView reloadData];
    } Failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - Setter & Getter

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UICollectionView *)colletionView
{
    if (!_colletionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _colletionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H-64-40) collectionViewLayout:layout];
        _colletionView.delegate = self;
        _colletionView.dataSource = self;
        _colletionView.backgroundColor = [UIColor whiteColor];
        _colletionView.showsVerticalScrollIndicator = NO;
        [_colletionView registerNib:[UINib nibWithNibName:cellID bundle:nil] forCellWithReuseIdentifier:cellID];
        [self.view addSubview:_colletionView];
    }
    return _colletionView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SearchListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.model = self.dataList[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (_colletionView.width-50)/3;
    return CGSizeMake(width, width+50);
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

    ListDetailViewController *vc = [[ListDetailViewController alloc] init];
    vc.id = [self.dataList[indexPath.row] id];
    vc.title = [self.dataList[indexPath.row] name];
    [self.navigationController pushViewController:vc animated:YES];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
