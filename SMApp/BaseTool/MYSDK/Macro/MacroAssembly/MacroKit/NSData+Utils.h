//
//  NSData+Utils.h
//  ShiShi
//
//  Created by mac_KY on 17/5/16.
//  Copyright © 2017年 fec. All rights reserved.
//

#import <Foundation/Foundation.h>

// readMe:主要负责 base64/DES的加解密


@interface NSData (Utils)


/** DES加密 */
+ (NSData *)desEncrypt:(NSData *) data;//使用默认的key//加密
//DES解密
+ (NSData *)desDecrypt:(NSData *) data;//使用默认的key解密
//DES加密
+ (NSData *)desEncrypt:(NSData *)data WithKey:(NSString *)key;
//DES解密
+ (NSData *)desDecrypt:(NSData *)data WithKey:(NSString *)key;


/** Base64加密 */
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)base64EncodedString;

//Base64解密
+ (NSData*) base64Decode:(NSString *)string;


@end
