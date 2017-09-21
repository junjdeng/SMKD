//
//  BaseTableVC.m
//  SMApp
//
//  Created by 家朋 on 2017/9/17.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "BaseTableVC.h"

@interface BaseTableVC ()

@end

@implementation BaseTableVC


/// 懒加载
-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

/// 懒加载
-(UITableView *)mainTable
{
    if (!_mainTable) {
        _mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _mainTable.backgroundColor = GlobalBackColor;
        [self.view addSubview:self.mainTable];
        _mainTable.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
        _mainTable.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _mainTable.tableFooterView = [UIView new];
    }
    return _mainTable;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}






@end
