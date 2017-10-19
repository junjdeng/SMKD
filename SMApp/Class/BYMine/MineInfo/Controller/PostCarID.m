//
//  PostCarID.m
//  SMApp
//
//  Created by 家朋 on 2017/9/26.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "PostCarID.h"

@interface PostCarID ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *carIDTF;
@property (weak, nonatomic) IBOutlet UIButton *clickBtn;

@end

@implementation PostCarID

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
    RAC(self.clickBtn,enabled) = [RACSignal
                                   combineLatest:@[self.nameTF.rac_textSignal,
                                                   self.carIDTF.rac_textSignal]
                                   reduce:^(NSString *name, NSString *carID){
                                       return @(name.length > 0 && carID.length > 0);
                                   }];
}

- (IBAction)postCheck:(id)sender {
    
    kPush(@"WaitCheckCarIDVC")
    
}

@end
