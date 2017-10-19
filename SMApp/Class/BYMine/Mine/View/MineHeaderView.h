//
//  MineHeaderView.h
//  SMApp
//
//  Created by 家朋 on 2017/9/17.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIButton *MyIntegralBtn;
@property (weak, nonatomic) IBOutlet UIButton *MyMoneyBtn;
@property (weak, nonatomic) IBOutlet UIButton *MyCommentBtn;


@property (weak, nonatomic) IBOutlet UIButton *goLogin;
@property (weak, nonatomic) IBOutlet UIButton *goRegin;


+ (instancetype)hadLoginMineHeader;
+ (instancetype)notLoginMineHeader;

@end
