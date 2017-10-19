//
//  BaseNavigationController.m
//  QinzBaseProject
//
//  Created by Qinz on 2017/4/19.
//  Copyright © 2017年 Qinz. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIImage+JKColor.h"
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController


//使用到时初始化
+ (void)initialize{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = [UIColor redColor];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    
    UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    navigationBar.tintColor = [UIColor redColor];
    //设置导航栏背景颜色
    navigationBar.barTintColor = UIColorFromRGB(660000);
    //设置导航栏的阴影
   // navigationBar.shadowImage = [UIImage new];
    //设置导航栏背景图片(注意，图片有可能需要拉伸)
    UIImage *backImage = [UIImage jk_imageWithColor:[UIColor whiteColor] size:CGSizeMake(kScreenWidth, 64)];
    
    [navigationBar setBackgroundImage:backImage forBarMetrics:UIBarMetricsDefault];
    
    [navigationBar setTitleTextAttributes:dic];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (!([viewController isEqual:[self.viewControllers firstObject]] || self.viewControllers.count==0)) {//非根控制器
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *leftNaviBtn = [UIButton buttonWithType:UIButtonTypeCustom];
         leftNaviBtn.frame=CGRectMake(0, 0, 40, 40);
        [leftNaviBtn setImage:[UIImage imageNamed:@"btn_title_back"] forState:UIControlStateNormal];
        [leftNaviBtn setImage:[UIImage imageNamed:@"btn_title_back"] forState:UIControlStateHighlighted];
        leftNaviBtn.imageEdgeInsets = UIEdgeInsetsMake(12, -8, 12, 38);
        leftNaviBtn.titleLabel.font=[UIFont systemFontOfSize:18];
        [leftNaviBtn.titleLabel setTextAlignment:NSTextAlignmentLeft];
        leftNaviBtn.backgroundColor=[UIColor clearColor];
        [leftNaviBtn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
     
        UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithCustomView:leftNaviBtn];
        self.navigationItem.leftBarButtonItem = rightButton;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftNaviBtn];
      // viewController.navigationItem.leftBarButtonItem.tintColor = [UIColor lightGrayColor];
    }
    [super pushViewController:viewController animated:animated];
}

- (void) pop {
    
    [self popViewControllerAnimated:YES];
}

@end
