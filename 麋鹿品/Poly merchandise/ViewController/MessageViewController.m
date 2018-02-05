//
//  MessageViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "MessageViewController.h"
#import "ZJScrollPageView.h"
#import "BaseMessageViewController.h"

@interface MessageViewController () <ZJScrollPageViewDelegate>

@property (nonatomic, strong) NSArray *titles;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
//    style.showLine = YES;
    style.showCover = YES;
    style.scrollTitle = NO;
    self.titles = @[@"喜欢/收藏",
                    @"评论",
                    @"通知"];
    
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H-64) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
    [self.view addSubview:scrollPageView];
    
}

#pragma mark - Setter/Getter

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
    return YES;
}

- (NSInteger)numberOfChildViewControllers
{
    return self.titles.count;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index
{
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    if (!childVc) {
        childVc = [[BaseMessageViewController alloc] init];
    }
    
    return childVc;
}


@end
