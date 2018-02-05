//
//  TotalView.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/2.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "TotalView.h"

#define kButtonWidth 50

@implementation TotalView
{
    
    UIButton *_leftButton;
    UIButton *_rightButton;
    UIView *_lineView;
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
    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftButton.frame = CGRectMake(0, 0, kButtonWidth, self.height);
//    _leftButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_leftButton setTitle:@"清单" forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_leftButton setTitle:@"清单" forState:UIControlStateDisabled];
    [_leftButton setTitleColor:[UIColor redColor] forState:UIControlStateDisabled ];
    [_leftButton addTarget:self action:@selector(leftButtonHandle:) forControlEvents:UIControlEventTouchUpInside];
    _leftButton.enabled = NO;
    [self addSubview:_leftButton];
    
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame = CGRectMake(kButtonWidth, 0, kButtonWidth, self.height);
//    _rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_rightButton setTitle:@"单品" forState:UIControlStateNormal];
    [_rightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_rightButton setTitle:@"单品" forState:UIControlStateDisabled];
    [_rightButton setTitleColor:[UIColor redColor] forState:UIControlStateDisabled ];
    [_rightButton addTarget:self action:@selector(rightButtonHandle:) forControlEvents:UIControlEventTouchUpInside];
    _rightButton.enabled = YES;
    [self addSubview:_rightButton];
    
    _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-2, 35, 2)];
    _lineView.center = CGPointMake(_leftButton.center.x, _lineView.center.y) ;
    _lineView.backgroundColor = [UIColor redColor];
    [self addSubview:_lineView];
}

- (void)leftButtonHandle:(UIButton *)leftButton
{
    _leftButton.enabled = !_leftButton.enabled;
    _rightButton.enabled = !_rightButton.enabled;
    [UIView animateWithDuration:0.5 animations:^{
        _lineView.center = CGPointMake(_leftButton.center.x, _lineView.center.y);
    }];
    if ([self.delegate respondsToSelector:@selector(selectedLeftItem)]) {
        [self.delegate selectedLeftItem];
    }
    
}

- (void)rightButtonHandle:(UIButton *)rightButton
{
    _leftButton.enabled = !_leftButton.enabled;
    _rightButton.enabled = !_rightButton.enabled;
    [UIView animateWithDuration:0.5 animations:^{
        _lineView.center = CGPointMake(_rightButton.center.x, _lineView.center.y);
    }];
    if ([self.delegate respondsToSelector:@selector(selectedRightItem)]) {
        [self.delegate selectedRightItem];
    }
}
@end
