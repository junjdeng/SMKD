//
//  FindVC.m
//  SMApp
//
//  Created by 家朋 on 2017/9/15.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "FindVC.h"

@interface FindVC ()
@property (weak, nonatomic) IBOutlet UIView *headerView;

@end

@implementation FindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.headerView setConnerRediu:8];
    self.headerView.KYBorderColor(RGB(222, 222, 222)).KYBorderWidth(1);
}

- (IBAction)clickLeftBtn:(id)sender {
    kPush(@"IntegralVC");
}

- (IBAction)clickRightBtn:(id)sender {
    
    [self.view makeToast:@"正在建设中.敬请期待..."];
}


@end
