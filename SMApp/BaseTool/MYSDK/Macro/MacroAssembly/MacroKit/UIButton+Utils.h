//
//  UIButton+Utils.h
//  SMApp
//
//  Created by 家朋 on 2017/9/17.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Utils)

// 返回一个白色标题 有背景颜色和圆角的按钮
+ (instancetype)buttonWithTitle:(NSString *)title
                      backColor:(UIColor *)backColor
                    cornerRediu:(CGFloat)cornerRediu;
@end
