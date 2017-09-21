//
//  AppDelegate+push.m
//  quzai
//
//  Created by mac on 16/4/5.
//  Copyright © 2016年 FEC. All rights reserved.
//

#import "AppDelegate+push.h"
#import "JPUSHService.h"

static NSString *appKey = @"69c64de67e42c954d3329aac";
static NSString *channel = @"丝阁严选";
static BOOL isProduction = FALSE;

@implementation AppDelegate (push)

- (BOOL)applicationPush:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    // 极光推送
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //设置通知类型并注册授权，可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert) categories:nil];
    }else{
        // //categories 必须为nil
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert) categories:nil];
    }
    
    [JPUSHService setupWithOption:launchOptions appKey:appKey channel:channel apsForProduction:isProduction];
    
    //如果要获取自定义的消息，则需要注册消息监听
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
    
    return YES;
}

//监听自定义消息的通知回调
- (void)networkDidReceiveMessage:(NSNotification *)notification {
    NSDictionary * userInfo = [notification userInfo];
    
    NSLog(@"自定义消息的:userInfo : %@",userInfo);
    
    //解析出badge
//    [UIApplication sharedApplication].applicationIconBadgeNumber = 1;

   
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[userInfo valueForKey:@"content"] message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:LocalMyString(@"sure"), nil];
        [alert show];
    }else{
        [JPUSHService handleRemoteNotification:userInfo];
    }
}

#pragma mark- 注册远程通知
//这个方法会在应用启动时自动调用,将手机的UDID信息发送给苹果，苹果返回deviceToken
- (void)applicationPush:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    LOG(@"Device Token: %@", deviceToken);
    //一般我们会将这个deviceToken保存到本地，每次打开应用去判断下是否新的deviceToken
    //在获取deviceToken后，我们将deviceToken发送到后台，后台通过deviceToken发送通知给苹果的APNs,苹果再发送给手机用户
    
    //转换成string
    //消除空格和<>
    LOG(@"deviceToken: %@",[[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]]);
    NSString* dvsToken =[[[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    LOG(@"dvsToken: %@", dvsToken);

    //将deviceToken添加到激光推送的后台中保存,激光推送通过上面的appKey来获取对应的所有的deviceToken,
    [JPUSHService registerDeviceToken:deviceToken];
    //登录时，我们调用后台接口保存某一个人的deviceToken和mid绑定，通过mid找到deviceToken,再将deviceToken  push到激光推送后台，让极光推送将deviceToken发送到苹果APNs服务器
    
//    NSString *ID = [JPUSHService registrationID];
//    LOG(@"ID:=  %@",ID)

    //监听注册成功，在方法里面获取JPush标识此设备的 registrationID，并保存
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self
                      selector:@selector(networkDidLogin:)
                          name:kJPFNetworkDidLoginNotification
                        object:nil];

}

- (void)networkDidLogin:(NSNotification *)notification {
    
    if ([JPUSHService registrationID]) {
        
        //保存设备registrationID
//        [[NSUserDefaults standardUserDefaults] setObject:[JPUSHService registrationID] forKey:RegistrationID];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

#pragma mark- 监听注册通知失败
- (void)applicationPush:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    LOG(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

#pragma mark- 获取远程通知信息  iOS 6
//当接收到通知时，会调用这个方法，通过userInfo获取通知或消息的信息
//当应用在前台时，不会弹出消息窗口，所以我们可以用一个alert弹出
- (void)applicationPush:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    LOG(@"获取到的远程通知:%@",userInfo);
    
    //解析出badge
    NSInteger badgeNum = [userInfo[@"aps"][@"badge"] integerValue];
    application.applicationIconBadgeNumber = badgeNum;
    
    if (application.applicationState == UIApplicationStateActive) {
        if ([userInfo valueForKey:@"content"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[userInfo valueForKey:@"content"] message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:LocalMyString(@"sure"), nil];
            [alert show];
        }
    }else{
        [JPUSHService handleRemoteNotification:userInfo];
    }
}

#pragma mark- 获取远程通知信息  iOS 7
- (void)applicationPush:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    LOG(@"获取到的远程通知:%@",userInfo);
    
    //解析出badge
    NSInteger badgeNum = [userInfo[@"aps"][@"badge"] integerValue];
    application.applicationIconBadgeNumber = badgeNum;
    
    if (application.applicationState == UIApplicationStateActive) {
        if ([userInfo valueForKey:@"content"]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[userInfo valueForKey:@"content"] message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:LocalMyString(@"sure"), nil];
            [alert show];
        }
        
    }else{
        [JPUSHService handleRemoteNotification:userInfo];
    }
    
    completionHandler(UIBackgroundFetchResultNewData);
}

@end
