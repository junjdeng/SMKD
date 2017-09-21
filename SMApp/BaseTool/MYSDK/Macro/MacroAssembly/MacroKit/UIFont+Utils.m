//
//  UIFont+Utils.m
//  ShiShi
//
//  Created by mac_KY on 17/5/16.
//  Copyright © 2017年 fec. All rights reserved.
//

#import "UIFont+Utils.h"

@implementation UIFont (Utils)
+(UIFont *(^)(CGFloat font))font
{
    return ^(CGFloat font){
    
        return [UIFont systemFontOfSize:font];
    };
    
}

/**系统加粗字体*/
+(UIFont *(^)(CGFloat boldFont))boldFont
{
    return ^(CGFloat boldFont){
        return [UIFont boldSystemFontOfSize:boldFont];
    };
}

@end
