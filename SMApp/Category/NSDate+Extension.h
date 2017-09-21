//
//  NSDate+Extension.h
//  quzai
//
//  Created by lx on 16/2/24.
//  Copyright © 2016年 FEC. All rights reserved.
//判断时间

#import <Foundation/Foundation.h>

@interface NSDate (Extension)
/**
 *  是否为今天
 */
- (BOOL)isToday;

/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;

- (NSDateComponents *)deltaWithNow;

@end
