//
//  IntegralVC.m
//  SMApp
//
//  Created by 家朋 on 2017/9/18.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "IntegralVC.h"

@interface IntegralVC ()
@property (weak, nonatomic) IBOutlet UIButton *clickBtn;

@end

@implementation IntegralVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"积分兑换";
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.clickBtn.KYCornerRediu(6);
}
    

@end
