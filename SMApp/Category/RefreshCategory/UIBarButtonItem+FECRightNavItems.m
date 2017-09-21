//
//  UIBarButtonItem+FECRightNavItems.m
//  RightNavItem
//
//  Created by Qinz on 16/12/5.
//  Copyright © 2016年 FEC. All rights reserved.
//

#import "UIBarButtonItem+FECRightNavItems.h"

typedef void(^ClickBlock)(NSInteger);


@implementation UIBarButtonItem (FECRightNavItems)


static ClickBlock ablock;

+(void)setNorImags:(NSArray*)norImags HighImags:(NSArray*)highImags Width:(CGFloat)width Height:(CGFloat)height ViewContelloer:(UIViewController*)viewContelloer withBlock:(void (^)(NSInteger))block
{
    
    NSMutableArray*barBtnArr = [NSMutableArray array];
    UIToolbar*tools=[[UIToolbar alloc]initWithFrame:CGRectMake(-5, 0, width*(norImags.count), height)];
    tools.backgroundColor = [UIColor clearColor];
    //解决出现的那条线
    tools.clipsToBounds = YES;
    //解决tools背景颜色的问题
    [tools setBackgroundImage:[UIImage new]forToolbarPosition:UIBarPositionAny                      barMetrics:UIBarMetricsDefault];
    [tools setShadowImage:[UIImage new]
       forToolbarPosition:UIToolbarPositionAny];
    
    for (int i = 0;i<norImags.count;i++){
        UIButton*btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*width, 0, width, height);
        [btn setImage:[UIImage imageNamed:norImags[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:highImags[i]] forState:UIControlStateHighlighted];
        
        [tools addSubview:btn];
        
        btn.tag = i;
        
        [btn addTarget:self action:@selector(upInside:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [barBtnArr addObject:barBtn];
        
    }
    UIBarButtonItem*btn=[[UIBarButtonItem alloc]initWithCustomView:tools];
    
    //    调整间距
    UIBarButtonItem *navigationSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    /**
     *  width为负数时，相当于rightButton往 右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整为0；
     *  width为正数时，相当于rightButton往 左移动width数值个像素
     */
    navigationSpacer.width = -17;
    
    viewContelloer.navigationItem.rightBarButtonItems  = [NSArray arrayWithObjects:navigationSpacer,btn, nil];
    
    ablock  = block;
}

+(void)upInside:(UIButton*)btn{
    
    ablock(btn.tag);
}


@end
