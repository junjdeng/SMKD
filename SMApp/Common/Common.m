//
//  Comment.m
//  zxmall
//
//  Created by mac on 15/6/16.
//  Copyright (c) 2015年 golvin. All rights reserved.
//
#import <CommonCrypto/CommonDigest.h>
#import <objc/message.h>
#import "Common.h"

#define APPSCHEME @"gydmall"

@implementation Common

//判断字符串是否包含中文
+ (BOOL) containtChinese:(NSString *) str{
    NSString *patternStr = @".*[\u4e00-\u9fa5].*";
    NSPredicate *chineseTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",patternStr];
    return [chineseTest evaluateWithObject:str];
}

//将字符串进行Unicode编码
+ (NSString *)chinaToUnicode:(NSString *)str{
    
    if ([self containtChinese:str]) {
        NSUInteger length = [str length];
        NSMutableString *result = [NSMutableString stringWithCapacity:0];
        
        for (int i = 0;i < length; i++)
        {
            int _char = [str characterAtIndex:i];
            // 汉字范围 \u4e00-\u9fa5 (中文)
            if (_char >= 19968 && _char <= 171941) {
                [result appendFormat:@"\\u%x",[str characterAtIndex:i]];//转16进制
            }else{
                [result appendFormat:@"%c",[str characterAtIndex:i]];
            }
        }
        return result;
    }else{
        return str;
    }
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

#pragma mark- 转json字符串
+(NSString*)DataTOjsonString:(NSDictionary*)params
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
    if (! jsonData) {
    }else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
//    
//    //先检查参数的格式,是否带有对象
//    BOOL objecInParams = NO;
//    for (id val in params.allValues) {
//        if ([val isKindOfClass:[NSDictionary class]] || [val isKindOfClass:[NSArray class]]) {//表示参数中带有直接传字典或数组的对象
//            objecInParams = YES;
//            break;
//        }
//    }
//    
//    NSData *data = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:NULL];
//    
//    if (objecInParams) {
//        return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    }else{
//        NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSString *jsonString = [dataStr stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
//        return jsonString;
//    }
}

#pragma mark- 获取当前的网络状态
+(NSInteger)getCurrageNetWorkStatus{
    
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"] subviews];
    NSInteger type = 0;
    for (id child in children) {
        if ([child isKindOfClass:
             NSClassFromString(@"UIStatusBarDataNetworkItemView")]){
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
            break;
        }
    }
    return type;
}


+(NSString *)transformToPinyin:(NSString*)chinese{
    NSMutableString *mutableString = [NSMutableString stringWithString:chinese];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    mutableString = (NSMutableString *)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    return mutableString;
}

+ (BOOL)isValidateEmail:(NSString *)Email
{
    NSString *emailCheck = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailCheck];
    return [emailTest evaluateWithObject:Email];
}

+ (BOOL) isValidatePostCode:(NSString *) postCode{
    NSString *postCodeCheck = @"^[1-9][0-9]{5}$";
    NSPredicate *postCodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",postCodeCheck];
    return [postCodeTest evaluateWithObject:postCode];
}

+ (BOOL) isValidateMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString *MOBILE = @"^[1][358]\\d{9}$";
//    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
//    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
//    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
//    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
//    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES))
//        || ([regextestcm evaluateWithObject:mobileNum] == YES)
//        || ([regextestct evaluateWithObject:mobileNum] == YES)
//        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
//身份证号
+ (BOOL)isValidateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0)
    {
        flag = NO;
        return flag;
    }
    
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    flag = [identityCardPredicate evaluateWithObject:identityCard];
    
    
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(flag)
    {
        if(identityCard.length==18)
        {
            //将前17位加权因子保存在数组里
            NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
            
            //这是除以11后，可能产生的11位余数、验证码，也保存成数组
            NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
            
            //用来保存前17位各自乖以加权因子后的总和
            
            NSInteger idCardWiSum = 0;
            for(int i = 0;i < 17;i++)
            {
                NSInteger subStrIndex = [[identityCard substringWithRange:NSMakeRange(i, 1)] integerValue];
                NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
                
                idCardWiSum+= subStrIndex * idCardWiIndex;
                
            }
            
            //计算出校验码所在数组的位置
            NSInteger idCardMod=idCardWiSum%11;
            
            //得到最后一位身份证号码
            NSString * idCardLast= [identityCard substringWithRange:NSMakeRange(17, 1)];
            
            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
            if(idCardMod==2)
            {
                if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
                {
                    return flag;
                }else
                {
                    flag =  NO;
                    return flag;
                }
            }else
            {
                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
                {
                    return flag;
                }
                else
                {
                    flag =  NO;
                    return flag;
                }
            }
        }
        else
        {
            flag =  NO;
            return flag;
        }
    }
    else
    {
        return flag;
    }

}
//判断字符串是否是整型


+ (BOOL)isPureInt:(NSString*)string{
    
    NSScanner* scan = [NSScanner scannerWithString:string];
    
    int val;
    
    return[scan scanInt:&val] && [scan isAtEnd];
    
}

//判断是否为浮点形：

+ (BOOL)isPureFloat:(NSString*)string{
    
    NSScanner* scan = [NSScanner scannerWithString:string];
    
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
    
}
+ (BOOL)isValidatePwd:(NSString *)pwd{
    NSString *pwdCheck = @"^[0-9a-zA-Z]{6,16}$";
    NSPredicate *pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",pwdCheck];
    return [pwdTest evaluateWithObject:pwd];
}


+ (UIViewController*)superViewController:(UIView *)view
{
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}


//大写转小写
+ (NSString *)TurnUppercaseLowercase:(NSString *)str{
    return [str lowercaseString];
}

+(BOOL)isIncludeSpecialCharact: (NSString *)str {
    
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€"]];
    if (urgentRange.location == NSNotFound)
        
    {
        return NO;
    }
    return YES;
    
}


//字符串去掉空格
+(NSString *)stringWithOutSpace:(NSString *)str{
    NSString * newStr = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    return newStr;
}


//隐藏手机号中间四位
+ (NSString *)hiddenTelPhoneMiddel:(NSString *)telNO{
    NSString *MOBILE = @"^[1][3578]\\d{9}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    if (([regextestmobile evaluateWithObject:telNO] == YES))
        
    {
        return  [telNO stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"] ;
    }
    else
    {
        return telNO;
    }
    
}

//判断是不是整数
+ (BOOL)isValidateInt:(NSString *)str{
    NSScanner* scan = [NSScanner scannerWithString:str];
    
    int val;
    
    return[scan scanInt:&val] && [scan isAtEnd];
}


//正浮点数
+ (BOOL) isFloatData:(NSString *)data{
    
    //不能以0\d开头的数据
    NSString *str = @"^0\\d+$";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",str];
    if (![pre evaluateWithObject:data]) {
        NSString *floatCheck = @"^\\d+\\.?\\d{0,2}$";
        NSPredicate *floatTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",floatCheck];
        
        return [floatTest evaluateWithObject:data];
    }else{
        return NO;
    }
}

//判断两个字符串是否相等<不区分大小写>
+ (BOOL) towStringIsEqual:(NSString *)str1 Str2:(NSString *)str2
{
    if ([str1 caseInsensitiveCompare:str2] == NSOrderedSame) {
        return YES;
    }else{
        return NO;
    }
}



@end
