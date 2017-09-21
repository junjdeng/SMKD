//
//  NSString+pay.h
//  FECProject
//
//  Created by mac on 16/4/24.
//  Copyright © 2016年 FEC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (pay)

/**
 *  银联支付
 *
 *  @param tn             交易流水号信息，银联后台生成，通过商户后台返回到客户端并传入支付控件
 *  @param viewController 必填项；商户应用程序调用银联手机支付的当前UIViewController
 *  @param delegate       商户应用程序调用银联手机支付的当前UIViewController
 */
+ (void)unionpay:(NSString *)tn viewController:(UIViewController *) viewController;

/**
 *  支付宝支付
 *
 *  @param orderString 	主要包含商户的订单信息，key=“value”形式，以&连接。
 *  @param callBack    快捷支付开发包回调函数，返回免登、支付结果
 */
+(void)alipay:(NSString*)orderString callBack:(void (^)(NSDictionary *resultDict)) callBack;

/**
 *  微信支付
 *
 *  @param orderString 订单信息
 */
+ (void) weChatPay:(NSString *) orderString;

@end
