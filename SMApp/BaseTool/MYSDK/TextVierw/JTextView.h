//
//  JTextView.h
//  SMApp
//
//  Created by 家朋 on 2017/9/26.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTextView : UIView
/* 提示文字*/
@property(nonatomic,copy) NSString *KYPlaceholder;
/* 提示文字文字颜色*/
@property(nonatomic,strong) UIColor *KYPlaceholderColor;
/* 最大文字个数*/
@property(nonatomic,assign)NSUInteger maxTextCount;//默认200个


@property (nonatomic,strong)NSString *text;
@property (nonatomic,strong)UIFont *font;

@property (nonatomic,copy)void (^textDidEditing)();
@property (nonatomic,copy)void (^textDidEndEditing)();


@end
