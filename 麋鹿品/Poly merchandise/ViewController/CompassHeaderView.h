//
//  CompassHeaderView.h
//  Poly merchandise
//
//  Created by qianfeng on 16/11/1.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CompassHeaderViewDelegate <NSObject>

- (void)changeDataWithSelected;

@end

@interface CompassHeaderView : UIView

@property (nonatomic, weak) id <CompassHeaderViewDelegate> delegate;

@end
