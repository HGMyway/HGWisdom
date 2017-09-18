//
//  UIColor+HGThemeColor.h
//  BabysCard_OC
//
//  Created by 小雨很美 on 2017/6/10.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HGThemeColor)

+ (UIColor*)colorWithHexString:(NSString*)colorStr;
+ (UIColor*)colorWithHexString:(NSString*)colorStr andAlpha:(CGFloat)alpha;
/**
主题Tint
 @return color
 */
+ (UIColor*)globleTint;
@end
