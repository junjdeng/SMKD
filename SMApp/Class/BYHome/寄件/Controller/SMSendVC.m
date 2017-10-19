//
//  SMSendVC.m
//  SMApp
//
//  Created by 家朋 on 2017/10/10.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "SMSendVC.h"


#import "SMNotGetVC.h"
#import "SMHadGetVC.h"
#import "SMSendCancnleVC.h"

#import "FlipTableView.h"
#import "SegmentTapView.h"


@interface SMSendVC ()<SegmentTapViewDelegate,FlipTableViewDelegate>

@property(nonatomic,weak )FlipTableView *flipTabView;
@property(nonatomic,weak)SegmentTapView *segemtView;
@end

@implementation SMSendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self laodNav];
}
-(void)laodNav{
    self.title = @"寄件";


    NSArray *controls = @[[[SMNotGetVC alloc]init],[[SMHadGetVC alloc]init],[[SMSendCancnleVC alloc]init]];
    FlipTableView *flipTabView  = [[FlipTableView alloc]initWithFrame:CGRectMake(0, 40, kScreenWidth, kScreenHeight - 40 - 64) withArray:controls];
    flipTabView.delegate = self;
    [self.view addSubview:flipTabView];
   self.flipTabView = flipTabView;
//
//
//
    SegmentTapView *segemtView = [[SegmentTapView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40) withDataArray:[NSArray arrayWithObjects:@"未收",@"已收",@"取消", nil] withFont:14];
    segemtView.textNomalColor = [UIColor blackColor];
    segemtView.textSelectedColor = [UIColor redColor];
    segemtView.lineColor = [UIColor redColor];
    segemtView.delegate = self;

    [self.view addSubview:segemtView];
    self.segemtView = segemtView;

}


#pragma mark - SegmentTapViewDelegate && FlipTableViewDelegate
-(void)selectedIndex:(NSInteger)index
{
    [self.flipTabView selectIndex:index];
}
-(void)scrollChangeToIndex:(NSInteger)index{
    
   [self.segemtView selectIndex:index];
}



@end

