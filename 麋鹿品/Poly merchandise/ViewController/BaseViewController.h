//
//  BaseViewController.h
//  Poly merchandise
//
//  Created by qianfeng on 16/10/29.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"


@protocol BaseViewControllerDelegate <NSObject>

- (void)changeFrame:(CGFloat)offset;

@end
@interface BaseViewController : UIViewController 

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) id <BaseViewControllerDelegate> delegate;
@property(nonatomic, strong) NSArray *dataList;

- (void)getData;

@end
