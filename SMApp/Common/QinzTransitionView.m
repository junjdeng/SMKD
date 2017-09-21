//
//  TransitionView.m
//  FEC
//
//  Created by Qinz on 16/10/13.
//  Copyright © 2016年 FEC. All rights reserved.
//

#import "QinzTransitionView.h"

#define KOrientation(orientation)  orientation;

@implementation QinzTransitionView


+(void)setType:(NSString*)type andControlleView:( UIView*)controlleView Time:(CGFloat)time Orientation:(NSString*)orientation{

    /*
     fade //交叉淡化过渡(不支持过渡方向)
     push //新视图把旧视图推出去
     moveIn //新视图移到旧视图上面 
     reveal //将旧视图移开,显示下面的新视图 
     cube //立方体翻滚效果 
     oglFlip //上下左右翻转效果 
     suckEffect //收缩效果，向布被抽走(不支持过渡方向) 
     rippleEffect //水波效果(不支持过渡方向) 
     pageCurl //向上翻页效果
     pageUnCurl //向下翻页效果 
     cameraIrisHollowOpen //相机镜头打开效果(不支持过渡方向) cameraIrisHollowClose //相机镜头关上效果(不支持过渡方向)
     */
    
    //转场动画
    CATransition *transition = [CATransition new];
    //设置动画类型
    transition.type = type;
    transition.subtype = KOrientation(orientation);
    /*
     有的效果可以设置不同的方向
     transition.subtype = kCATransitionFromLeft;
     kCATransitionFromRight
     kCATransitionFromTop
     kCATransitionFromBottom
     */
    transition.duration = time;
    //自定义转场动画
    [controlleView.superview.layer addAnimation:transition forKey:@"transition"];
    
}


@end
