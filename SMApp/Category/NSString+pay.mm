//
//  NSString+pay.m
//  FECProject
//
//  Created by mac on 16/4/24.
//  Copyright © 2016年 FEC. All rights reserved.
//

#import "NSString+pay.h"
#import <CommonCrypto/CommonDigest.h>
#import <objc/message.h>
#import <CommonCrypto/CommonDigest.h>
#import <AlipaySDK/AlipaySDK.h>
#import "WXApi.h"
#import "UPPaymentControl.h"

#ifdef DEBUG //测试环境

#define uppayMode @"01"

#else

#define uppayMode @"00"

#endif

NSString *const scheme = @"Qinz";

@implementation NSString (pay)

+(void)alipay:(NSString*)orderString callBack:(void (^)(NSDictionary *resultDict)) callBack{
    if (orderString != nil) {
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:scheme callback:^(NSDictionary *resultDic) {
            callBack(resultDic);
        }];
    }
}

+ (void)unionpay:(NSString *)tn viewController:(UIViewController *) viewController{
    if (tn && tn.length>0) {
        [[UPPaymentControl defaultControl] startPay:tn fromScheme:scheme mode:uppayMode viewController:viewController];
    }
}


+ (void) weChatPay:(NSString *) orderString{
    NSData *data = [orderString dataUsingEncoding:NSUTF8StringEncoding];
    id payInfo = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    if ([payInfo isKindOfClass:[NSDictionary class]]) {
        
        NSString *appid = [payInfo valueForKey:@"appid"];
        NSString *mchid = [payInfo valueForKey:@"partnerid"];//商户id
        
        [WXApi registerApp:appid withDescription:@"demo 2.0"];
        
        PayReq *request = [[PayReq alloc] init];
        //这些数据是通过服务端进行了一次签名后返回的
        request.openID = appid;
        request.partnerId = mchid;
        request.prepayId= [payInfo valueForKey:@"prepayid"];
        request.package = [payInfo valueForKey:@"package"];
        request.nonceStr= [payInfo valueForKey:@"noncestr"];
        request.timeStamp = [[payInfo valueForKey:@"timestamp"] intValue];
        
        //进行二次签名(二次签名只是为了获取到sign)
        NSMutableDictionary *signParams = [NSMutableDictionary dictionary];
        [signParams setObject:appid forKey:@"appid"];
        [signParams setObject:request.nonceStr forKey:@"noncestr"];
        [signParams setObject:request.package forKey:@"package"];
        [signParams setObject:mchid forKey:@"partnerid"];
        [signParams setObject:request.prepayId forKey:@"prepayid"];
        [signParams setObject:[payInfo valueForKey:@"timestamp"] forKey:@"timestamp"];
        //进行第二次签名
//        NSString *appKey = [payInfo valueForKey:@"appKey"];
        //进行md5加密
        NSString *sign = [payInfo valueForKey:@"sign"];
        //        NSString *sign = [self createMd5Sign:signParams withAppKey:appKey];
        
        request.sign= sign;
        [WXApi sendReq:request];
        
    }
}

//创建package签名
+(NSString*) createMd5Sign:(NSMutableDictionary*)dict withAppKey:(NSString *) appKey
{
    NSMutableString *contentString  =[NSMutableString string];
    NSArray *keys = [dict allKeys];
    //按字母顺序排序
    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    //拼接字符串
    for (NSString *categoryId in sortedArray) {
        if (![[dict objectForKey:categoryId] isEqualToString:@""]&& ![categoryId isEqualToString:@"sign"]&& ![categoryId isEqualToString:@"key"]){
            [contentString appendFormat:@"%@=%@&", categoryId, [dict objectForKey:categoryId]];
        }
        
    }
    //添加key字段
    [contentString appendFormat:@"key=%@",appKey];//这个key是商户key
    
    //得到MD5 sign签名
    NSString *md5Sign =[self md5HexDigest:contentString];
    
    return md5Sign;
}

#pragma mark- md5 32位 加密
+ (NSString *)md5HexDigest:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str,(CC_LONG) strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02X",result[i]];
    }
    return ret;
}

@end
