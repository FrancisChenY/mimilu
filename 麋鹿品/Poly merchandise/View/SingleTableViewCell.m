//
//  SingleTableViewCell.m
//  Poly merchandise
//
//  Created by qianfeng on 16/11/10.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "SingleTableViewCell.h"

@interface SingleTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;



@end

@implementation SingleTableViewCell

- (void)setName:(NSString *)name
{
    _nameLabel.text = name;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
