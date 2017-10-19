//
//  SMNotGetCell.m
//  SMApp
//
//  Created by 家朋 on 2017/10/12.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "SMNotGetCell.h"

@implementation SMNotGetCell

{
    
    __weak IBOutlet UILabel *orderCodeLabel;
    
    __weak IBOutlet UILabel *timeLabel;
    
    __weak IBOutlet UILabel *orderInfoLabel;
    
    __weak IBOutlet UILabel *typeLabel;
    
    
    __weak IBOutlet UIButton *csButton;
    
    __weak IBOutlet UIButton *ydButton;
    
    __weak IBOutlet UIButton *cancleButton;
    
    __weak IBOutlet UIView *backView;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    csButton.KYCornerRediu(4).KYBorderWidth(0.5).KYBorderColor([UIColor lightGrayColor]);
    ydButton.KYCornerRediu(4).KYBorderWidth(0.5).KYBorderColor([UIColor lightGrayColor]);
    cancleButton.KYCornerRediu(4).KYBorderWidth(0.5).KYBorderColor([UIColor lightGrayColor]);
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    backView.KYCornerRediu(8);
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

 
}

@end
