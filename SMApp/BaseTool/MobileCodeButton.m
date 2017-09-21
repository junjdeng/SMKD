//
//  MobileCodeButton.m
//  LoginVC
//
//  Created by mac on 16/4/21.
//  Copyright © 2016年 QQ:1787354782. All rights reserved.
//

#import "MobileCodeButton.h"

@interface MobileCodeButton ()

@property (nonatomic, weak) UIActivityIndicatorView *indicatorView;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) CAAnimationGroup *animation;

@end

@implementation MobileCodeButton

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void) setup{
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _indicatorView = indicatorView;
    [self insertSubview:_indicatorView aboveSubview:self.titleLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _indicatorView.center = self.titleLabel.center;
}

- (void) startActivityIndicator{
    [_indicatorView startAnimating];
    self.enabled =NO;
    [self setTitle:@"" forState:UIControlStateDisabled];
}

- (void) stopActivityIndicator{
    [_indicatorView stopAnimating];
    self.enabled =YES;
    [self setTitle:_tips forState:UIControlStateNormal];
}

-(void)sendCode{
    [_indicatorView stopAnimating];
    [self performSelector:@selector(countClick) withObject:nil];
}

-(void)countClick
{
    self.enabled =NO;
    _count = 60;
    [self setTitle:[NSString stringWithFormat:@"%zds",_count] forState:UIControlStateDisabled];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    if (_animate) {
        [self numAnimation];
    }
}

-(void)timerFired:(NSTimer *)timer
{
    if (_count !=1) {
        _count -=1;
        [self setTitle:[NSString stringWithFormat:@"%zds",_count] forState:UIControlStateDisabled];
    }else{
        [timer invalidate];
        self.enabled = YES;
        [self.titleLabel.layer removeAllAnimations];
        [self setTitle:_tips forState:UIControlStateNormal];
    }
}

- (void) numAnimation{
    CFTimeInterval duration = 1;
    CFTimeInterval beginTime = CACurrentMediaTime();
    // Scale animation
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    
    scaleAnimation.keyTimes = @[@0, @0.5, @1];
    scaleAnimation.values = @[@1, @1.5, @2];
    scaleAnimation.duration = duration;
    
    // Opacity animation
    CAKeyframeAnimation *opacityAnimaton = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    
    opacityAnimaton.keyTimes = @[@0, @0.5, @1];
    opacityAnimaton.values = @[@1, @0.5, @0];
    opacityAnimaton.duration = duration;
    
    // Animation
    CAAnimationGroup *animation = [CAAnimationGroup animation];
    _animation = animation;
    animation.animations = @[scaleAnimation, opacityAnimaton];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = duration;
    animation.repeatCount = HUGE;
    animation.removedOnCompletion = NO;
    
    animation.beginTime = beginTime;
    [self.titleLabel.layer addAnimation:animation forKey:@"animation"];
}

@end
