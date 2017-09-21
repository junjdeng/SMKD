 //
//  UITableViewCell+Utils.h
//  ShiShi
//
//  Created by mac_KY on 17/5/12.
//  Copyright © 2017年 fec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Utils)



/** 动态添加一个点击删除的方法 */
@property(nonatomic,copy)void (^clickDelectModth)();

-(void)addDelectModthFont:(CGFloat )font color:(UIColor *)color;


-(void)setTheCellLeftImageSize:(CGSize)size;

@end
  
