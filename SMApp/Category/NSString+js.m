//
//  NSString+js.m
//  quzai
//
//  Created by mac on 16/3/21.
//  Copyright © 2016年 FEC. All rights reserved.
//

#import "NSString+js.h"

@implementation NSString (js)

+ (instancetype)getJSWithScreentWidth:(CGFloat) width{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"webviewDeal.js" ofType:nil];
    
    NSString *js = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
   
    return [NSString stringWithFormat:@"%@ \n autoSizeFit(%@);",js,[NSString stringWithFormat:@"%.2f",width]];
}

+ (instancetype)getHotNewJSWithScreentWidth:(CGFloat) width{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"hotNewWebviewDeal.js" ofType:nil];
    
    NSString *js = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    
    return [NSString stringWithFormat:@"%@ \n autoSizeFit(%@);",js,[NSString stringWithFormat:@"%.2f",width]];
}

@end
