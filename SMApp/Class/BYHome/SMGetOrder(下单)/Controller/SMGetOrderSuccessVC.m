//
//  SMGetOrderSuccessVC.m
//  SMApp
//
//  Created by 家朋 on 2017/10/10.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "SMGetOrderSuccessVC.h"

@interface SMGetOrderSuccessVC ()

@property (weak, nonatomic) IBOutlet UILabel *orderCodeLabel;

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;

@end

@implementation SMGetOrderSuccessVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
    _btn1.KYCornerRediu(4);
    _btn2.KYCornerRediu(4);
}
//填写运单
- (IBAction)clickYunDan:(id)sender {
 
    
}

//查看订单
- (IBAction)clickOrder:(id)sender {
    
    
}



@end
