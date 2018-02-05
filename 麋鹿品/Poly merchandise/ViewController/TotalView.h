//
//  TotalView.h
//  Poly merchandise
//
//  Created by qianfeng on 16/11/2.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TotalViewDelegate <NSObject>

- (void)selectedLeftItem;
- (void)selectedRightItem;

@end

@interface TotalView : UIView

@property (nonatomic, weak) id <TotalViewDelegate> delegate;

@end
