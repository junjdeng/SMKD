//
//  NSAttributedString+ColorSize.m
//  FECProject
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 FEC. All rights reserved.
//

#import "NSAttributedString+ColorSize.h"

@implementation NSAttributedString (ColorSize)

+ (instancetype)attributedStringWithString:(NSString *)string size:(CGFloat)fontSize color:(UIColor *)color{
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                           NSForegroundColorAttributeName:color};
    return [[NSAttributedString alloc] initWithString:string?string:@"" attributes:dict];
}

@end
