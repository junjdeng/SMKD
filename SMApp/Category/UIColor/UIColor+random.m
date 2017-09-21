//
//  UIColor+random.m
//  FECProject
//
//  Created by mac on 16/4/25.
//  Copyright © 2016年 FEC. All rights reserved.
//

#import "UIColor+random.h"

@implementation UIColor (random)

+ (instancetype) random{
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

@end
