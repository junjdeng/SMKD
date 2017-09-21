//
//  BaseTableVC.h
//  SMApp
//
//  Created by 家朋 on 2017/9/17.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "BaseVC.h"

@interface BaseTableVC : BaseVC

@property(nonatomic,strong)UITableView *mainTable;

@property(nonatomic,strong)NSMutableArray *dataSource;


@end
