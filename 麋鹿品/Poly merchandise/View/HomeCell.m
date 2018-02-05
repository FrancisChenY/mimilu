//
//  HomeCell.m
//  Poly merchandise
//
//  Created by qianfeng on 16/10/29.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerIcon;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;


@end

@implementation HomeCell

- (void)setModel:(HomeModel *)model{
    _model = model;
    if ([model.pic isEqualToString:@""]) {
        Pics *pic = model.pics[0];
        [_icon sd_setImageWithURL:[NSURL URLWithString:pic.url]];

    }else{
        [_icon sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    }
    _titleLabel.text = model.title;
    _likeLabel.text = model.likes;
    [_headerIcon sd_setImageWithURL:[NSURL URLWithString:model.user.avatar]];
    
    _userNameLabel.text = model.user.nickname;
    
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellAccessoryNone;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
