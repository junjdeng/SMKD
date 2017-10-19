//
//  SMNotGetVC.m
//  SMApp
//
//  Created by 家朋 on 2017/10/10.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "SMNotGetVC.h"

#import "SMNotGetCell.h"

@interface SMNotGetVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SMNotGetVC

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    self.mainTable.delegate = self;
    self.mainTable.dataSource = self;
    self.mainTable.rowHeight = 110.0f;
    
    [self.mainTable registerNib:[UINib nibWithNibName:@"SMNotGetCell" bundle:nil] forCellReuseIdentifier:[SMNotGetCell cellID]];
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SMNotGetCell *cell = [tableView dequeueReusableCellWithIdentifier:[SMNotGetCell cellID]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}




@end
