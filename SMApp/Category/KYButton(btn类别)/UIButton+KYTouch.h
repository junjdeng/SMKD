//
//  UIButton+KYTouch.h
//  TestCell
//
//  Created by Frank on 17/1/4.
//  Copyright © 2017年 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>
#define defaultInterval .1// 默认间隔时间

@interface UIButton (KYTouch)
/**
 *  设置点击时间间隔
 */
@property (nonatomic, assign) NSTimeInterval timeInterVal;

@end
