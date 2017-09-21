//
//  MineModel.h
//  SMApp
//
//  Created by 家朋 on 2017/9/17.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineModel : NSObject



@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,assign,getter=isShowArrow)BOOL showArrow;

+ (instancetype)initTitle:(NSString *)title
                     icon:(NSString *)icon
              isShowArrow:(BOOL)showArrow;

@end
