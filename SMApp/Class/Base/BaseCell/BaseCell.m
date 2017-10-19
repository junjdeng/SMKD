//
//  BaseCell.m
//  SMApp
//
//  Created by 家朋 on 2017/9/26.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(NSString *)cellID {
   
    return NSStringFromClass([self class]);
}
@end
