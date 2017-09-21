//
//  CommonFunction.h
//  ShiShi
//
//  Created by mac_KY on 17/5/19.
//  Copyright © 2017年 fec. All rights reserved.
// 函数管理 － 存放一切的函数

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^BBBlcok)(NSString *ss);
@interface CommonFunction : NSObject


#pragma mark - Toast
/** 在view 上面显示文字 */
void ShowVTMsg(UIView *view,NSString *message);

/** 在Controller 上面显示文字 */
void ShowVCTMsg(UIViewController *conteentVC,NSString *message);
/** 显示一个标题，左边＝确定 右边＝取消的自定义界面 0=cancle 1=true*/
void showSuccess(NSString *title,void(^clickDex)(NSInteger code));

#pragma mark - HUD
void showHUDMessage(UIView *view,NSString *msg);
void showHUDSuccess(UIView *view,NSString *msg);
void showHUDError(UIView *view,NSString *msg);

/** 只会隐藏该界面的嘴上层的那个HUD */
void hideAHUD(UIView *view);

/** 隐藏该界面的所有的UHUD */
void hideAllHUD(UIView *view);


#pragma mark - Font

UIFont* KYSysFont(CGFloat font);
UIFont* KYWidFont(CGFloat font,CGFloat weight);
UIFont* KYBoldFont(CGFloat font);

UIFont* KYSelfFont(CGFloat font,NSString *fontName);






@end
