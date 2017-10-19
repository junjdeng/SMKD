//
//  SendAddress.m
//  SMApp
//
//  Created by 家朋 on 2017/9/17.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "SendAddress.h"
#import "SendAddressCell.h"
@interface SendAddress ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SendAddress

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mainTable];
    [self.mainTable sd_clearAutoLayoutSettings];
    [self.view addSubview:self.mainTable];
    self.mainTable.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 60, 0));
    self.mainTable.delegate = self;
    self.mainTable.dataSource = self;
    //cell
    [self.mainTable registerNib:[UINib nibWithNibName:@"SendAddressCell" bundle:nil] forCellReuseIdentifier:[SendAddressCell cellID]];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.KYCornerRediu(4);
    addBtn.backgroundColor = [UIColor redColor];
    [addBtn setTitle:@"新建地址" forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"add_icon"] forState:UIControlStateNormal];
   
    [self.view addSubview:addBtn];
    addBtn.sd_layout
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .bottomSpaceToView(self.view, 10)
    .heightIs(40);
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SendAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:[SendAddressCell cellID]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
#pragma mark - UITableViewDelegate


@end
