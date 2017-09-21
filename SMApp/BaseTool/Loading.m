//
//  Loading.m
//  QinzBaseProject
//


#import "Loading.h"

@implementation Loading

+ (MBProgressHUD *)showLoadingHud{
    UIWindow *lastWindow = [[UIApplication sharedApplication].windows lastObject];
    UIImage  *image=[UIImage imageNamed:@"pika"];
    UIImageView  *gifview=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,120,120)];
    gifview.image = image;
    MBProgressHUD *_hud = [MBProgressHUD showHUDAddedTo:lastWindow animated:YES];
    _hud.backgroundColor = [UIColor clearColor];
    _hud.mode = MBProgressHUDModeCustomView;
    _hud.frame = CGRectMake(0, 0, 120, 120);
    _hud.center = lastWindow.center;
    //    hud.labelText = @"Qinz正在为您加载";
    //    hud.labelFont = [UIFont systemFontOfSize:13];
    gifview.center =  _hud.center;
  
    _hud.customView=gifview;
    return _hud;
}

@end
