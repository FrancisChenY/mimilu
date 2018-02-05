//
//  WHViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "WHViewController.h"
#import "DSTabBar.h"
#import "PolyViewController.h"

@interface WHViewController ()<DSTabBarDelegate>

@property (nonatomic, strong) DSTabBar *customTabBar;

@end

@implementation WHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addCustomTabBar];
    self.tabBar.tintColor = [UIColor redColor];
}

- (void)addCustomTabBar
{
    _customTabBar = [[DSTabBar alloc] init];
    _customTabBar.tabBarDelegate = self;
    // 替换系统自带的tabbar
    [self setValue:_customTabBar forKey:@"tabBar"];
}

#pragma mark - DSTabBarDelegate
- (void)tabBarDidClickedPlusButton:(DSTabBar *)tabBar
{
    PolyViewController *pVC = [[PolyViewController alloc] init];
    UINavigationController *uNC = [[UINavigationController alloc] initWithRootViewController:pVC];
    [self presentViewController:uNC animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
