//
//  SDPhotoBrowser.h
//  photobrowser
//
//  Created by aier on 15-2-3.
//  Copyright (c) 2015年 aier. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    SubscriptTypeUpPoint = 0,//上 点
    SubscriptTypeUpNumber,//上 数字
    SubscriptTypeDownPoint,//下 点
    SubscriptTypeDownNumber//下 数字
}SubscriptType;//下标类型


@class SDButton, SDPhotoBrowser;

@protocol SDPhotoBrowserDelegate <NSObject>

@required

- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index;

@optional

- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index;

@end


@interface SDPhotoBrowser : UIView <UIScrollViewDelegate>

@property (nonatomic, weak) UIView *sourceImagesContainerView;
@property (nonatomic, assign) NSInteger currentImageIndex;
@property (nonatomic, assign) NSInteger imageCount;

@property (nonatomic, weak) id<SDPhotoBrowserDelegate> delegate;

@property (nonatomic, assign) SubscriptType subscriptType;//下标类型 (位置和类型)
@property (nonatomic, assign) BOOL isHaveSaveBtn;//是否有保存按钮



- (void)show;


@end



