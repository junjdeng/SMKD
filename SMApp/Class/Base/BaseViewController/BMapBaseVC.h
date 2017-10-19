//
//  BMapBaseVC.h
//  ShiShi
//
//  Created by mac_KY on 17/5/25.
//  Copyright © 2017年 fec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Location/BMKLocationComponent.h>

@interface BMapBaseVC : BaseVC
@property (nonatomic,strong)BMKMapView *mapView;
@property(nonatomic,strong)BMKLocationService *locationService;
@property (nonatomic,strong)BMKUserLocation *currentLocation;//当前的位置
@property(nonatomic,weak)UIButton *locationButton;
/** 定位到自己的位置 就会发送该sub信号 */
@property(nonatomic,strong)RACSubject *locationSubject;
@end
 
