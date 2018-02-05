//
//  PageScrollViewController.m
//  2-滚动视图
//
//  Created by wuyiguang on 2016/10/19.
//  Copyright © 2016年 YG. All rights reserved.
//

#import "PageScrollViewController.h"
#import "PageTitleView.h"
#import "BaseViewController.h"
#import "HomeDetailViewController.h"
#import "CalendarViewController.h"



#define kBannerHeight 150

@interface PageScrollViewController () <PageTitleViewDelegate, UIScrollViewDelegate,BaseViewControllerDelegate,UISearchBarDelegate>

@property (nonatomic, strong) PageTitleView *pageTitleView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) YGBanner *banner;
@property (nonatomic, strong) UIView *nView;
@property (nonatomic, strong) NSMutableArray *viewList;

@end

@implementation PageScrollViewController
{
    NSMutableArray *_viewArray;
    CGFloat _offset;
    UIButton *_right;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 不允许穿透导航
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dataRefresh) name:@"refreshUI" object:nil];
    
    [self addScrollView];
    [self addPageTitleView];
    [self getData];
//    [self tNC];
	 [self addButton];
    [self addsearchBar];
    
    
}

- (void)dataRefresh
{
    [self getData];
    for (PageScrollViewController *vc in self.viewList) {
        [vc getData];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSMutableArray *)viewList
{
    if (!_viewList) {
        _viewList = [[NSMutableArray alloc] init];
    }
    return _viewList;
}

- (void)addButton
{

    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(10, 30, 32, 32);
    [leftButton setBackgroundImage:[UIImage imageNamed:@"home_search.png"]forState:UIControlStateNormal];
    leftButton.backgroundColor = [UIColor whiteColor];
    leftButton.layer.cornerRadius = 16.0f;
    leftButton.clipsToBounds  = YES;
    [leftButton addTarget:self action:@selector(searchButtonHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(SCREEN_W-42, 30, 32, 32);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"home_list.png"]forState:UIControlStateNormal];
    rightButton.backgroundColor = [UIColor whiteColor];
    rightButton.layer.cornerRadius = 16.0f;
    rightButton.clipsToBounds  = YES;
    [rightButton addTarget:self action:@selector(listButtonHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightButton];
    
    
    
    _nView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 64)];
    _nView.backgroundColor = [UIColor whiteColor];
    _nView.alpha = 0;
    [self.view addSubview:_nView];
    
    _right = [UIButton buttonWithType:UIButtonTypeCustom];
    _right.frame = CGRectMake(SCREEN_W-42, 25, 32, 32);
    [_right setBackgroundImage:[UIImage imageNamed:@"home_list.png"]forState:UIControlStateNormal];
    [_right addTarget:self action:@selector(listButtonHandle) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor grayColor]];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
}

- (void)getData{
    __weak typeof(self) weakSelf = self;
    [ViewModel bannerDataWithCompletion:^(id result) {
        NSMutableArray *YGmodels = [[NSMutableArray alloc] init];
        for (BannerModel *model in result) {
            YGBannerModel *YGmodel = [[YGBannerModel alloc] init];
            YGmodel.title = model.title;
            YGmodel.imgUrl = model.photo;
            [YGmodels addObject:YGmodel];
        }
        [weakSelf.banner reloadYGBanner:YGmodels];
        
    } Failuer:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}


- (YGBanner *)banner{
    if (!_banner) {
        _banner = [[YGBanner alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, kBannerHeight) imageHandle:^(NSInteger index) {
        }];

        [self.view addSubview:_banner];
    }
    return _banner;
}



- (void)addsearchBar{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(-SCREEN_W, 20, SCREEN_W-52, 44)];
        _searchBar.backgroundImage = [[UIImage alloc] init];
        _searchBar.placeholder = @"搜索值得买的好物";
        UITextField *searchField = [_searchBar valueForKey:@"searchField"];
        if (searchField) {
            [searchField setBackgroundColor:[UIColor whiteColor]];
            searchField.layer.cornerRadius = 14.0f;
            searchField.layer.borderColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1].CGColor;
            searchField.layer.borderWidth = 1;
            searchField.layer.masksToBounds = YES;
        }
        _searchBar.delegate = self;
        [_nView addSubview:_searchBar];
        
    }
}

- (void)addPageTitleView
{
    _pageTitleView = [[PageTitleView alloc] initWithFrame:CGRectMake(0, kBannerHeight, kScreenWidth, 40) titles:@[@"最新", @"原创精选", @"一周最热", @"美女&穿搭", @"礼物", @"美食", @"设计感", @"文艺", @"学生党"]];
    _pageTitleView.delegate = self;

    [self.view addSubview:_pageTitleView];
}

- (void)addScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40+64, kScreenWidth, kScreenHeight-40-49-64)];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    [_scrollView setContentSize:CGSizeMake(kScreenWidth * 9, 0)];
    
    _viewArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 9; i++) {
        BaseViewController *vc = [[BaseViewController alloc] init];
        [_viewArray addObject:vc];
        vc.delegate = self;
        if (i == 0) {
            vc.url = kHomeURL1;
        }else if(i==1){
            vc.url = kHomeURL2;
        }else if (i==2){
            vc.url = kHomeURL3;
        }else if (i==3){
            vc.url = kHomeURL4;
        }else if (i==4){
            vc.url = kHomeURL5;
        }else if (i==5){
            vc.url = kHomeURL6;
        }else if(i==6){
            vc.url = kHomeURL7;
        }else if (i==7){
            vc.url = kHomeURL8;
        }else{
            vc.url = kHomeURL9;
        }
        
        // 1. 将vc添加到容器中
        [self addChildViewController:vc];
        
        // 2. 将vc.view添加到scrollView上
        [_scrollView addSubview:vc.view];
        
        // 3. 设置vc.view的frame
        vc.view.frame = CGRectMake(_scrollView.width * i, 0, _scrollView.width, _scrollView.height);
        vc.tableView.contentInset = UIEdgeInsetsMake((kBannerHeight-64), 0, 0, 0);
        vc.tableView.tag = 500+i;
        [self.viewList addObject:vc];
        // 4. 添加完成
        [vc didMoveToParentViewController:self];
    }
}

#pragma mark - UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    
    [self searchButtonHandle];
    return NO;
}

#pragma mark - EventHandle

- (void)searchButtonHandle
{

    HomeDetailViewController *hVC = [[HomeDetailViewController alloc] init];
    
    hVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:hVC animated:YES];
  
}



- (void)listButtonHandle
{
    CalendarViewController *cVC = [[CalendarViewController alloc] init];
    cVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cVC animated:YES];    
}

#pragma mark - PageTitleViewDelegate

- (void)pageTitleIndicaterViewSelected:(NSInteger)index
{
    // 将scrollView滑动到指定也
    [_scrollView setContentOffset:CGPointMake(_scrollView.width * index, 0) animated:NO];
    
}

#pragma mark - BaseViewControllerDelegate

- (void)changeFrame:(CGFloat)offset{
    
    _offset = offset;
    CGFloat p = (offset+kBannerHeight-64)/(kBannerHeight-64);
    if (p < 1) {
        self.nView.alpha = p;
        self.banner.y = -offset-kBannerHeight+64;
        self.pageTitleView.y = -offset+64;
        // 给searchBar加个动画效果
        [UIView animateWithDuration:0.3 animations:^{
            self.searchBar.x = -SCREEN_W;   
        }];
        for (UIView *myView in [self.nView subviews]) {
            if ([myView isKindOfClass:[UIButton class]]) {
                [myView removeFromSuperview];
            }
        }
    }else{
        self.banner.y = -150+64;
        self.pageTitleView.y = 64;
        self.nView.alpha = 1;
        // 给searchBar加个动画效果
        [UIView animateWithDuration:0.3 animations:^{
            self.searchBar.x = 0;
        }];
        [self.nView addSubview:_right];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_offset > 0) {
        for (BaseViewController *vc in _viewArray) {
            vc.tableView.contentOffset = CGPointMake(vc.tableView.contentOffset.x, 0);
        }
    }else {
        for (BaseViewController *vc in _viewArray) {
            vc.tableView.contentOffset = CGPointMake(vc.tableView.contentOffset.x, _offset);
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = _scrollView.contentOffset.x / _scrollView.width;
    
    [_pageTitleView selectCurrentTitleViewWithIndex:index];
    
//    [_pageTitleView moveIndicaterViewWithOffX:index];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
