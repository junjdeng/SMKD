//
//  SMGetOrderVC.m
//  SMApp
//
//  Created by 家朋 on 2017/10/3.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "SMGetOrderVC.h"

@interface SMGetOrderVC ()
@property (weak, nonatomic) IBOutlet UITextField *senderNameTF;
@property (weak, nonatomic) IBOutlet UITextField *senderTelTF;
@property (weak, nonatomic) IBOutlet UITextField *senderCityTF;
@property (weak, nonatomic) IBOutlet UITextField *senderAddrTF;
@property (weak, nonatomic) IBOutlet UITextField *sendWeightTF;
//寄件方式
@property (weak, nonatomic) IBOutlet UIButton *toDoorTypeBtn;
@property (weak, nonatomic) IBOutlet UIButton *netForSelfBtn;
//订单类型
@property (weak, nonatomic) IBOutlet UIButton *normalOrderBtn;
@property (weak, nonatomic) IBOutlet UIButton *urgentOrderBtn;
@property (weak, nonatomic) IBOutlet UIButton *appointmentOrderBtn;

@property (weak, nonatomic) IBOutlet UILabel *remarkLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end

@implementation SMGetOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];

    _doneButton.KYCornerRediu(6);
}


#pragma mark - Click
//寄件方式
- (IBAction)clickSendType:(UIButton *)sender {
    
    _toDoorTypeBtn.selected = _netForSelfBtn.selected = NO;
    sender.selected = YES;
    
    _doneButton.enabled = YES;
}

//订单类型
- (IBAction)clickOrderType:(UIButton *)sender {
    _normalOrderBtn.selected = _urgentOrderBtn.selected = _appointmentOrderBtn.selected = NO;
    sender.selected = YES;
    
}

- (IBAction)clickAppointment:(id)sender {
    
    
}

- (IBAction)clickDone:(id)sender {
    
    kPush(@"SMGetOrderSuccessVC");
}

 

@end
