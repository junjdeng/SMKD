//
//  BMapBaseVC.m
//  ShiShi
//
//  Created by mac_KY on 17/5/25.
//  Copyright © 2017年 fec. All rights reserved.
//

#import "BMapBaseVC.h"



@interface BMapBaseVC ()<BMKMapViewDelegate,BMKLocationServiceDelegate>


@end

@implementation BMapBaseVC

/*懒加载*/
-(BMKLocationService *)locationService
{
    if (!_locationService) {
        //初始化数据
        _locationService = [[BMKLocationService alloc]init];
        _locationService.distanceFilter = kCLLocationAccuracyNearestTenMeters;
        _locationService.delegate = self;
    }
    return _locationService;
}
/*懒加载*/
-(BMKMapView *)mapView
{
    if (!_mapView) {
        //初始化数据
        _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64)];
    }
    return _mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
   
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locationService.delegate = self;
         //[self.view addSubview:self.mapView];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locationService.delegate = nil;
   // [self.mapView removeFromSuperview];
    
}

/// 初始化视图
- (void)setup
{
    self.mapView.delegate = self;
    self.mapView.mapType = BMKMapTypeStandard;
    self.mapView.zoomLevel = 20;
    self.mapView.showsUserLocation = NO;
    self.mapView.userTrackingMode = BMKUserTrackingModeFollow;//BMKUserTrackingModeFollow
    self.mapView.showsUserLocation = YES;
    BMKLocationViewDisplayParam *param = [[BMKLocationViewDisplayParam alloc]init];
    param.isAccuracyCircleShow = YES;
    param.accuracyCircleStrokeColor = [UIColor clearColor];
    param.isRotateAngleValid = YES;
    param.locationViewImgName = @"icon_center_point";
    [self.mapView updateLocationViewWithParam:param];
    [self.view addSubview:_mapView];
    [self.locationService startUserLocationService];
    
    
    _locationSubject = [[RACSubject alloc] init];
    [self loadMakeLocationBtn];
}



-(void)loadMakeLocationBtn{
    CGFloat btnW = 35;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(12, kScreenHeight - 80 - btnW, btnW, btnW)];
    [self.view addSubview:btn];
    [btn setBackgroundColor:RGBA(255, 255, 255, 0.8)];
    [btn setConnerRediu:5];
    //[btn setBorderByColor:RGBA(230, 230, 230, 0.8) width:0.5];
    [btn setImage:[UIImage imageNamed:@"dingwei-1"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickToLocation) forControlEvents:UIControlEventTouchUpInside];
    
    self.locationButton = btn;
    
}

#pragma mark - Click

-(void)clickToLocation{
    if (_currentLocation == nil) {
        return;
    }
    [self.mapView setCenterCoordinate:_currentLocation.location.coordinate animated:YES];
    
}




- (void)mapViewDidFinishLoading:(BMKMapView *)mapView
{
    
}

#pragma mark - BMKLocationServiceDelegate

/**用户方向更新后，会调用此函数*/
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    _currentLocation = userLocation;
    [self.mapView updateLocationData:userLocation];
}

/**用户位置更新后，会调用此函数*/
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    if (_currentLocation == nil) {
        [_locationSubject sendNext:userLocation];
    }
    _currentLocation = userLocation;
    [self.mapView updateLocationData:userLocation];
  
}

- (void)dealloc
{
    
    if (_mapView) {
        _mapView.delegate = nil;
        [_mapView removeFromSuperview];
        _mapView = nil;
    }
    if (_locationService) {
        _locationService.delegate = nil;
        _locationService = nil;
    }
}


@end
