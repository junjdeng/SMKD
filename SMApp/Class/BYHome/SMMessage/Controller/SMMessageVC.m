//
//  SMMessageVC.m
//  SMApp
//
//  Created by 家朋 on 2017/10/3.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "SMMessageVC.h"
#import "SMMessageCell.h"

@interface SMMessageVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SMMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"消息";
    
    self.mainTable.delegate = self;
    self.mainTable.dataSource = self;
    self.mainTable.rowHeight = 65;
    
    //cell
    [self.mainTable registerNib:[UINib nibWithNibName:@"SMMessageCell" bundle:nil] forCellReuseIdentifier:[SMMessageCell cellID]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SMMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:[SMMessageCell cellID] forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
