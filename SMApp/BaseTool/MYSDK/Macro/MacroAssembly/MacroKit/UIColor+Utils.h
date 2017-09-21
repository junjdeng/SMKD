//
//  UIColor+Utils.h
//  ShiShi
//
//  Created by mac_KY on 17/5/16.
//  Copyright © 2017年 fec. All rights reserved.
//

#import <UIKit/UIKit.h>

UIFont* kFont(CGFloat font);

@interface UIColor (Utils)



@property (nonatomic, assign) float r;
@property (nonatomic, assign) float g;
@property (nonatomic, assign) float b;
@property (nonatomic, assign) float apha;

//十六进制生成颜色
+ (UIColor *)colorWithHexString:(NSString *)color;


#pragma mark - Make
/**
 使用类分代替宏

 @param ^ RABGB
 @return 颜色
 */
+(UIColor *(^)(CGFloat r,CGFloat g,CGFloat b,CGFloat a))RGBA;


@end
