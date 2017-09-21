//
//  UIBarButtonItem+FECRightNavItems.h
//  RightNavItem
//
//  Created by Qinz on 16/12/5.
//  Copyright © 2016年 FEC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (FECRightNavItems)


/**
 设置导航栏右侧按钮
 
 @param norImags 默认图片
 @param highImags 点击按钮高亮图片
 @param width 按钮的宽度
 @param height 按钮的高度 默认要设置为44
 @param viewContelloer 传入当前的控制器
 @param block 点击按钮的回调
 */
+(void)setNorImags:(NSArray*)norImags HighImags:(NSArray*)highImags Width:(CGFloat)width Height:(CGFloat)height ViewContelloer:(UIViewController*)viewContelloer withBlock:(void (^)(NSInteger))block;

@end
