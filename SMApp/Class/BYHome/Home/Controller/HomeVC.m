//
//  HomeVC.m
//  SMApp
//
//  Created by 家朋 on 2017/10/2.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "HomeVC.h"
#import "SMLeftMenuVC.h"
#import "BaseNavigationController.h"

@interface HomeVC ()
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    [self setupLocation];
    [self setupNav];
  
}

- (void)setup {
  
  

    
}
- (void)setupNav {
    
    [self setLeftNaviBtnImage:[UIImage imageNamed:@"set_ico"]];
    [self setRightNaviBtnImage:[UIImage imageNamed:@"xix"]];
}
#pragma mark - Click(点击事件处理)

/// 下单
- (IBAction)getOrderClick:(id)sender {
    kPush(@"SMGetOrderVC")
}

/// 寄件
- (IBAction)sendOrderClick:(id)sender {
    kPush(@"SMSendVC");
}

/// 支付
- (IBAction)payClick:(id)sender {
}

/// 查询
- (IBAction)lookForClick:(id)sender {
}
/// 最新快递
- (IBAction)newstExpressClick:(id)sender {
}

/// 寄件记录
- (IBAction)sendRecordClick:(id)sender {
}

/// 快递服务查询
- (IBAction)expressLookForClick:(id)sender {
}

/// 代理合作
- (IBAction)delegateAndCooperateClick:(id)sender {
}

/// 在线客服
- (IBAction)onlineServeClick:(id)sender {
    
    
}

- (void)didClickRightNaviBtn {
    kPush(@"SMMessageVC");
    
}
- (void)didClickLeftNaviBtn {
    SMLeftMenuVC *VC = [[SMLeftMenuVC alloc]init];
    VC.nav = self.navigationController;
    VC.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [[UIApplication sharedApplication].keyWindow addSubview:VC.view];
}
- (void)did {
    
}

-(void)setupLocation {
    
}
 

@end
