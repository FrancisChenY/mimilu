//
//  SingleCategoryCell.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/11.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SingleCategoryCell.h"

@interface SingleCategoryCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;

@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (weak, nonatomic) IBOutlet UILabel *likesLabel;
@property (weak, nonatomic) IBOutlet UILabel *content;


@end

@implementation SingleCategoryCell

- (void)setModel:(SingleCategoryModel *)model
{
    _model = model;
    [_icon sd_setImageWithURL:[NSURL URLWithString:model.mini_pic_url]];
    [_avatar sd_setImageWithURL:[NSURL URLWithString:model.author.avatar]];
    _nicknameLabel.text = model.author.nickname;
    _likesLabel.text = model.likes;
    _content.text = model.content;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor brownColor];
    
}

@end
