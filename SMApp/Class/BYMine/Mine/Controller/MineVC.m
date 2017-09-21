//
//  MineVC.m
//  SMApp
//
//  Created by 家朋 on 2017/9/15.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "MineVC.h"
#import "MineModel.h"
#import "UITableViewCell+Utils.h"
#import "MineHeaderView.h"
@interface MineVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray *classArray;
@property(nonatomic,strong)NSArray *titles;
@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    [self setMainTable];
    [self setHeader];
    [self setFooter];
}

- (void)setup {
    
    MineModel *item1 = [MineModel initTitle:@"个人信息" icon:@"gr" isShowArrow:YES];
    MineModel *item2 = [MineModel initTitle:@"修改密码" icon:@"mm" isShowArrow:YES];
    MineModel *item3 = [MineModel initTitle:@"寄件地址博" icon:@"wd_ico" isShowArrow:NO];
    MineModel *item4 = [MineModel initTitle:@"收件地址博" icon:@"wd_ico" isShowArrow:NO];
    NSArray *array1 = @[item1,item2,item3,item4];
    
    MineModel *item5 = [MineModel initTitle:@"检查更新" icon:@"daishou_icon" isShowArrow:YES];
    MineModel *item6 = [MineModel initTitle:@"意见反馈" icon:@"yj" isShowArrow:YES];
    NSArray *array2 = @[item5,item6];
    
    [self.dataSource addObject:array1];
    [self.dataSource addObject:array2];
    self.title = @"会员中心";
    
    self.classArray = @[@[@"UserInfoVC",@"ChangePwdVC",@"SendAddress",@"ConsigneeVC"],@[@"",@"FeedBack"]];
    self.titles = @[@[@"个人信息", @"修改密码", @"寄件地址博", @"收件地址博"] ,@[@"检查更新" ,@"意见反馈"]];
}


#pragma mark - setUI
- (void)setMainTable {
    
    self.mainTable.delegate = self;
    self.mainTable.dataSource = self;
}

- (void)setHeader {
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 190)];
    self.mainTable.tableHeaderView = view;
    
    MineHeaderView *header = [MineHeaderView  hadLoginMineHeader];
    [view addSubview:header];
    header.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    
  
}

- (void)setFooter {
    
    UIView *footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    self.mainTable.tableFooterView = footer;
    footer.backgroundColor = GlobalBackColor;
    
    UIButton *loginUotButton = [UIButton buttonWithTitle:@"退出登录" backColor:RGB(219,172,93) cornerRediu:6];
    loginUotButton.frame = CGRectMake(20, 30, kScreenWidth - 40, 40);
    [footer addSubview:loginUotButton];
}

#pragma mark - Click




#pragma mark - UITableViewDelegate && UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
  
    return [[self.dataSource objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    static NSString* cellID = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    MineModel *model = [self.dataSource objectAtIndex:indexPath.section][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:model.icon];
    cell.textLabel.text = model.title;
    cell.textLabel.font = KYSysFont(15);
    if (model.isShowArrow) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    [cell setTheCellLeftImageSize:CGSizeMake(25, 25)];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *VC = [NSClassFromString(self.classArray[indexPath.section][indexPath.row]) new];
    
    VC.title = self.titles[indexPath.section][indexPath.row];
    [self.navigationController pushViewController:VC animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

@end
