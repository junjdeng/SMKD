//
//  SDPhotoGroup.h
//  SDPhotoBrowser
//
//  Created by aier on 15-2-4.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDPhotoBrowser.h"

@interface SDPhotoGroup : UIView 

@property (nonatomic, strong) NSArray *photoItemArray;
@property (nonatomic, assign) NSInteger groupViewHeight;

@property (nonatomic, assign) SubscriptType subscriptType;//下标类型 (位置和类型)
@property (nonatomic, assign) BOOL isHaveSaveBtn;//是否有保存按钮


@end
