//
//  MineViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "MineViewController.h"
#import "SettingTableViewController.h"
#import "ListTableViewController.h"
#import "ZJScrollPageView.h"
#import "BaseMessageViewController.h"


@interface MineViewController () <ZJScrollPageViewDelegate>

@property (nonatomic, strong)NSArray <NSString *> *titles;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor grayColor]];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    [self addUI];
    
    [HttpRequest POST:@"http://trunk.test1198.yitiantouzijituan.com/App/User/login" paramas:@{@"mobile":@"18270837810",@"password":@"Zx123456"} success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

- (void)addUI{
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    style.showLine = YES;
    style.scrollTitle = NO;
    self.titles = @[@"单品",
                    @"清单",
                    @"发布"];
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 200, SCREEN_W, SCREEN_H-200-49) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
    [self.view addSubview:scrollPageView];
    
}

- (NSInteger)numberOfChildViewControllers
{
    return self.titles.count;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
    return NO;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index
{
    UIViewController <ZJScrollPageViewChildVcDelegate> *childVC = reuseViewController;
    if (!childVC) {
        childVC = [[BaseMessageViewController alloc] init];
    }
    return childVC;
}

- (IBAction)leftHandle:(UIBarButtonItem *)sender {
    ListTableViewController *lTVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ListTableViewController"];
    lTVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:lTVC animated:YES];
}

- (IBAction)rightHandle:(UIBarButtonItem *)sender {
    SettingTableViewController * sTVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingTableViewController"];
    sTVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sTVC animated:YES];
    
}


@end
