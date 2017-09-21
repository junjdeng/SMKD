//
//  UITableView+Refresh.h
//  上下拉刷新gif
//
//  Created by mac on 16/7/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RefreshBlock)();

@interface UITableView (Refresh)

/**
 *  <#Description#>
 *
 *  @param isNowRefresh 是否一进入就刷新
 *  @param refreshBlock 刷新回调
 */
-(void)setHeaderIsRefresh:(BOOL)isNowRefresh Refresh:(RefreshBlock)refreshBlock;
- (void)setFootRefresh :(RefreshBlock)refreshBlock;


@end
