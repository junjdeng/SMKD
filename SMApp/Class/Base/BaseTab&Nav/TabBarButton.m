//
//  CJBtn.m
//  超简非侧滑
//
//  Created by lukyshine on 16/2/12.
//  Copyright © 2016年 cjapp.com.cn. All rights reserved.
//

#import "TabBarButton.h"

@implementation TabBarButton
#define kTitleRatio 0.4

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        // 2.文字大小
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        
        // 3.图片的内容模式
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        // 4.设置选中时的背景
        //        [self setBackgroundImage:[UIImage imageNamed:@"main_badge.png"] forState:UIControlStateSelected];
    }
    return self;
}

#pragma mark 覆盖父类在highlighted时的所有操作
- (void)setHighlighted:(BOOL)highlighted {
    //    [super setHighlighted:highlighted];
}

#pragma mark 调整内部ImageView的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    CGFloat imageX = 0;
    CGFloat imageY = 4;
    CGFloat imageWidth = contentRect.size.width;
    CGFloat imageHeight = contentRect.size.height * ( 1- kTitleRatio );
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

#pragma mark 调整内部UILabel的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleHeight = contentRect.size.height * kTitleRatio;
    CGFloat titleY = contentRect.size.height - titleHeight;
    CGFloat titleWidth = contentRect.size.width;
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}





@end
