//
//  UIImage+color.m
//  JianShang
//
//  Created by 小雨很美 on 2016/11/17.
//  Copyright © 2016年 小雨很美. All rights reserved.
//

#import "UIImage+color.h"

@implementation UIImage (color)

//+ (UIImage *)imageWithColor:(UIColor *)color
//{
//	CGSize size = CGSizeMake(1, 1);
//    UIGraphicsBeginImageContextWithOptions(size, NO, 1);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextTranslateCTM(context, 0, size.height);
//    CGContextScaleCTM(context, 1.0, -1.0);
//    CGContextSetBlendMode(context, kCGBlendModeNormal);
//    CGRect rect = CGRectMake(0, 0, size.width, size.height);
//    CGContextClipToMask(context, rect, self.CGImage);
//    [color setFill];
//    CGContextFillRect(context, rect);
//    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//}
+ (UIImage *)imageWithColor:(UIColor *)color andAlpha:(CGFloat)alpha
{
	return [self imageWithColor:color andAlpha:alpha andSize:CGSizeMake(1, 1)];
}
+ (UIImage *)imageWithColor:(UIColor *)color andAlpha:(CGFloat)alpha andSize:(CGSize)size
{

		    UIGraphicsBeginImageContextWithOptions(size, NO, 1);
		    CGContextRef context = UIGraphicsGetCurrentContext();
		    CGContextTranslateCTM(context, 0, size.height);
		    CGContextScaleCTM(context, 1.0, -1.0);
		    CGContextSetBlendMode(context, kCGBlendModeNormal);
		    CGRect rect = CGRectMake(0, 0, size.width, size.height);
	CGImageRef mask = CGBitmapContextCreateImage(context);

		    CGContextClipToMask(context, rect, mask);
		    [color setFill];
		    CGContextFillRect(context, rect);
		    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
		    UIGraphicsEndImageContext();
		    return newImage;

//
//	UIImage *img = nil;
//
//	CGRect rect = CGRectMake(0, 0, size.width, size.height);
//	UIGraphicsBeginImageContext(rect.size);
//	CGContextRef context = UIGraphicsGetCurrentContext();
//	CGContextSetFillColorWithColor(context,
//								   color.CGColor);
//	CGContextFillRect(context, rect);
//
//	img = UIGraphicsGetImageFromCurrentImageContext();
//
//	UIGraphicsEndImageContext();
//
//	return img;
}

@end
