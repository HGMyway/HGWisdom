//
//  UIButton+HGPosition.h
//  WoseekShipper
//
//  Created by 小雨很美 on 2018/5/31.
//  Copyright © 2018年 小雨很美. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,HGButtonImagePosition){
    HGButtonImagePositionNormal = 0,
    HGButtonImagePositionTop,
    HGButtonImagePositionRight,
    HGButtonImagePositionBottom,
};

@interface UIButton (HGPosition)
#if TARGET_INTERFACE_BUILDER
@property (nonatomic) IBInspectable NSInteger hg_imagePosition;
#else
@property (nonatomic)  HGButtonImagePosition hg_imagePosition;
#endif


@end


//IB_DESIGNABLE
//@interface UIHGIBButton : UIButton
//@end
