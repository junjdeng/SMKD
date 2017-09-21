//
//  AppDelegate+pay.m
//  quzai
//
//  Created by mac on 16/4/8.
//  Copyright © 2016年 FEC. All rights reserved.
//

#import "AppDelegate+pay.h"
#import "UPPaymentControl.h"
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>

@implementation AppDelegate (pay)

- (BOOL)applicationPay:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    //微信支付注册
    [WXApi registerApp:@"wxf699b9e944caf014"];
    return YES;
}

- (BOOL)applicationPay:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    //支付宝支付回调
    if ([url.host isEqualToString:@"safepay"]) {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            LOG(@"result = %@",resultDic);
        }];
    }
    
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    //银联支付
    [[UPPaymentControl defaultControl] handlePaymentResult:url completeBlock:^(NSString *code, NSDictionary *data) {
        
        //结果code为成功时
        if([code isEqualToString:@"success"]) {
            [window makeToast:LocalMyString(@"交易成功")];
            //支付成功跳转到订单
//            [[NSNotificationCenter defaultCenter] postNotificationName:PAY_SUCCESS object:nil];
        }else if([code isEqualToString:@"fail"]) {
            //交易失败
            [window makeToast:LocalMyString(@"交易失败")];
        }else if([code isEqualToString:@"cancel"]) {
            //交易取消
            [window makeToast:LocalMyString(@"交易取消")];
        }
    }];
    
    //微信支付
    [WXApi handleOpenURL:url delegate:self];
    
    return YES;
}

- (void) onResp:(BaseResp *)resp{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    if ([resp isKindOfClass:[PayResp class]]){
        PayResp *response = (PayResp*)resp;
        switch(response.errCode){
            case WXSuccess:
                //服务器端查询支付通知或查询API返回的结果再提示成功
                [window makeToast:LocalMyString(@"交易成功")];
//                [[NSNotificationCenter defaultCenter] postNotificationName:PAY_SUCCESS object:nil];
                break;
            default:
                [window makeToast:LocalMyString(@"交易失败")];
                break;
        }
    }
}

- (BOOL) applicationPay:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
    return [self applicationPay:app openURL:url sourceApplication:nil annotation:nil];
}

@end
