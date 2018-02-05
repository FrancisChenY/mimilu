//
//  CompassHeaderView.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/1.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CompassHeaderView.h"

@implementation CompassHeaderView
{
    UILabel *_titleLabel;
    UIButton *_hotButton;
    UIButton *_upButton;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addUI];
    }
    return self;
}

- (void)addUI
{
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 40)];
    _titleLabel.text = @"原创文章";
    _titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_titleLabel];
    
    _hotButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _hotButton.frame = CGRectMake(SCREEN_W-100, 0, 50, 40);
    _hotButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_hotButton setTitle:@"最热" forState:UIControlStateNormal];
    [_hotButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_hotButton setTitle:@"最热" forState:UIControlStateDisabled];
    [_hotButton setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled ];
    [_hotButton addTarget:self action:@selector(hotButtonHandle:) forControlEvents:UIControlEventTouchUpInside];
    _hotButton.enabled = NO;

    [self addSubview:_hotButton];
    
    _upButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _upButton.frame = CGRectMake(SCREEN_W-50, 0, 50, 40);
    _upButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_upButton setTitle:@"最新" forState:UIControlStateNormal];
    [_upButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_upButton setTitle:@"最新" forState:UIControlStateDisabled];
    [_upButton setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    [_upButton addTarget:self action:@selector(hotButtonHandle:) forControlEvents:UIControlEventTouchUpInside];
    _upButton.enabled = YES;
    
    [self addSubview:_upButton];
}

- (void)hotButtonHandle:(UIButton *)sender
{
    _hotButton.enabled = !_hotButton.enabled;
    _upButton.enabled = !_upButton.enabled;
    if ([self.delegate respondsToSelector:@selector(changeDataWithSelected)]) {
        [self.delegate changeDataWithSelected];
    }
    
}

@end
