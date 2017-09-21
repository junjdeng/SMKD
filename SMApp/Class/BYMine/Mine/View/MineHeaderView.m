//
//  MineHeaderView.m
//  SMApp
//
//  Created by 家朋 on 2017/9/17.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "MineHeaderView.h"

@implementation MineHeaderView

+ (instancetype)hadLoginMineHeader {
    
    MineHeaderView *header = [[NSBundle mainBundle]loadNibNamed:@"MineHeaderView" owner:nil options:nil].firstObject;
    header.height = 190;
    return header;
    
}
+ (instancetype)notLoginMineHeader {
    
    MineHeaderView *header = [[NSBundle mainBundle]loadNibNamed:@"MineHeaderView" owner:nil options:nil].lastObject;
    header.height = 190;
    return header;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
}

@end
