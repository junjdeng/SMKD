//
//  UICollectionView+Refresh.m
//  上下拉刷新gif
//
//  Created by mac on 16/7/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UICollectionView+Refresh.h"
#import "MJChiBaoZiHeader.h"
#import "MJChiBaoZiFooter.h"

@implementation UICollectionView (Refresh)

-(void)setHeaderIsRefresh:(BOOL)isNowRefresh Refresh:(CRefreshBlock)refreshBlock{
    
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingBlock:^{
        
        refreshBlock();
    }];
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
    header.stateLabel.hidden = YES;
    // 马上进入刷新状态
    if (isNowRefresh) {
        [header beginRefreshing];
    }
    
    // 设置header
    self.mj_header = header;
    
}

- (void)setFootRefresh :(CRefreshBlock)refreshBlock
{
    
    MJChiBaoZiFooter *footer = [MJChiBaoZiFooter footerWithRefreshingBlock:^{
        
        refreshBlock();
    }];
    
    // 当上拉刷新控件出现50%时（出现一半），就会自动刷新。这个值默认是1.0（也就是上拉刷新100%出现时，才会自动刷新）
//       footer.triggerAutomaticallyRefreshPercent = 0.5;
    
    // 隐藏刷新状态的文字
    footer.refreshingTitleHidden = YES;
    footer.stateLabel.hidden = YES;
    // 设置footer
    self.mj_footer = footer;
}



@end
