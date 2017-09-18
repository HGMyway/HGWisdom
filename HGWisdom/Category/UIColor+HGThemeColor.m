//
//  UIColor+HGThemeColor.m
//  BabysCard_OC
//
//  Created by 小雨很美 on 2017/6/10.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import "UIColor+HGThemeColor.h"

@implementation UIColor (HGThemeColor)
+ (UIColor *)colorWithHexString:(NSString *)colorStr{
    return  [self colorWithHexString:colorStr andAlpha:1.0];
}
+ (UIColor *)colorWithHexString:(NSString *)colorStr andAlpha:(CGFloat)alpha{
    NSString *cString = [[colorStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] uppercaseString];

    if ([cString length] < 6) {
        return [UIColor clearColor];
    }

    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return  [UIColor clearColor];
    }

    NSRange range = NSMakeRange(0, 2);

    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location += range.length;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location += range.length;
    NSString *bString = [cString substringWithRange:range];

    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((CGFloat) r / 255.0f) green:((CGFloat) g / 255.0f) blue:((CGFloat) b / 255.0f) alpha:alpha];

    return nil;
}
+ (UIColor *)globleTint{
    return [self colorWithHexString:@"ff66ff"];
}

@end
