//
//  NSAttributedString+ColorSize.h
//  FECProject
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 FEC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (ColorSize)

+ (instancetype)attributedStringWithString:(NSString *)string size:(CGFloat)fontSize color:(UIColor *)color;

@end
