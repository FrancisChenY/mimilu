//
//  PageTitleView.h
//  2-滚动视图
//
//  Created by wuyiguang on 2016/10/19.
//  Copyright © 2016年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Frame.h"

#define kButtonWidth  70

#define kScreenWidth     ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight    ([UIScreen mainScreen].bounds.size.height)


@protocol PageTitleViewDelegate <NSObject>

- (void)pageTitleIndicaterViewSelected:(NSInteger)index;

@end

@interface PageTitleView : UIView

@property (nonatomic, weak) id <PageTitleViewDelegate> delegate;

/**
 *  初始化
 *
 *  @param frame  <#frame description#>
 *  @param titles 标题数组
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

/**
 *  选中当前标题
 *
 *  @param index 标题的下标
 */
- (void)selectCurrentTitleViewWithIndex:(NSInteger)index;

@end
