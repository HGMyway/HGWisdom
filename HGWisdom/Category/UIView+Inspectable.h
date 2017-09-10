//
//  UIView+Inspectable.h
//  JianShang
//
//  Created by 小雨很美 on 2016/11/3.
//  Copyright © 2016年 小雨很美. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIView (Inspectable)
/**
 *  可以在xib里面直接设置的:圆角
 */
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
/**
 *  可以在xib里面直接设置的:边线宽度
 */
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
/**
 *  可以在xib里面直接设置的:边线颜色
 */
@property (nonatomic, assign) IBInspectable UIColor *borderColor;
@end

//IB_DESIGNABLE
@interface UITextField (customStyle)
/**
 *  可以在xib里面直接设置的:边线颜色
 */
@property (nonatomic, assign) IBInspectable UIColor *placeholderColor;
@end
