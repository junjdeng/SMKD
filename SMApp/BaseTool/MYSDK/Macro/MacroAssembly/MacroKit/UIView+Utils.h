//
//  UIView+Utils.h
//  ShiShi
//
//  Created by mac_KY on 17/5/16.
//  Copyright © 2017年 fec. All rights reserved.
//

#import <UIKit/UIKit.h>



//全局常量定义


typedef NS_ENUM(NSUInteger,KYAnnimationOptions) {
    
    KYAnnimationOptionsSHowFomUp, //从上边
    KYAnnimationOptionsShowLeft,//从左边
    KYAnnimationOptionsShowFromBotton,//从下边
    KYAnnimationOptionsShowFromRight//从右边
    
};


typedef NS_ENUM(NSUInteger, KYBezierOptions) {
    //从上边 左边 下边 右边
    KYBezierOptionsUp = 0,
    KYBezierOptionsLeft,
    KYBezierOptionsBottom ,
    KYBezierOptionsUpRight,
};


typedef NS_ENUM(NSUInteger, KYOscillatoryAnimationType) {
    KYOscillatoryAnimationToBigger = 0,//先变大后变小
    KYOscillatoryAnimationToSmaller,//先变小后变大
};

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (Utils)
//@interface UIView (ViewFrameGeometry)
@property CGPoint origin;
@property CGSize size;
@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

-(void)setConnerRediu;

-(void)setConnerRediu:(CGFloat )rediu;
-(void)setBorderWidth:(CGFloat)width;
-(void)setBorderColor:(UIColor *)color;
/**
 设置边框宽度和颜色
 
 @param color 边框颜色
 @param width 边框宽度
 */
-(void)setBorderByColor:(UIColor*)color width:(CGFloat)width;

/**
 设置动画
 
 @param show 显示还是隐藏
 @param option 显示方式
 @param duratime 动画时间  默认0.25
 */
-(void)setAnnimationShow:(BOOL)show annimationOption:(KYAnnimationOptions)option duratime:(CGFloat)duratime;


/**
 设置动画
 
 @param show 显示还是隐藏
 @param option 显示方式
 @param duratime 动画时间  默认0.25
 */
-(void)setAnnimationShow:(BOOL)show annimationOption:(KYAnnimationOptions)option duratime:(CGFloat)duratime completion:(void(^)(BOOL finish))completion;

/**
 有阻尼的弹性动画
 @param option 显示好方式
 @param duratime 动画时间
 */
-(void)setSpringAnnimationOption:(KYAnnimationOptions)option duratime:(CGFloat)duratime;


/**
 关键帧动画 连续几个点的直线运动
 
 @param points 点
 @param duratime 这整个的运动时间
 */
-(void)moveBypoints:(NSArray <NSValue*>*)points duratime:(CGFloat)duratime;



/**
 添加半圈移动动画（！有问题）
 
 @param point 终点
 @param duratime 动画时间
 @param bezierOptions 动画类型
 */
-(void)moveBezierTopoint:(CGPoint )point duratime:(CGFloat)duratime bezierOptions:(KYBezierOptions)bezierOptions;

/**
 多个item有时间差的进行阻尼动画  出现时间间隔：0.15*i
 
 @param views 需要动画的View
 @param option 动画方式
 @param duratime 动画时间
 */
+(void)setSpringAnimations:(NSArray <UIView*>*)views annimationOption:(KYAnnimationOptions)option duratime:(CGFloat)duratime;

/**
 大小重复改变动画
 
 @param layer view的layer
 @param type 先变大还是先变小
 */
+ (void)showOscillatoryAnimationWithLayer:(CALayer *)layer type:(KYOscillatoryAnimationType)type;



#pragma mark - prive 注意：内部使用 外部声明 不用调用
-(void)setAnnimationOption:(KYAnnimationOptions)option;
/// 点击事件的添加

- (void)addHanderBlock:(void(^)(UIView *sender))handerBlock;
@property(copy,nonatomic)void (^clickViewBlock)(UIView *view);





/*####################################################*/
#pragma mark -
#pragma mark - 使用链式思想开发的－优点 快速开发

/**
 设置边框颜色
 */
-(UIView *(^)(UIColor *borderColor))KYBorderColor;

/**
 设置边框宽度
 */
-(UIView *(^)(CGFloat borderWidth))KYBorderWidth;

/**
 快速设置圆角－cell内部禁止使用（避免卡屏） rediu可以不传－> rediu默认是width／2
 */
-(UIView *(^)(CGFloat rediu))KYCornerRediu;

#pragma mark - annimation

/*
 设置边框宽度和颜色 color.-> 边框颜色  width.-> 边框宽度
 */
-(UIView *(^)(UIColor *color,CGFloat width))KYBorderColorWidth;

- (UIView *(^)(CGFloat top))j_top;
- (UIView *(^)(CGFloat left))j_left;
- (UIView *(^)(CGFloat width))j_width;
- (UIView *(^)(CGFloat height))j_height;


#pragma mark - 自定的工厂控件

+ (instancetype )getViewLine;
+ (instancetype )getViewLine:(UIColor*)backColor
                      height:(CGFloat )height;
+(NSString *)cellID;

@end
