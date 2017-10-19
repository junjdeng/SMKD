//
//  CustomerVC.m
//  SMApp
//
//  Created by 家朋 on 2017/9/25.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "CustomerVC.h"

@interface CustomerVC ()

@end

@implementation CustomerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"会员主页";
    
    [self setRightNaviBtnTitle:@"会员介绍" withTitleColor:[UIColor redColor]];
}

-(void)didClickRightNaviBtn {
    
    kPush(@"CustomerIntroduceVC");
}


@end
