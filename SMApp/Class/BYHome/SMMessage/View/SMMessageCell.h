//
//  SMMessageCell.h
//  SMApp
//
//  Created by 家朋 on 2017/10/3.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "BaseCell.h"

@interface SMMessageCell : BaseCell

@property (weak, nonatomic) IBOutlet UIImageView *imgVeiw;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *deslabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
