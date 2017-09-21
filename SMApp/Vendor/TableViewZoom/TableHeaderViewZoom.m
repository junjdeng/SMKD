//
//  TableHeaderViewZoom.m
//  HeaderViewZoom
//
//  Created by 杨帅 on 16/4/18.
//  Copyright © 2016年 杨帅. All rights reserved.
//

#import "TableHeaderViewZoom.h"

@implementation TableHeaderViewZoom

@synthesize tableView = _tableView;
@synthesize view = _view;

-(void)TableHeaderViewZoom:(UITableView *)tableView WithView:(UIView *)view AndViewHeight:(CGFloat)viewHeight{

    _tableView = tableView;
    _view = view;
    _viewHeight = viewHeight;
    //利用内嵌添加头部视图
    self.view.frame = CGRectMake(0, -_viewHeight, [UIScreen mainScreen].bounds.size.width, _viewHeight);
    //添加到TableView之上
    [self.tableView addSubview:self.view];
    //放到图层的最后
    [self.tableView sendSubviewToBack:self.view];
    //修改内嵌值
    self.tableView.contentInset = UIEdgeInsetsMake(_viewHeight, 0, 0, 0);
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    if (scrollView.contentOffset.y < -_viewHeight) {
        //往上移动10个单位
        //position 相当于UIView的center
        self.view.layer.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0,  scrollView.contentOffset.y / 2.0);
        
        //设置一个放大系数：（fabs是取绝对值）
        CGFloat scale = fabs(scrollView.contentOffset.y) / _viewHeight;
        
        //触发放大缩小
        self.view.transform = CGAffineTransformMakeScale(scale, scale);
    }else{
    
    }
}

@end
