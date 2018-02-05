//
//  CompassDetailViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CompassDetailViewController.h"

@interface CompassDetailViewController () <UIWebViewDelegate>

@property (nonatomic, strong)MBProgressHUD *hud;

@end

@implementation CompassDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _hud = [MBProgressHUD HUDIndicaterWithText:@"正在加载..."];
    [self getData];
    [_hud hide:YES afterDelay:3];
}



- (void)getData
{
    __weak typeof(self)  weakSelf = self;
    [HttpRequest GET:FORMAT(kCellURL,_id) paramas:nil success:^(id responseObject) {
        
        [weakSelf.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:responseObject[@"data"][@"share_url"]]]];
    } progess:nil failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
        _webView.delegate = self;
        _webView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_webView];
    }
    return _webView;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_hud hide:YES];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    _hud.labelText = @"加载失败！";
    [_hud hide:YES afterDelay:1.5];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
