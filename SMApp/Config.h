//
//  PrefixHeader.pch
//  HelpTour
//
//  Created by 家朋 on 2017/9/13.
//  Copyright © 2017年 家朋. All rights reserved.
//

#ifndef Config_h
#define Config_h

/** 设置颜色 用法#eb6000 传UIColorFromRGB(0xeb6000) */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
/** 设置颜色 */
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A/1.0]

#define RandomColor    wh_RGB(arc4randow_uniform(256)/255.0,arc4randow_uniform(256)/255.0,arc4randow_uniform(256)/255.0)

/** app版本号 */
#define AppVersion           [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
/** 系统版本号 */
#define kSystemVersion       [[UIDevice currentDevice] systemVersion]
/** 国际化 */
#define LocalMyString(key) NSLocalizedStringFromTable(key,@"Localizable", key)
/** 弱引用 */
#define WS(b_self)  __weak __typeof(&*self)b_self = self;
/** 获取图像 */
#define LOADIMAGE(file) [UIImage imageNamed:file]
/** 屏幕尺寸 */
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width


/** 由角度转换弧度/由弧度转换角度 */
#define BY_degreesToRadian(x)       (M_PI * (x) / 180.0)
#define BY_radianToDegrees(radian)  (radian * 180.0) / (M_PI)

/** 存储对象 */
#define BY_UserDefaultSetObjectForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setObject:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}
/** 获取存储对象 */
#define BY_UserDefaultGetObjectForKey(__KEY__)  [[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]
/** 删除对象 */
#define BY_UserDefaultRemoveObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}


#define KUserDefaults_Mid @"mid" //本地偏好设置字典的数据的key值,保存mid
#define KUserDefaults_Site @"site" //本地偏好设置字典的数据的key值,判断1已经保存地址,不需要重新请求,0未保存地址,需要重新网络请求数据


//-------颜色-----
///  rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBA(r,g,b,a)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a] 
#define RGB(r,g,b)  RGBA(r,g,b,1.0f)

#define kMainColor [UIColor colorWithRed:24/255.0 green:176/255.0 blue:155/255.0 alpha:1/1.0]//绿色
/// 全局背景颜色
#define GlobalBackColor RGB(246, 246, 246)
//-------颜色-----



//-------刷新界面-----
#define KYPageSize @"10"




#ifdef DEBUG
#define requestServerURL @" "
#else
#define requestServerURL @" "
#endif

#ifdef DEBUG
#define LOG(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define LOG(...)
#endif



#endif /* Config_h */
