//
//  SMSendBaseVC.m
//  SMApp
//
//  Created by 家朋 on 2017/10/10.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "SMSendBaseVC.h"

@interface SMSendBaseVC ()

@end

@implementation SMSendBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTable];
}

- (void)setTable {
    
    UIView *head = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    [self.view addSubview:head];
    head.backgroundColor = [UIColor clearColor];
    
    UITextField *searchTF = [[UITextField alloc]initWithFrame:CGRectMake(15, 5, kScreenWidth - 15 - 60, 40)];
    searchTF.backgroundColor = [UIColor whiteColor];
    searchTF.placeholder = @"情输入运单号";
    searchTF.KYCornerRediu(3);
    searchTF.borderStyle = UITextBorderStyleNone;
    [head addSubview:searchTF];
    self.searchTF = searchTF;
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth - 60, 0, 60, 50)];
    [btn setImage:[UIImage imageNamed:@"main_cx"] forState:UIControlStateNormal];
    [head addSubview:btn];
    self.searchButton = btn;
    
    
    UITableView *tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self.view addSubview:tab];
    tab.backgroundColor = [UIColor clearColor];
    tab.tableFooterView = [UIView new];
    tab.separatorColor = [UIColor clearColor];
    
    tab.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(55, 0, 0, 0));
    self.mainTable = tab;
      
    
    
}



@end
