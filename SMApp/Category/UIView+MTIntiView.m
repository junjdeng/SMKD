//
//  UIView+MTIntiView.m
//  MingTai
//
//  Created by apple on 2017/6/27.
//  Copyright © 2017年 FEC. All rights reserved.
//

#import "UIView+MTIntiView.h"

@implementation UIView (MTIntiView)

+ (instancetype)getMyself {
    Class c = [self class];
    id view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(c) owner:self options:nil]lastObject];
    return view;
    
}


@end
