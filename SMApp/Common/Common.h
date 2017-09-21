//
//  Comment.h
//  zxmall
//
//  Created by mac on 15/6/16.
//  Copyright (c) 2015年 golvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Common : NSObject

//将字符串进行Unicode编码(只对中文进行编码)
+ (NSString *)chinaToUnicode:(NSString *)str;
//md5加密
+ (NSString *)md5HexDigest:(NSString*)input;
//转json字符串
+(NSString*)DataTOjsonString:(NSDictionary*)params;
//获取当前的网络状态
+(NSInteger)getCurrageNetWorkStatus;
//中文转拼音
+(NSString *)transformToPinyin:(NSString*)chinese;
//判读邮箱
+ (BOOL)isValidateEmail:(NSString *)Email;
+ (BOOL) isValidatePostCode:(NSString *) postCode;
//判断电话号码
+ (BOOL) isValidateMobile:(NSString *)mobileNum;
+ (BOOL) isValidatePwd:(NSString *)pwd;
//身份证号
+ (BOOL)isValidateIdentityCard: (NSString *)identityCard;
+ (BOOL)isPureFloat:(NSString*)string;
+ (BOOL)isPureInt:(NSString*)string;
//获取视图的上层的视图控制器
+ (UIViewController*)superViewController:(UIView *)view;
//大写转小写
+ (NSString *)TurnUppercaseLowercase:(NSString *)str;
//检测密码时候包含特殊字符
+(BOOL)isIncludeSpecialCharact: (NSString *)str;

//字符串去掉空格
+(NSString *)stringWithOutSpace:(NSString *)str;

//隐藏手机号中间四位
+ (NSString *)hiddenTelPhoneMiddel:(NSString *)telNO;

//判断是不是整数
+ (BOOL)isValidateInt:(NSString *)str;

//保证输入金额的有效性
+ (BOOL) isFloatData:(NSString *)data;

//判断两个字符串是否相等<不区分大小写>
+ (BOOL) towStringIsEqual:(NSString *)str1 Str2:(NSString *)str2;

@end
