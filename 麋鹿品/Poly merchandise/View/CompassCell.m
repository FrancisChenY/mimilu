//
//  CompassCell.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "CompassCell.h"

@interface CompassCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;


@end

@implementation CompassCell

- (void)setModel:(CompassModel *)model
{
    _model = model;
    [_icon sd_setImageWithURL:[NSURL URLWithString:model.pic2]];
    _nameLable.text = model.name;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
