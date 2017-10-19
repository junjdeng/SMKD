//
//  WaitCheckCarIDVC.m
//  SMApp
//
//  Created by 家朋 on 2017/9/26.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "WaitCheckCarIDVC.h"

@interface WaitCheckCarIDVC ()
@property (weak, nonatomic) IBOutlet UIButton *clickBtn;

@end

@implementation WaitCheckCarIDVC



-(void)awakeFromNib {
    [super awakeFromNib];
    
  
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
      self.clickBtn.KYCornerRediu(6);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"实名认证";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
