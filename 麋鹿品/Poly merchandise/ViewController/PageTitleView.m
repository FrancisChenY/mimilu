//
//  PageTitleView.m
//  2-滚动视图
//
//  Created by wuyiguang on 2016/10/19.
//  Copyright © 2016年 YG. All rights reserved.
//

#import "PageTitleView.h"

#define kTag    666

@interface PageTitleView ()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *indicaterView;

@end

@implementation PageTitleView
{
    // 当前显示按钮的下标
    NSInteger _currIndex;
}

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles
{
    if (self = [super initWithFrame:frame]) {
        
        [self createUI:titles];
    }
    return self;
}

- (void)createUI:(NSArray *)titles
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView];
    
    [self.scrollView setContentSize:CGSizeMake(titles.count * kButtonWidth+90, self.height)];
    
    
    // 创建按钮
    for (int i = 0; i < titles.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        if (i == 0) {
            
            btn.frame = CGRectMake(kButtonWidth * i, 0, kButtonWidth, self.height);
        }else if(i == 1){
            btn.frame = CGRectMake(kButtonWidth * i, 0, kButtonWidth+30, self.height);
        }else if ( i == 2 || i == 3){
            btn.frame = CGRectMake((kButtonWidth+30) * i-30, 0, kButtonWidth+30, self.height);
        }else{
            btn.frame = CGRectMake(kButtonWidth * i + 90, 0, kButtonWidth, self.height);
        }
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [self.scrollView addSubview:btn];
        
        [btn addTarget:self action:@selector(titleHandle:) forControlEvents:UIControlEventTouchUpInside];

        btn.tag = kTag + i;
        
        if (i == 0) {
            btn.enabled = NO;
            _currIndex = i;
        }
    }
    
    // 滑块
    _indicaterView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-2, kButtonWidth, 2)];
    _indicaterView.backgroundColor = [UIColor redColor];
    [_scrollView addSubview:_indicaterView];
}

#pragma mark - Event Handles

- (void)titleHandle:(UIButton *)sender
{
    [self selectCurrentTitleViewWithIndex:sender.tag - kTag];
    
    if ([_delegate respondsToSelector:@selector(pageTitleIndicaterViewSelected:)]) {
        [_delegate pageTitleIndicaterViewSelected:_currIndex];
    }
}

#pragma mark - Helper Methods

- (void)moveIndicaterViewWithOffX:(CGFloat)x
{
    // 计算滑动的偏移量
//    CGFloat offsetX = _scrollView.contentSize.width * x  ;
//    _indicaterView.x = offsetX;
    UIButton *button = (UIButton *)[self.scrollView viewWithTag:kTag + x];
    _indicaterView.center = CGPointMake(button.center.x, _indicaterView.center.y);
    
    
    
    // 设置scrollView的显示可见区域
    // setContentSize的值不能为0
//    [_scrollView scrollRectToVisible:_indicaterView.frame animated:YES];
    
}

- (void)selectCurrentTitleViewWithIndex:(NSInteger)index
{
    // 获取之前的选中的按钮
    UIButton *oldBtn = (UIButton *)[self.scrollView viewWithTag:kTag + _currIndex];
    oldBtn.enabled = YES;

    // 获取当前需要选中的按钮
    UIButton *curBtn = (UIButton *)[self.scrollView viewWithTag:kTag + index];
    // 将当前设置为选中
    curBtn.enabled = NO;
    
        
    // 记录
    _currIndex = index;
    
    
    
    // 将当前选中标题居中
    CGFloat offsetX = curBtn.center.x - kScreenWidth / 2;
    // 左边
    if (offsetX < 0) offsetX = 0;
    
    // 右边
    CGFloat maxOffsetX = _scrollView.contentSize.width - _scrollView.width;
    if (offsetX > maxOffsetX) offsetX = maxOffsetX;
    
    [_scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    [self moveIndicaterViewWithOffX:index];
}

@end
