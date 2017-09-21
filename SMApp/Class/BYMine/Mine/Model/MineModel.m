//
//  MineModel.m
//  SMApp
//
//  Created by 家朋 on 2017/9/17.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "MineModel.h"

@implementation MineModel


+ (instancetype)initTitle:(NSString *)title
                     icon:(NSString *)icon
              isShowArrow:(BOOL)showArrow {
    
    MineModel *model = [MineModel new];
    model.title = title;
    model.icon = icon;
    model.showArrow = showArrow;
    
    return model;
}
@end
