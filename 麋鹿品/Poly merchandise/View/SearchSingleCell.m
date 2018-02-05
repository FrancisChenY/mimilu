//
//  SearchSingleCell.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SearchSingleCell.h"

@interface SearchSingleCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation SearchSingleCell

- (void)setModel:(Subclass *)model
{
    _model = model;
    [_icon sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    _nameLabel.text = model.name;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

@end
