//
//  HYBaseVC.m
//  HelpTour
//
//  Created by 家朋 on 2017/9/13.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //禁止Toast多次弹出
    [CSToastManager setQueueEnabled:NO];
    
    //统一设置控制器view的背景颜色
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //统一设置控制器中是否有额外的内边距,如果要则在子控制器中重新设置
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = GlobalBackColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; 
}



#pragma mark - SET Nav
-(void)setRightNaviBtnImage:(UIImage *)img
{
    self.rightNaviBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightNaviBtn.frame=CGRectMake(0, 0, 44, 44);
    [self.rightNaviBtn setImage:img forState:UIControlStateNormal];
    self.rightNaviBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.rightNaviBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.rightNaviBtn.backgroundColor=[UIColor clearColor];
    [self.rightNaviBtn addTarget:self action:@selector(didClickRightNaviBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithCustomView:self.rightNaviBtn];
    self.navigationItem.rightBarButtonItem=rightButton;
}


-(void)setRightNaviBtnTitle:(NSString*)str withTitleColor:(UIColor *)titleColor
{
    self.rightNaviBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightNaviBtn.frame=CGRectMake(0, 0, 44, 44);
    [self.rightNaviBtn setTitle:str forState:UIControlStateNormal];
    [self.rightNaviBtn setTitleColor:titleColor forState:UIControlStateNormal];
    [self.rightNaviBtn setTitleColor:titleColor forState:UIControlStateSelected];
    self.rightNaviBtn.titleLabel.font=[UIFont systemFontOfSize:18];
    [self.rightNaviBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.rightNaviBtn.backgroundColor=[UIColor clearColor];
    [self.rightNaviBtn addTarget:self action:@selector(didClickRightNaviBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithCustomView:self.rightNaviBtn];
    self.navigationItem.rightBarButtonItem=  rightButton;
}



-(void)setLeftNaviBtnImage:(UIImage*)img
{
    self.leftNaviBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftNaviBtn.frame=CGRectMake(0, 0, 44, 44);
    //[self.rightNaviBtn setBackgroundImage:img forState:UIControlStateNormal];
    [self.leftNaviBtn setImage:img forState:UIControlStateNormal];
    //    [self.rightNaviBtn setTitle:@"返回" forState:UIControlStateNormal];
    self.leftNaviBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.leftNaviBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.leftNaviBtn.backgroundColor=[UIColor clearColor];
    [self.leftNaviBtn addTarget:self action:@selector(clickRightNaviBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithCustomView:self.leftNaviBtn];
    self.navigationItem.leftBarButtonItem=rightButton;
}


-(void)setLeftNaviBtnTitle:(NSString*)str{
    self.leftNaviBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftNaviBtn.frame=CGRectMake(0, 0, 60, 44);
    [self.leftNaviBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self.leftNaviBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
    [self.leftNaviBtn addTarget:self action:@selector(clickRightNaviBtn) forControlEvents:UIControlEventTouchUpInside];
    self.leftNaviBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -18, 0, 0);
    self.leftNaviBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0);
    
    [self.leftNaviBtn setTitle:str forState:UIControlStateNormal];
    self.leftNaviBtn.titleLabel.font=[UIFont systemFontOfSize:18];
    [self.leftNaviBtn.titleLabel setTextAlignment:NSTextAlignmentLeft];
    self.leftNaviBtn.backgroundColor=[UIColor clearColor];
    [self.leftNaviBtn addTarget:self action:@selector(popVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithCustomView:self.leftNaviBtn];
    
    self.navigationItem.leftBarButtonItem = rightButton;
    
}

- (void)clickRightNaviBtn{};
- (void)popVC {
    
    [self.navigationController popViewControllerAnimated:YES];
};
- (void)didClickRightNaviBtn{};


- (void)pushToVC:(NSString *)vcStr {
    
    UIViewController *VC = [NSClassFromString(vcStr) new];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
