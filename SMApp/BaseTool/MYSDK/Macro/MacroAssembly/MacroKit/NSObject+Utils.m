//
//  NSObject+Utils.m
//  ShiShi
//
//  Created by mac_KY on 17/5/16.
//  Copyright © 2017年 fec. All rights reserved.
//

#import "NSObject+Utils.h"

@implementation NSObject (Utils)

- (NSString * )nullString;
{
    NSString *obj = (NSString *)self;
    if (obj) {
        if (![obj isKindOfClass:[NSString class]]) {
            return @"";
        }
        if (obj == nil) {
            return @"";
        }
        if ([obj isEqualToString:@"<nill>"]||[obj isEqualToString:@"<null>"]||[obj isEqualToString:@""]||[obj isEqualToString:@"(null)"]) {
            return @"";
        }
      
        return obj;
    }
    return @"";
    
}
@end
