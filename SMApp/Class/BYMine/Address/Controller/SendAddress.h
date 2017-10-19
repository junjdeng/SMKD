//
//  SendAddress.h
//  SMApp
//
//  Created by 家朋 on 2017/9/17.
//  Copyright © 2017年 家朋. All rights reserved.
//

#import "BaseVC.h"

typedef NS_ENUM(NSInteger,SendAddressType) {
    
    SendAddressTypeSend = 0,
    //寄件
    SendAddressTypeCondignee,
    
};
@interface SendAddress : BaseTableVC

@property(nonatomic,assign)SendAddressType type;

@end
