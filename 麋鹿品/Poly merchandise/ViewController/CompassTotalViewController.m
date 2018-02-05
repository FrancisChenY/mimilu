//
//  CompassTotalViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/2.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CompassTotalViewController.h"
#import "CompassViewController.h"
#import "SingleViewController.h"
#import "TotalView.h"
#import "ArticleViewController.h"
#import "PolyViewController.h"
#import "CompassListViewController.h"

@interface CompassTotalViewController () <TotalViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic, strong) CompassViewController *compassVC;

@property (nonatomic, strong) SingleViewController *singleVC;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *write;

@property (nonatomic, strong) UIBarButtonItem *camera;

@end

@implementation CompassTotalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addChildViewController:self.compassVC];
    
    [self.view addSubview:self.compassVC.view];
    
    [self.compassVC didMoveToParentViewController:self];
    
    [self addUI];
}

- (void)addUI
{
    
    
    TotalView *tView = [[TotalView alloc] initWithFrame:CGRectMake(0, 0, 100, 45)];
    tView.delegate = self;
    self.navigationItem.titleView = tView;
    
    
    _write = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"compass_write.png"]style:UIBarButtonItemStylePlain target:self action:@selector(writeHandle:)];
    _write.tintColor = [UIColor redColor];
    
    _camera = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"compass_camera.png"]style:UIBarButtonItemStylePlain target:self action:@selector(cameraHandle:)];
    _camera.tintColor = [UIColor redColor];
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor grayColor]];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
}

- (void)viewDidLayoutSubviews
{
    _compassVC.view.frame = _contentView.frame;
    _singleVC.view.frame = _contentView.frame;
}

#pragma mark - Setter & Getter

- (CompassViewController *)compassVC
{
    if (!_compassVC) {
        _compassVC = [[CompassViewController alloc] init];
    }
    return _compassVC;
}

- (SingleViewController *)singleVC
{
    if (!_singleVC) {
        _singleVC = [[SingleViewController alloc] init];
    }
    return _singleVC;
}

#pragma matk - Event

- (IBAction)ListHandle:(UIBarButtonItem *)sender {
    CompassListViewController *cVC = [[CompassListViewController alloc] init];
    cVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cVC animated:YES];
    
}

- (IBAction)writeHandle:(UIBarButtonItem *)sender {
    ArticleViewController *aVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ArticleViewController"];
    [self.navigationController pushViewController:aVC animated:YES];
    
}


- (void)cameraHandle:(UIBarButtonItem *)sender
{
    PolyViewController *pVC = [[PolyViewController alloc] init];
    UINavigationController *uNC = [[UINavigationController alloc] initWithRootViewController:pVC];
    [self presentViewController:uNC animated:YES completion:nil];

}

- (void)selectedLeftItem
{
    [self.singleVC willMoveToParentViewController:nil];
    
    [self addChildViewController:self.compassVC];
    
    [self transitionFromViewController:self.singleVC toViewController:self.compassVC duration:0.25 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        
    } completion:^(BOOL finished) {
        if (finished) {
            [self.compassVC didMoveToParentViewController:self];
        }
    }];
    self.navigationItem.rightBarButtonItem = _write;
}

- (void)selectedRightItem
{
    [self.compassVC willMoveToParentViewController:nil];
    
    [self addChildViewController:self.singleVC];
    
    [self transitionFromViewController:self.compassVC toViewController:self.singleVC duration:0.25 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        
    } completion:^(BOOL finished) {
        if (finished) {
            [self.singleVC didMoveToParentViewController:self];
        }
    }];
    self.navigationItem.rightBarButtonItem = _camera;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
