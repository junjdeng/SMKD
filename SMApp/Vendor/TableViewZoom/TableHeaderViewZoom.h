//
//  TableHeaderViewZoom.h
//  HeaderViewZoom
//
//  Created by 杨帅 on 16/4/18.
//  Copyright © 2016年 杨帅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TableHeaderViewZoom : NSObject

@property (nonatomic,retain) UITableView* tableView;
@property (nonatomic,retain) UIView* view;
@property (nonatomic, assign) CGFloat viewHeight;

/**
 *  实现下面的方法
 *
 *  @param tableView  tableView description
 *  @param view       头部视图
 *  @param viewHeight 头部视图的高度
 */
-(void)TableHeaderViewZoom:(UITableView*)tableView WithView:(UIView*)view AndViewHeight:(CGFloat)viewHeight;

- (void)scrollViewDidScroll:(UIScrollView*)scrollView;


@end
