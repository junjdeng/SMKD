//
//  HYBaseVC.h
//  HelpTour
//
//  Created by 家朋 on 2017/9/13.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseVC : UIViewController
@property(retain,nonatomic)UIButton *rightNaviBtn;
@property(retain,nonatomic)UIButton *leftNaviBtn;

-(void)setRightNaviBtnImage:(UIImage*)img;
-(void)setRightNaviBtnTitle:(NSString*)str withTitleColor:(UIColor *)titleColor;
-(void)setLeftNaviBtnImage:(UIImage*)img;
-(void)setLeftNaviBtnTitle:(NSString*)str;



- (void)popVC;
- (void)didClickRightNaviBt;
- (void)didClickLeftNaviBtn;


- (void)pushToVC:(NSString *)vcStr;
@end
