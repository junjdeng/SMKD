//
//  ShareRequest.m
//  QinzBaseProject
//
//  Created by Qinz on 2017/4/10.
//  Copyright © 2017年 Qinz. All rights reserved.
//

#import "ShareRequest.h"
#import "QinzHttpRequest.h"
#import "SVProgressHUD.h"
#import "UIImage+GIF.h"
#import "UIApplication+JKNetworkActivityIndicator.h"

static NSInteger state;
static NSString *msg;
static NSInteger num;

@implementation ShareRequest

+ (void)shareRequestDataWithAppendURL:(NSString *)url Params:(NSDictionary *)params IsShowHud:(BOOL)isShowHud IsInteract:(BOOL)isInteract Complete:(void(^)(NSDictionary *dic,NSError *error,NSString*msg))completeBlock Fail:(void (^)())fail{
    
    QinzHttpRequest*request = [[QinzHttpRequest alloc]init];
    [[UIApplication sharedApplication] jk_beganNetworkActivity];
    
    if (isShowHud) {
        if (isInteract) {
            [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
        }else{
            [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
        }
        [SVProgressHUD show];
        /*   ====== 显示gif加载动画用下面这段代码 ====== */
        //[SVProgressHUD showImage:[UIImage sd_animatedGIFNamed:@"pika"] status:nil];
    }
    
    [request postRequestToURL: [NSString stringWithFormat:@"%@%@",requestServerURL,url] parameters:params returnResponse:^(id data, NSError *error) {
        
        if (isShowHud) {
            [SVProgressHUD dismiss];
        }
        [[UIApplication sharedApplication] jk_endedNetworkActivity];
        
        if (error) {
            fail();
            completeBlock(nil,error,nil);
        }else{
            num = 0;
            LOG(@"\n😊请求的地址为😊:\n————————————————————————————————————————————————\n%@%@\n————————————————————————————————————————————————",requestServerURL,url);
            //展示传递给后台的参数
            LOG(@"🌴传递给后台的参数为🌴:\n************************************************\n");
            
            if (params == nil) {
                LOG(@"没⃣有⃣传⃣递⃣任⃣何⃣参⃣数⃣数⃣");
            }
            
            num = 0;
            [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                LOG(@"第%ld个参数为:%@=%@", num,key, obj);
                num++;
            }];
            
            LOG(@"\n************************************************");
            
            LOG(@"🍻请求返回的数据🍻:\n=================================================\n%@\n=================================================",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
            
            id result =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            
            if ([result isKindOfClass:[NSDictionary class]]) {
                
                id b_data = [result valueForKey:@"data"];
                if ([b_data isKindOfClass:[NSDictionary class]]) {
                    
                    msg = [b_data valueForKey:@"msg"];
                    state = [[b_data valueForKey:@"state"] integerValue];
                    
                    if (state == 0) {
                        
                        NSDictionary*dic = [b_data objectForKey:@"obj"];
                        completeBlock(dic,nil,msg);
                    }else{
                        fail();
                        [[UIApplication sharedApplication].keyWindow makeToast:msg];
                    }
                }
            }
        }
    }];
}

@end
