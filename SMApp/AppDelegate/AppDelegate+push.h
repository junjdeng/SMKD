//
//  AppDelegate+push.h
//  quzai
//
//  Created by mac on 16/4/5.
//  Copyright © 2016年 FEC. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate (push)

- (BOOL)applicationPush:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (void)applicationPush:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken ;

- (void)applicationPush:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;

- (void)applicationPush:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;

- (void)applicationPush:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

@end
