//
//  UIImage+color.h
//  JianShang
//
//  Created by 小雨很美 on 2016/11/17.
//  Copyright © 2016年 小雨很美. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (color)
+ (UIImage *)imageWithColor:(UIColor *)color andAlpha:(CGFloat)alpha;
+ (UIImage *)imageWithColor:(UIColor *)color andAlpha:(CGFloat)alpha andSize:(CGSize)size;
@end
