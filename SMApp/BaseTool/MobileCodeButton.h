//
//  MobileCodeButton.h
//  LoginVC
//
//  Created by mac on 16/4/21.
//  Copyright © 2016年 QQ:1787354782. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MobileCodeButton : UIButton

@property (nonatomic, copy) NSString *tips;
@property (nonatomic, assign) BOOL animate;

- (void) sendCode;
- (void) startActivityIndicator;
- (void) stopActivityIndicator;

@end
