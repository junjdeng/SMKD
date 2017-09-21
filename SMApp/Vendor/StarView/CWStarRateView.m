//
//  CWStarRateView.m
//  StarRateDemo
//
//  Created by WANGCHAO on 14/11/4.
//  Copyright (c) 2014年 wangchao. All rights reserved.
//

#import "CWStarRateView.h"

#define FOREGROUND_STAR_IMAGE_NAME @"xingji_sel"
#define BACKGROUND_STAR_IMAGE_NAME @"xingji_nol"
#define DEFALUT_STAR_NUMBER 5
#define ANIMATION_TIME_INTERVAL 0.2
#define kPadding 0  //有空隙的话 评分会有问题  空隙是ac加的

@interface CWStarRateView ()

@property (nonatomic, strong) UIView *foregroundStarView;
@property (nonatomic, strong) UIView *backgroundStarView;



@end

@implementation CWStarRateView

#pragma mark - Init Methods
- (instancetype)init {
    NSAssert(NO, @"You should never call this method in this class. Use initWithFrame: instead!");
    return nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame numberOfStars:DEFALUT_STAR_NUMBER];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _numberOfStars = DEFALUT_STAR_NUMBER;
        [self buildDataAndUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars {
    if (self = [super initWithFrame:frame]) {
        _numberOfStars = numberOfStars;
        [self buildDataAndUI];
    }
    return self;
}

- (void)setForegroundStarImage:(NSString *)foregroundStarImage{
    _foregroundStarImage = foregroundStarImage;
    [self buildDataAndUI];
}

- (void)setBackgroundStarImage:(NSString *)backgroundStarImage{
    _backgroundStarImage = backgroundStarImage;
    [self buildDataAndUI];
}

#pragma mark - Private Methods

- (void)buildDataAndUI {
    _scorePercent = 1;//默认为1
    _hasAnimation = NO;//默认为NO
    _allowIncompleteStar = NO;//默认为NO
    
    [self.foregroundStarView removeFromSuperview];
    [self.backgroundStarView removeFromSuperview];
    
    if (_foregroundStarImage) {
        self.foregroundStarView = [self createStarViewWithImage:_foregroundStarImage];
    }else{
        self.foregroundStarView = [self createStarViewWithImage:FOREGROUND_STAR_IMAGE_NAME];
    }
    
    if (_backgroundStarImage) {
        self.backgroundStarView = [self createStarViewWithImage:_backgroundStarImage];
    }else{
        self.backgroundStarView = [self createStarViewWithImage:BACKGROUND_STAR_IMAGE_NAME];
    }
    
    [self addSubview:self.backgroundStarView];
    [self addSubview:self.foregroundStarView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_hasTouch) {
        //获取点击的x值
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        CGFloat x = point.x;
        //通过修改scorePercent来计算得分
        CGFloat scorePercent = x*1.0f/self.bounds.size.width;
        self.scorePercent = scorePercent;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesBegan:touches withEvent:event];
}

- (UIView *)createStarViewWithImage:(NSString *)imageName {
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    
    CGFloat width = (self.bounds.size.width-(self.numberOfStars-1)*kPadding)/self.numberOfStars;
    for (NSInteger i = 0; i < self.numberOfStars; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * (width+kPadding), 0, width, width);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    return view;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak CWStarRateView *weakSelf = self;
    
    CGFloat animationTimeInterval = self.hasAnimation ? ANIMATION_TIME_INTERVAL : 0;
    [UIView animateWithDuration:animationTimeInterval animations:^{
       weakSelf.foregroundStarView.frame = CGRectMake(0, 0, weakSelf.bounds.size.width * weakSelf.scorePercent, weakSelf.bounds.size.height);
    }];
}

#pragma mark - Get and Set Methods

- (void)setScorePercent:(CGFloat)scroePercent {
    if (_scorePercent == scroePercent) {
        return;
    }
    
    if (scroePercent < 0) {
        _scorePercent = 0;
    } else if (scroePercent > 1) {
        _scorePercent = 1;
    } else {
        _scorePercent = scroePercent;
    }
    
    if ([self.delegate respondsToSelector:@selector(starRateView:scroePercentDidChange:)]) {
        [self.delegate starRateView:self scroePercentDidChange:scroePercent];
    }
    
    [self setNeedsLayout];
}

@end
