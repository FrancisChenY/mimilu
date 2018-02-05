//
//  CalendarViewController.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/14.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CalendarViewController.h"
#import "FDCalendar.h"


@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    FDCalendar *calendar = [[FDCalendar alloc] initWithCurrentDate:[NSDate date]];
    CGRect frame = calendar.frame;
    frame.origin.y = 64;
    calendar.frame = frame;
    [self.view addSubview:calendar];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
