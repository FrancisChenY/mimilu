//
//  HotCell.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/1.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "HotCell.h"

@interface HotCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (weak, nonatomic) IBOutlet UILabel *viewLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;

@end

@implementation HotCell

- (void)setModel:(HotModel *)model{
    _model = model;
    [_icon sd_setImageWithURL:[NSURL URLWithString:[model.pics[0] url]]];
    _titleLabel.text = model.title;
    _nicknameLabel.text = model.user.nickname;
    _viewLabel.text = [NSString stringWithFormat:@"%@ | %@",model.views,model.order_time_str];
    [_avatar sd_setImageWithURL:[NSURL URLWithString:model.user.avatar]];
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.avatar.layer.cornerRadius = 10.0f;
    self.avatar.clipsToBounds = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
