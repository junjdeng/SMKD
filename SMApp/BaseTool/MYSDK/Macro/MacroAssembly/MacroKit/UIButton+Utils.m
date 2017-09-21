//
//  UIButton+Utils.m
//  SMApp
//
//  Created by 家朋 on 2017/9/17.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "UIButton+Utils.h"

@implementation UIButton (Utils)

// 返回一个白色标题 有背景颜色和圆角的按钮
+ (instancetype)buttonWithTitle:(NSString *)title
                      backColor:(UIColor *)backColor
                    cornerRediu:(CGFloat)cornerRediu {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setConnerRediu:cornerRediu];
    button.backgroundColor = backColor;
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    return button;
}

@end
