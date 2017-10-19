//
//  MineIntegralVC.m
//  SMApp
//
//  Created by 家朋 on 2017/9/27.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "MineIntegralVC.h"

@interface MineIntegralVC ()

@end

@implementation MineIntegralVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"我的积分";
    
}
///  积分规则
- (IBAction)clickJiFen:(id)sender {
        kPush(@"MineIntegralRuleVC")
}
///  兑换现金
- (IBAction)clickGetMonkey:(id)sender {

    
}

@end
