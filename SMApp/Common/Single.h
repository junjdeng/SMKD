//
//  Single.h
//  BaoQianLi
//
//  Created by fec on 16/8/30.
//  Copyright © 2016年 杨帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Single : NSObject

+ (instancetype) sharedManager;

@property (nonatomic,copy) NSString *mid;
@property (nonatomic,copy) NSString *site;//判断是否重新网络请求地址,0需要 1不需要


@property (nonatomic, strong) NSMutableArray *selectSkuArr;


@end
