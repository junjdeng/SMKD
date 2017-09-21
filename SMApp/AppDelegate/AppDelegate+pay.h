//
//  AppDelegate+pay.h
//  quzai
//
//  Created by mac on 16/4/8.
//  Copyright © 2016年 FEC. All rights reserved.
//

#import "AppDelegate.h"
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>

@interface AppDelegate (pay)<WXApiDelegate>

- (BOOL)applicationPay:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (BOOL)applicationPay:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

- (BOOL) applicationPay:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options;

@end
