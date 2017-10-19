//
//  CJTab.m
//  超简非侧滑
//
//  Created by lukyshine on 16/2/12.
//  Copyright © 2016年 cjapp.com.cn. All rights reserved.
//

#import "BaseTabBarController.h"

#import "TabBarButton.h"


#import "BaseNavigationController.h"



#define selectIndex  @"selectedIndex"
//是否是第一次启动
#define isFristLan @"isFristLan"
#define tabbarHeight 49

#define CJTItileArr @[@"首页",@"网点",@"推荐",@"发现",@"我的"];
#define CJTabBarBottom_imageArr  @[@"shouye.png",@"fj_mai",@"",@"tj",@"wode.png"];

#define CJTabBarBottom_selectImageArr  @[@"zhuye.png",@"fj_x.png",@"",@"tj_x.png",@"wode.png"];
//按钮颜色
//#define navigateColor [UIColor colorWithRed:236/255.0 green:89/255.0 blue:14/255.0 alpha:1.0]
//#define navigateColor [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0]
//#define navigateColor [UIColor colorWithRed:236/255.0 green:89/255.0 blue:14/255.0 alpha:1.0]



#define  NUM 5
@interface BaseTabBarController ()<UINavigationControllerDelegate>
@property(nonatomic,strong)UIView*customTabbarView;

@end

@implementation BaseTabBarController
{
    NSArray *viewControllers;
    NSArray *titles;
    int  num;
    TabBarButton*selectedBtn;
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   viewControllers = @[@"HomeVC",@"NetPointVC",@"Recommend",@"FindVC",@"MineVC"];
    
    self.tabBar.backgroundColor = [UIColor clearColor];
    
    [self initCustomTabbar];
    
    
    [self initAllViewController];
    //第一次需要登陆 以后保存本地除非主动推出登陆 不然以后可以不用登陆的
    
}
- (void)hideTabbar
{
    [UIView animateWithDuration:0.01 animations:^{
        CGRect rect = _customTabbarView.frame;
        rect.origin.y = self.view.frame.size.height;
        _customTabbarView.frame = rect;
    }];
    //    self.view.hidden = YES;
    _customTabbarView.hidden = YES;
}

//显示自定义的tabbar
- (void)showTabbar
{
    self.tabBar.hidden = YES;
    [UIView animateWithDuration:0.01 animations:^{
        CGRect rect = _customTabbarView.frame;
        rect.origin.y = self.view.frame.size.height - tabbarHeight;
        _customTabbarView.frame = rect;
    }];
    
    _customTabbarView.hidden = NO;
}




//判断是否是第一次启动
-(void)initFristLan
{
    NSString *fristud =[[NSUserDefaults standardUserDefaults ] objectForKey: isFristLan];
    if (fristud == nil)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"tablock" forKey:isFristLan];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}

-(void)initAllViewController {
    
    NSMutableArray *naviControllers = [NSMutableArray arrayWithCapacity:viewControllers.count];
    for (int i = 0; i <viewControllers.count; i ++)
    {
        UIViewController *VC = [NSClassFromString(viewControllers[i]) new];
        [VC  setTitle:titles[i]];
        BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:VC];
        nav.delegate = self;
        [naviControllers addObject:nav];
    }
    self.viewControllers = naviControllers;
    
    //加载上次的默认状态
    self.selectedIndex = [[NSUserDefaults standardUserDefaults] integerForKey:selectIndex];
    self.tabBar.hidden = YES;

}



-(void)initCustomTabbar
{
    //初始化tabbar
    _customTabbarView =[[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight-tabbarHeight, kScreenWidth,tabbarHeight)];
    
    //tabbar底部的背景图
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"btm_bg"]];
    imageView.frame =CGRectMake(0, 0, kScreenWidth,tabbarHeight);
    imageView.backgroundColor =[UIColor whiteColor];
    [_customTabbarView addSubview:imageView];
    [self.view addSubview:_customTabbarView];
    titles  = CJTItileArr;
    NSArray *normalImages = CJTabBarBottom_imageArr;
    NSArray *selectedImages = CJTabBarBottom_selectImageArr;
    
    //初始化tabbar按钮
    for (int i = 0; i <NUM; i++)
    {
        
        TabBarButton *button =[ TabBarButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(kScreenWidth/NUM*i, 0, kScreenWidth/NUM, 49);
        button.tag =i+10;
  
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.contentMode = UIViewContentModeScaleAspectFit;
        [button setImage:[UIImage imageNamed:normalImages[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selectedImages[i]] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(selectViewController:) forControlEvents:UIControlEventTouchUpInside];
        
        //加载上次状态
        NSInteger it = [[NSUserDefaults standardUserDefaults] integerForKey:selectIndex];
        if(it) {
            if (i == [[NSUserDefaults standardUserDefaults] integerForKey:selectIndex])
            {
                button.selected = YES;
                button.backgroundColor = [UIColor whiteColor];
                
            }
        }else {
            
            if (i == 0)
            {
                button.selected = YES;
                selectedBtn = button;
                button.backgroundColor = [UIColor clearColor];
            }
            
        }
        [_customTabbarView addSubview:button];
    }
    
    //需要一条灰色的底线比较漂亮吧
    UIView*line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    line.backgroundColor = COLOR(240, 240, 240,1);
    [_customTabbarView addSubview:line];
      
    UIImageView *imageV = [[UIImageView alloc]init];
    imageV.image = [UIImage imageNamed:@"tab_tuijian.png"];
    [_customTabbarView addSubview:imageV];
         imageV.sd_layout.topSpaceToView(_customTabbarView, -20)
         .centerXEqualToView(_customTabbarView)
         .widthIs(50).heightIs(50);

}

-(void)selectViewController:( TabBarButton*)sender
{
    //把所有的按钮selected = NO;
    selectedBtn.selected = NO;
    sender.selected      = YES;
    selectedBtn          = sender;
    sender.backgroundColor = [UIColor whiteColor];
    self.selectedIndex   = sender.tag -10;
    
    //强制保存选中下标
    [[NSUserDefaults standardUserDefaults]setInteger:0 forKey:selectIndex];
    [[NSUserDefaults standardUserDefaults ] synchronize];
    
}

#pragma mark - UINavigationController Delegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (navigationController.viewControllers.count == 2)
    {
        [self showTabBarItem:NO];
    }
    else if (navigationController.viewControllers.count ==1)
    {
        [self showTabBarItem:YES];
        
    }
}

- (void)showTabBarItem:(BOOL)show
{
    
    [UIView animateWithDuration:.2 animations:^{
        if (show)
        {
            [self showTabbar];
        }
        else
        {
            [self hideTabbar];
        }
        
    }];
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.selectedViewController beginAppearanceTransition: YES animated: animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self.selectedViewController endAppearanceTransition];
}

#pragma mark-   made
-(void) viewWillDisappear:(BOOL)animated
{
    
    
    [super viewWillDisappear:YES];
    [self.selectedViewController beginAppearanceTransition: NO animated: animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    [self.selectedViewController endAppearanceTransition];
}


@end
