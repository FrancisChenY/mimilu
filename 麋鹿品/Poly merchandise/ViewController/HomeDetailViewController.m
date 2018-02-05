//
//  HomeDetailViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "SearchSingleViewController.h"
#import "SearchListViewController.h"
#import "ZJScrollPageView.h"
#import "PYSearchViewController.h"

@interface HomeDetailViewController () <ZJScrollPageViewDelegate,PYSearchViewControllerDelegate,UISearchBarDelegate>

@property (nonatomic, strong) NSArray<NSString *> *titles;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) PYSearchViewController *pySearch;

@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];

    self.view.backgroundColor = [UIColor whiteColor];
    
    // 必须设置，如果没有设置可能导致内容显示不正常
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    // 显示滚动条
    style.showLine = YES;
    
//    style.showCover = YES;
    
    style.scrollTitle = NO;
    
    self.titles = @[@"单品",
                    @"清单"];
    
    // 初始化
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H-64) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
    [self.view addSubview:scrollPageView];
    [self searchBar];
}

#pragma mark - Setter & Getter

- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.delegate = self;
        _searchBar.placeholder = @"搜索单品、清单、帖子、用户";
        UITextField *searchField = [_searchBar valueForKey:@"searchField"];
        if (searchField) {
            [searchField setBackgroundColor:[UIColor whiteColor]];
            searchField.layer.cornerRadius = 14.0f;
            searchField.layer.borderColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1].CGColor;
            searchField.layer.borderWidth = 1;
            searchField.layer.masksToBounds = YES;
        }
        
        self.navigationItem.titleView = _searchBar;
    }
    return _searchBar;
}


- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}

- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index
{
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    if (!childVc) {
        
        if (index == 0) {
            childVc = [[SearchSingleViewController alloc] init];
        }else
        {
            childVc = [[SearchListViewController alloc] init];
        }
    }
    
    return childVc;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
#if 1
    // 1.创建热门搜索
    NSArray *hotSearchs = @[@"手机壳",@"围巾",@"礼物",@"外卖",@"耳机",@"充电宝",@"杯子",@"面膜",@"保温杯",@"手表",@"手套",@"宿舍",@"睡衣",@"拖鞋",@"护手霜"];
    // 2.创建控制器
    _pySearch = [PYSearchViewController searchViewControllerWithHotSearches:hotSearchs searchBarPlaceholder:@"搜索单品、清单、帖子、用户" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        
    }];
    _pySearch.hotSearchStyle = PYHotSearchStyleARCBorderTag;
    _pySearch.searchHistoryStyle = PYSearchHistoryStyleARCBorderTag;
    _pySearch.delegate = self;
    UITextField *searchField = [_pySearch.searchBar valueForKey:@"searchField"];
    if (searchField) {
        [searchField setBackgroundColor:[UIColor whiteColor]];
        searchField.layer.cornerRadius = 14.0f;
        searchField.layer.borderColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1].CGColor;
        searchField.layer.borderWidth = 1;
        searchField.layer.masksToBounds = YES;
    }

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:_pySearch];
    [self presentViewController:nav animated:NO completion:nil];
    
#endif
//    self.searchBar.showsCancelButton = YES;
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
