//
//  ChangePwdVC.m
//  SMApp
//
//  Created by 家朋 on 2017/9/17.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "ChangePwdVC.h"

@interface ChangePwdVC ()
@property (strong, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIButton *doneBtn;

@end

@implementation ChangePwdVC

-(void)awakeFromNib {
    [super awakeFromNib];
   

    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    _backView
    .KYCornerRediu(8)
    .KYBorderWidth(1)
    .KYBorderColor([UIColor lightGrayColor]);
    
    _doneBtn.KYCornerRediu(4);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
}
- (IBAction)clickDone:(id)sender {
}

@end
