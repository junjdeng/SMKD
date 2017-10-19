//
//  Recommend.m
//  SMApp
//
//  Created by 家朋 on 2017/9/26.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "Recommend.h"

@interface Recommend ()
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIView *backView;

@end

@implementation Recommend

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
  
    self.backView.KYCornerRediu(6)
    .KYBorderColor(lightColor)
    .KYBorderWidth(1);
    self.shareBtn.KYCornerRediu(6);
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (IBAction)clickShareBtn:(id)sender {
}

@end
