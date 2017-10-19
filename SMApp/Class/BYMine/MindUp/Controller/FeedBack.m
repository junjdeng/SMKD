//
//  FeedBack.m
//  SMApp
//
//  Created by 家朋 on 2017/9/17.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "FeedBack.h"
#import "JTextView.h"
@interface FeedBack ()
@property (weak, nonatomic) IBOutlet UIView *TVBackView;
@property (weak, nonatomic) IBOutlet UITextField *telTF;
@property (weak, nonatomic) IBOutlet UIButton *doneBtn;

@end

@implementation FeedBack

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JTextView *tv = [[JTextView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth - 40, 150)];
    tv.KYPlaceholder = @"     感谢你选择神马快递，欢迎您在使用过程中任何的意见和建议，我们将非常期待和感谢!";
    [_TVBackView addSubview:tv];
 
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.doneBtn.KYCornerRediu(6);
    _TVBackView.KYCornerRediu(8);
    
}

- (IBAction)clickDone:(id)sender {
    
    [self.view makeToast:@"点击了提交"];
    
}


@end
