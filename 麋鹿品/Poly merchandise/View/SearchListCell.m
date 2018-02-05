//
//  SearchListCell.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/4.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SearchListCell.h"

@interface SearchListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *en_nameLabel;


@end

@implementation SearchListCell

- (void)setModel:(SearchListModel *)model
{
    _model = model;
    [_icon sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    _nameLabel.text = model.name;
    _en_nameLabel.text = model.en_name;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

@end
