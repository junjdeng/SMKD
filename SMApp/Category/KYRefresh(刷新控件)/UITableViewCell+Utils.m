//
//  UITableViewCell+Utils.m
//  ShiShi
//
//  Created by mac_KY on 17/5/12.
//  Copyright © 2017年 fec. All rights reserved.
//

#import "UITableViewCell+Utils.h"

#import <objc/runtime.h>

@implementation UITableViewCell (Utils)


static char *clickDelectModth_Key = "clickDelectModth_Key";


-(void)setClickDelectModth:(void (^)())clickDelectModth
{
    objc_setAssociatedObject(self, clickDelectModth_Key, clickDelectModth,OBJC_ASSOCIATION_COPY);
}
-(void (^)())clickDelectModth
{
    return objc_getAssociatedObject(self, clickDelectModth_Key);
}
/** 动态添加一个点击删除的方法 */

-(void)addDelectModthFont:(CGFloat )font color:(UIColor *)color
{
    UIView *deleteBgView = [UIView new];
    deleteBgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:deleteBgView];
    
    UIButton *delectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [delectBtn setTitle:@"删除" forState:UIControlStateNormal];
    delectBtn.titleLabel.font  = [UIFont systemFontOfSize:font];
    [delectBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [delectBtn setBackgroundColor:color];
    
    [deleteBgView addSubview:delectBtn];
    deleteBgView.sd_layout
    .leftSpaceToView(self.contentView,kScreenWidth)
    .topEqualToView(self.contentView)
    .bottomSpaceToView(self.contentView,-1)
    .widthIs(200);
    
    delectBtn.sd_layout
    .leftSpaceToView(deleteBgView,20)
    .topEqualToView(deleteBgView)
    .bottomEqualToView(deleteBgView)
    .widthIs(50);
 
}


-(void)setTheCellLeftImageSize:(CGSize)size
{
    
    CGSize itemSize = size;
    UIGraphicsBeginImageContext(itemSize);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [self.imageView.image drawInRect:imageRect];
    self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

@end
