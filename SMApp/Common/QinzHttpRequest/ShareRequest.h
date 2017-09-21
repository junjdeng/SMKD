//
//  ShareRequest.h
//  QinzBaseProject
//
//  Created by Qinz on 2017/4/10.
//  Copyright © 2017年 Qinz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareRequest : NSObject

+ (void)shareRequestDataWithAppendURL:(NSString *)url Params:(NSDictionary *)params IsShowHud:(BOOL)isShowHud IsInteract:(BOOL)isInteract Complete:(void(^)(NSDictionary *dic,NSError *error,NSString*msg))completeBlock Fail:(void (^)())fail;

@end
