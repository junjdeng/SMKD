//
//  JTextView.m
//  SMApp
//
//  Created by 家朋 on 2017/9/26.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "JTextView.h"
static CGFloat textCountLbWidth = 50;

@interface JTextView ()<UITextViewDelegate>
//这里先拿出这个label以方便我们后面的使用

@property(nonatomic,strong)UILabel *textCountLb;

@property (nonatomic,strong)UITextView *textView;

@end
@implementation JTextView



-(instancetype)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    
    if(self) {
        self.backgroundColor = [UIColor whiteColor];
        [self loadSubViews];
        
    }
    return self;
}

-(void)loadSubViews{
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height - 18)];
    textView.textContainerInset = UIEdgeInsetsMake(1, 1, 1, 1);
    textView.backgroundColor= [UIColor clearColor];
    textView.delegate = self;
    textView.font = [UIFont systemFontOfSize:16];
    [self addSubview:textView];
    self.textView = textView;
    //字数显示
    _textCountLb = [[UILabel alloc]initWithFrame:CGRectMake(self.width - textCountLbWidth, self.height - 17, textCountLbWidth, 15)];
    [self addSubview:_textCountLb];
    _textCountLb.hidden = YES;
    _textCountLb.font  =[UIFont systemFontOfSize:12];
    _textCountLb.textColor  =[UIColor lightGrayColor];
    self.KYPlaceholderColor= [UIColor colorWithRed:0.737 green:0.733 blue:0.737 alpha:1.000];
    
    // 通知:监听文字的改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self.textView];
}

#pragma mark -监听文字改变
- (void)textDidChange
{
    
    if ([self.textView.text isEqualToString:_KYPlaceholder]) {
        
    }else{
        _textCountLb.text = [NSString stringWithFormat:@"%ld/%ld",self.textView.text.length,_maxTextCount];
        
    }
    
    if (self.textView.text.length>_maxTextCount-1) {
        
    }
    
    _textCountLb.textColor =(self.textView.text.length >_maxTextCount-1)? [UIColor redColor]:[UIColor lightGrayColor];
    
}

#pragma mark - UITextViewDelegate

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    //一定可以删除
    if (text.length == 0) {
        
        return YES;
    }
    if (_maxTextCount && (range.location >_maxTextCount -1)) {
        [[UIApplication sharedApplication].keyWindow makeToast:[NSString stringWithFormat:@"输入文字已超过%ld个",_maxTextCount]];
        return NO;
    }
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if ([self.textView.text isEqualToString:_KYPlaceholder]) {
        self.textView.text = @"";
        self.textView.textColor = [UIColor blackColor];
    }
    
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if (self.textView.text.length==0) {
        self.textView.text = _KYPlaceholder;
        self.textView.textColor = _KYPlaceholderColor;
    }
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if (_textDidEditing) {
        _textDidEditing();
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (_textDidEndEditing) {
        _textDidEndEditing();
    }
}
#pragma mark - SET


-(void)setMaxTextCount:(NSUInteger)maxTextCount
{
    _maxTextCount = maxTextCount;
    _textCountLb.text = [NSString stringWithFormat:@"0/%ld",maxTextCount];
    _textCountLb.hidden = NO;
    
}
-(void)setKYPlaceholder:(NSString *)KYPlaceholder
{
    _KYPlaceholder = KYPlaceholder;
    self.textView.text = KYPlaceholder;
    self.textView.textColor = _KYPlaceholderColor;
    
}

-(void)setKYPlaceholderColor:(UIColor *)KYPlaceholderColor
{
    _KYPlaceholderColor = KYPlaceholderColor;
    self.textView.textColor = KYPlaceholderColor;
}

-(void)setFont:(UIFont *)font
{
    _font = font;
    self.textView.font = font;
}

#pragma mark - GET

-(NSString *)text{
    
    return  [self.textView.text isEqualToString:self.KYPlaceholder]?@"":self.textView.text;
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    self.textView.delegate = nil;
}
@end
