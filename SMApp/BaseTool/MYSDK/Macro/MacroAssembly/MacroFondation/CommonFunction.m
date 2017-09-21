//
//  CommonFunction.m
//  ShiShi
//
//  Created by mac_KY on 17/5/19.
//  Copyright © 2017年 fec. All rights reserved.
//

#import "CommonFunction.h"
#import "MBProgressHUD.h"

@implementation CommonFunction

#pragma mark - Show 显示弹出类

/** 在view 上面显示文字 */
void ShowVTMsg(UIView *view,NSString *message)
{
    [view makeToast:message];
}

/** 在Controller 上面显示文字 */
void ShowVCTMsg(UIViewController *conteentVC,NSString *message)
{
    [conteentVC.view makeToast:message];
}


/** 显示一个标题，左边＝确定 右边＝取消的自定义界面 0=cancle 1=true*/
void showSuccess(NSString *title,void(^clickDex)(NSInteger code))
{
   
}



#pragma mark - HUD
void showHUDMessage(UIView *view,NSString *msg)
{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
   // [MBProgressHUD showMessag:msg toView:view];
}
void showHUDSuccess(UIView *view,NSString *msg)
{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
  //  [MBProgressHUD showSuccess:msg toView:view];
}
void showHUDError(UIView *view,NSString *msg)
{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
   // [MBProgressHUD showError:msg toView:view];
}

void hideAHUD(UIView *view)
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}
void hideAllHUD(UIView *view)
{
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
}

#pragma mark - Font

UIFont* KYSysFont(CGFloat font)
{
    return [UIFont systemFontOfSize:font];
}
UIFont* KYWidFont(CGFloat font,CGFloat weight)
{
    return [UIFont systemFontOfSize:font weight:weight];
}
UIFont* KYBoldFont(CGFloat font)
{
    return [UIFont boldSystemFontOfSize:font];
}

UIFont* KYSelfFont(CGFloat font,NSString *fontName)
{
     return [UIFont fontWithName:fontName size:font];
}

@end
