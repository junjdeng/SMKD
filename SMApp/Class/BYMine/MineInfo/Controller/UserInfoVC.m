//
//  UserInfoVC.m
//  SMApp
//
//  Created by 家朋 on 2017/9/17.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "UserInfoVC.h"

@interface UserInfoVC ()
@property (weak, nonatomic) IBOutlet UITextField *niceNameTF;
@property (weak, nonatomic) IBOutlet UITextField *telTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *borthdayTF;
@property (weak, nonatomic) IBOutlet UIButton *authenticationButton;


@end

@implementation UserInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)setup {
    
    [self setRightNaviBtnTitle:@"编辑" withTitleColor:[UIColor redColor]];
    
}

- (void)didClickRightNaviBtn {
    
    self.rightNaviBtn.selected = !self.rightNaviBtn.selected;
    [self.rightNaviBtn setTitle:self.rightNaviBtn.selected ? @"保存":@"编辑" forState:UIControlStateNormal];

}

@end
