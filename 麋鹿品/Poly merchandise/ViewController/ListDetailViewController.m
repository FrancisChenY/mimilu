//
//  ListDetailViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/5.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "ListDetailViewController.h"
#import "ZJScrollPageView.h"
#import "BaseDetailViewController.h"

@interface ListDetailViewController () <ZJScrollPageViewDelegate>

@property (nonatomic, strong)NSArray <NSString *> *titles;

@end

@implementation ListDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    
    style.showLine = YES;
    style.scrollTitle = NO;
    self.titles = @[@"最新",
                    @"最热"];
    
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H-64) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
    
    [self.view addSubview:scrollPageView];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
    return NO;
}

- (NSInteger)numberOfChildViewControllers
{
    return self.titles.count;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index
{
    UIViewController <ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    if (index == 0) {
        BaseViewController *vc = [[BaseDetailViewController alloc] init];
        vc.url = FORMAT(kListUpdataURL,_id);
        
        childVc = vc;
    
    }else{
        BaseViewController *vc = [[BaseDetailViewController alloc] init];
        vc.url = FORMAT(kListHotURL,_id);
        childVc = vc;
    }
    return childVc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
