//
//  SMLeftMenuVC.m
//  SMApp
//
//  Created by 家朋 on 2017/10/3.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "SMLeftMenuVC.h"

@interface SMLeftMenuVC ()
@property (weak, nonatomic) IBOutlet UIView *coverView;

@end

@implementation SMLeftMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    [self setup];
}
- (void)setup {
    
    [self.coverView addHanderBlock:^(UIView *sender) {
        [self.view removeFromSuperview];
    }];
 
}


 ///topClick
//我的寄件
- (IBAction)clickMeJI:(id)sender {
    [self pushToVC:@"FindVC"];
}
//我的收件
- (IBAction)clickMeShou:(id)sender {
    
}
//寄件地址博
- (IBAction)clickJiAddr:(id)sender {
    
}
//收件地址博
- (IBAction)clickSHouAddr:(id)sender {
    
}


///bottomClick
//价格时效
- (IBAction)clickPrice:(id)sender {
  
}
//收送范围
- (IBAction)clickFanWei:(id)sender {
    
}
//禁忌物品
- (IBAction)clickJinJi:(id)sender {
    
}
//附加功能
- (IBAction)clickFuJia:(id)sender {
    
}
//网店查询
- (IBAction)clickChaXuan:(id)sender {
}
//在线客服
- (IBAction)clickOnline:(id)sender {
    
}

- (void)pushToVC:(NSString *)VCStr {
    
    [self.view removeFromSuperview];
    UIViewController *VC = [[NSClassFromString(VCStr) alloc]init];
    [self.nav pushViewController:VC animated:YES];
}

@end
