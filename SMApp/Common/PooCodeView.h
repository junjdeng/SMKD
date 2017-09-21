//
//  PooCodeView.h
//  Code
//
//  Created by crazypoo on 14-4-14.
//  Copyright (c) 2014年 crazypoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PooCodeView;

@protocol PooCodeViewDelegate <NSObject>

- (void) pooCodeViewDidChange:(PooCodeView *) pooCodeView;

@end

@interface PooCodeView : UIView

@property (nonatomic, weak) id<PooCodeViewDelegate> delegate;

@property (nonatomic, retain) NSArray *changeArray;
@property (nonatomic, retain) NSMutableString *changeString;
@property (nonatomic, retain) UILabel *codeLabel;
@end
