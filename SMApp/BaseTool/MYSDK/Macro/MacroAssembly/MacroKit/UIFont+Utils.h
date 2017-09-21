//
//  UIFont+Utils.h
//  ShiShi
//
//  Created by mac_KY on 17/5/16.
//  Copyright © 2017年 fec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFont+Utils.h"

@interface UIFont (Utils)

/** 系统字体大小 */
+(UIFont *(^)(CGFloat font))font;

/**
 系统加粗字体
 */
+(UIFont *(^)(CGFloat boldFont))boldFont;


@end
