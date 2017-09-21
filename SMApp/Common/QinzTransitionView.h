//
//  TransitionView.h
//  FEC
//
//  Created by Qinz on 16/10/13.
//  Copyright © 2016年 Qinz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QinzTransitionView : NSObject

/**
 转场动画

 @param type          动画类型
 @param controlleView 当前控制器的视图
 @param time          执行动画的时间
 @param orientation   动画的方向
 */
+(void)setType:(NSString*)type andControlleView:(UIView*)controlleView Time:(CGFloat)time Orientation:(NSString*)orientation;

@end
