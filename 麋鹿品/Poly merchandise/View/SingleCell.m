//
//  SingleCell.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SingleCell.h"

@interface SingleCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;


@end

@implementation SingleCell

- (void)setModel:(SingleModel *)model
{
    _model = model;
    [_icon sd_setImageWithURL:[NSURL URLWithString:model.pic]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

@end
