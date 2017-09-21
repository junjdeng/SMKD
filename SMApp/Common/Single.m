//
//  Single.m
//  BaoQianLi
//
//  Created by fec on 16/8/30.
//  Copyright © 2016年 杨帅. All rights reserved.
//

#import "Single.h"

@implementation Single

static Single *instance;

+ (instancetype) sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (NSString *)mid
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:KUserDefaults_Mid];

}

- (NSString *)site
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:KUserDefaults_Site];
    
}

@end
