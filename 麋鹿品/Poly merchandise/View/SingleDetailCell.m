//
//  SingleDetailCell.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/9.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SingleDetailCell.h"

@interface SingleDetailCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *likesLabel;


@end


@implementation SingleDetailCell

- (void)setModel:(SingleListModel *)model
{
    _model = model;
    [_icon sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    _titleLabel.text = model.title;
    _descLabel.text = model.desc;
    _priceLabel.text = [NSString stringWithFormat:@"￥%@",model.price];
    _likesLabel.text = model.likes;
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor brownColor];
}

@end
