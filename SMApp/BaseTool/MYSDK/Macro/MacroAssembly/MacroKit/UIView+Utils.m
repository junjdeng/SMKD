//
//  UIView+Utils.m
//  ShiShi
//
//  Created by mac_KY on 17/5/16.
//  Copyright © 2017年 fec. All rights reserved.
//

#import "UIView+Utils.h"


CGPoint CGRectGetCenter(CGRect rect)
{
    CGPoint pt;
    pt.x = CGRectGetMidX(rect);
    pt.y = CGRectGetMidY(rect);
    return pt;
}

CGRect CGRectMoveToCenter(CGRect rect, CGPoint center)
{
    CGRect newrect = CGRectZero;
    newrect.origin.x = center.x-CGRectGetMidX(rect);
    newrect.origin.y = center.y-CGRectGetMidY(rect);
    newrect.size = rect.size;
    return newrect;
}

//@implementation UIView (ViewGeometry)
@implementation UIView (Utils)
- (CGPoint) origin
{
    return self.frame.origin;
}

- (void) setOrigin: (CGPoint) aPoint
{
    CGRect newframe = self.frame;
    newframe.origin = aPoint;
    self.frame = newframe;
}


- (CGSize) size
{
    return self.frame.size;
}

- (void) setSize: (CGSize) aSize
{
    CGRect newframe = self.frame;
    newframe.size = aSize;
    self.frame = newframe;
}


- (CGPoint) bottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint) bottomLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint) topRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}


- (CGFloat) height
{
    return self.frame.size.height;
}

- (void) setHeight: (CGFloat) newheight
{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

- (CGFloat) width
{
    return self.frame.size.width;
}

- (void) setWidth: (CGFloat) newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

- (CGFloat) top
{
    return self.frame.origin.y;
}

- (void) setTop: (CGFloat) newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat) left
{
    return self.frame.origin.x;
}

- (void) setLeft: (CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

- (CGFloat) bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void) setBottom: (CGFloat) newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat) right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void) setRight: (CGFloat) newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}


- (void) moveBy: (CGPoint) delta
{
    CGPoint newcenter = self.center;
    newcenter.x += delta.x;
    newcenter.y += delta.y;
    self.center = newcenter;
}


- (void) scaleBy: (CGFloat) scaleFactor
{
    CGRect newframe = self.frame;
    newframe.size.width *= scaleFactor;
    newframe.size.height *= scaleFactor;
    self.frame = newframe;
}


- (void) fitInSize: (CGSize) aSize
{
    CGFloat scale;
    CGRect newframe = self.frame;
    
    if (newframe.size.height && (newframe.size.height > aSize.height))
    {
        scale = aSize.height / newframe.size.height;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    if (newframe.size.width && (newframe.size.width >= aSize.width))
    {
        scale = aSize.width / newframe.size.width;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
    }
    
    self.frame = newframe;
}

#pragma mark - set 形状
-(void)setConnerRediu
{
    self.layer.cornerRadius = self.width/2;
    self.layer.masksToBounds = YES;
}
-(void)setConnerRediu:(CGFloat )rediu
{
    self.layer.cornerRadius = rediu/2;
    self.layer.masksToBounds = YES;
    
}


-(void)setBorderColor:(UIColor *)color
{
    self.layer.borderColor = color.CGColor;
    self.layer.masksToBounds = YES;
}
-(void)setBorderWidth:(CGFloat)width
{
    self.layer.borderWidth = width;
    self.layer.masksToBounds = YES;
    
}
//设置边框的
-(void)setBorderByColor:(UIColor *)color width:(CGFloat)width {
    [self.layer setBorderColor:color.CGColor];
    [self.layer setBorderWidth:width];
    [self.layer setMasksToBounds:YES];
    
    
}
/**
 设置动画
 
 @param show 显示还是隐藏
 @param option 显示方式
 @param duratime 动画时间  默认0.25
 */
-(void)setAnnimationShow:(BOOL)show annimationOption:(KYAnnimationOptions)option duratime:(CGFloat)duratime completion:(void(^)(BOOL finish))completion
{
    CGRect rect = self.frame;
    duratime = duratime>0 ? duratime:2.5;
    
    if (show) {
        [self setAnnimationOption: option];
        self.hidden = NO;
        //执行动画
        [UIView animateWithDuration:duratime animations:^{
            self.alpha = 1;
            self.frame = rect;
        }completion:^(BOOL finished) {
            completion(finished);
        }];
    }else{
        //隐藏动画
        [UIView animateWithDuration:duratime animations:^{
            self.alpha = 0;
            [self setAnnimationOption: option];
        }completion:^(BOOL finished) {
            self.frame = rect;
            self.alpha = 0;
            completion(finished);
        }];
    }
    
    
}

-(void)setAnnimationShow:(BOOL)show annimationOption:(KYAnnimationOptions)option duratime:(CGFloat)duratime
{
    CGRect rect = self.frame;
    duratime = duratime>0 ? duratime:2.5;
    
    if (show) {
        [self setAnnimationOption: option];
        self.hidden = NO;
        //执行动画
        [UIView animateWithDuration:duratime animations:^{
            self.alpha = 1;
            self.frame = rect;
        }completion:^(BOOL finished) {
            
        }];
    }else{
        //隐藏动画
        [UIView animateWithDuration:duratime animations:^{
            self.alpha = 0;
            [self setAnnimationOption: option];
        }completion:^(BOOL finished) {
            self.frame = rect;
            self.alpha = 0;
        }];
    }
    
}

/**
 有阻尼的弹性动画
 @param option 显示好方式
 @param duratime 动画时间
 */
-(void)setSpringAnnimationOption:(KYAnnimationOptions)option duratime:(CGFloat)duratime
{
    
    CGRect rect = self.frame;
    duratime = duratime>0 ? duratime:2.5;
    [self setAnnimationOption: option];
    self.hidden = NO;
    //执行动画
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1;
        self.frame = rect;
    } completion:^(BOOL finished) {
        
    }];
    
}

/**
 关键帧动画 连续几个点的直线运动
 
 @param points 点
 @param duratime 这整个的运动时间
 */
-(void)moveBypoints:(NSArray <NSValue*>*)points duratime:(CGFloat)duratime;
{
    CAKeyframeAnimation *keyFA = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //value数组，放所有位置信息，如果设置path，此项会被忽略
    keyFA.values = points;
    
    keyFA.duration = duratime ? duratime :5.0f;
    //重复次数，小于0无限重复
    keyFA.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    keyFA.fillMode = kCAFillModeForwards;
    keyFA.calculationMode = kCAAnimationPaced;
    //旋转的模式,auto就是沿着切线方向动，autoReverse就是转180度沿着切线动
    keyFA.rotationMode = kCAAnimationRotateAuto;
    //结束后是否移除动画
    keyFA.removedOnCompletion = YES;
    //添加动画
    [self.layer addAnimation:keyFA forKey:@"position"];
    
}

-(void)moveBezierTopoint:(CGPoint )point duratime:(CGFloat)duratime bezierOptions:(KYBezierOptions)bezierOptions
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:self.center];
    
    CGPoint center = CGPointMake(self.center.x+(point.x - self.center.x)/2,self.center.y+ (point.y - self.center.y)/2);
    CGFloat deltaX = point.x - self.center.x;
    CGFloat deltaY = point.y - self.center.y;
    CGFloat rediu =  sqrt(deltaX*deltaX + deltaY*deltaY);
    
    CGFloat startAngle = 0;
    //判断是不是 逆时针
    BOOL clockwise = YES;
    switch (bezierOptions) {
        case KYBezierOptionsUp:{
            
            clockwise = deltaX > 0;
            startAngle = - M_PI_2+(clockwise?0:M_PI_2);
        }break;
        case KYBezierOptionsLeft:{
            clockwise = deltaY > 0;
            startAngle = - M_PI_4+(clockwise?0:M_PI_2);
            
        }break;
        case KYBezierOptionsBottom:{
            clockwise = deltaX < 0;
            startAngle = - M_PI_2+(clockwise?M_PI_2:0);
            
        }break;
        case KYBezierOptionsUpRight:{
            clockwise = deltaY < 0;
            startAngle = - M_PI_4+(clockwise?M_PI_2:0);
            
        }break;
            
        default:
            break;
    }
    CGFloat endAngle = startAngle +(clockwise?M_PI_2:-M_PI_2);
    [bezierPath addArcWithCenter:center radius:rediu/2 startAngle:startAngle endAngle:endAngle clockwise:clockwise];
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [keyFrameAnimation setDuration:duratime];
    keyFrameAnimation.path = bezierPath.CGPath;
    keyFrameAnimation.repeatCount = 0;
    keyFrameAnimation.fillMode = kCAFillModeForwards;
    keyFrameAnimation.removedOnCompletion = YES;
    [self.layer addAnimation:keyFrameAnimation forKey:@"movingAnimation"];
    
    self.center = point;
}


/**
 多个item有时间差的进行阻尼动画  出现时间间隔：0.15*i
 
 @param views 需要动画的View
 @param option 动画方式
 @param duratime 动画时间
 */
+(void)setSpringAnimations:(NSArray <UIView*>*)views annimationOption:(KYAnnimationOptions)option duratime:(CGFloat)duratime
{
    
    for (int i=0; i<views.count; i++) {
        UIView *view = views[i];
        CGRect rect = view.frame;
        duratime = duratime>0 ? duratime:2.5;
        [view setAnnimationOption:option];
        view.hidden = NO;
        //执行动画
        [UIView animateWithDuration:duratime delay:i*0.15 usingSpringWithDamping:0.5 initialSpringVelocity:1.3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            view.alpha = 1;
            view.frame = rect;
        } completion:^(BOOL finished) {
            
        }];
        
    }
}

+ (void)showOscillatoryAnimationWithLayer:(CALayer *)layer type:(KYOscillatoryAnimationType)type
{
    NSNumber *animationScale1 = type == KYOscillatoryAnimationToBigger ? @(1.15) : @(0.5);
    NSNumber *animationScale2 = type == KYOscillatoryAnimationToBigger ? @(0.92) : @(1.15);
    
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        [layer setValue:animationScale1 forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
            [layer setValue:animationScale2 forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                [layer setValue:@(1.0) forKeyPath:@"transform.scale"];
            } completion:nil];
        }];
    }];
}


#pragma mark - prive
-(void)setAnnimationOption:(KYAnnimationOptions)option
{
    UIView *supView = self.superview;
    switch (option) {
            //从上面出现上  下   左   右
        case KYAnnimationOptionsSHowFomUp:{
            self.bottom = 0;
        }break;
        case KYAnnimationOptionsShowFromBotton:{
            
            self.top = supView.height;
        }break;
        case KYAnnimationOptionsShowLeft:{
            self.right = 0;
        }break;
        case KYAnnimationOptionsShowFromRight:{
            self.left  =  supView.width;
        }break;
            
        default:
            break;
    }
}



#pragma mark - 添加点击事件
static char *clickViewBlockKey = "clickViewBlockKey";
-(void (^)(UIView *))clickViewBlock
{
    return  objc_getAssociatedObject(self, clickViewBlockKey);
}


-(void)setClickViewBlock:(void (^)(UIView *))clickViewBlock
{
    objc_setAssociatedObject(self, clickViewBlockKey, clickViewBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (void)addHanderBlock:(void(^)(UIView *sender))handerBlock
{
    self.clickViewBlock = handerBlock;
    if ([self isKindOfClass:[UIButton class]]) {
        UIButton *sender = (UIButton *)self;
        [sender addTarget:self action:@selector(clickViewButton:) forControlEvents:UIControlEventTouchUpInside];
    }else{
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickView:)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:tap];
        
    }
    
}

- (void)clickViewButton:(UIButton *)sedner {
    self.clickViewBlock(sedner);
}

-(void)clickView:(UITapGestureRecognizer *)tap {
    
    if (self.clickViewBlock) {
        self.clickViewBlock(tap.view);
    }
}





/*####################################################*/
#pragma mark - 使用链式思想开发的－优点 快速开发


/**
 设置边框颜色
 */
-(UIView *(^)(UIColor *borderColor))KYBorderColor
{
    return ^(UIColor *borderColor){
        self.layer.borderColor =borderColor.CGColor;
        self.layer.masksToBounds = YES;
        return self;
    };
}

/**
 设置边框宽度
 */
-(UIView *(^)(CGFloat borderWidth))KYBorderWidth
{
    return ^(CGFloat borderWidth){
        self.layer.borderWidth = borderWidth;
        self.layer.masksToBounds = YES;
        return self;
    };
}

///用一个直径来画出圆角图片
-(UIView *(^)(CGFloat rediu))KYCornerRediu;
{
    return ^(CGFloat rediu){
        rediu = rediu>0 ? rediu :self.width/2;
        self.layer.cornerRadius =rediu;
        self.layer.masksToBounds = YES;
        return self;
    };
}

/*
 设置边框宽度和颜色 color.-> 边框颜色  width.-> 边框宽度
 */
-(UIView *(^)(UIColor *color,CGFloat width))KYBorderColorWidth
{
    return ^(UIColor *color,CGFloat width){
        self.layer.masksToBounds = YES;
        self.layer.borderColor = color.CGColor;
        self.layer.borderWidth = width;
        return self;
    };
}
- (UIView *(^)(CGFloat top))j_top {
    return ^(CGFloat top){
        self.top = top;
        return self;
    };
}
- (UIView *(^)(CGFloat left))j_left {
    return ^(CGFloat left){
        self.left = left;
        return self;
    };
}
- (UIView *(^)(CGFloat width))j_width {
    return ^(CGFloat width){
        self.width = width;
        return self;
    };
}
- (UIView *(^)(CGFloat height))j_height {
    return ^(CGFloat height){
        self.height = height;
        return self;
    };
}


#pragma mark - 自定的工厂控件
+ (instancetype )getViewLine {
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    line.backgroundColor = GlobalBackColor;
    return line;
}
+ (instancetype )getViewLine:(UIColor*)backColor
                      height:(CGFloat )height {
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, height)];
    line.backgroundColor = backColor;
    return line;
}

+(NSString *)cellID {
    return NSStringFromClass([self class]);
}

@end
