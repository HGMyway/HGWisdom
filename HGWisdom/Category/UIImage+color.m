//
//  UIImage+color.m
//  JianShang
//
//  Created by 小雨很美 on 2016/11/17.
//  Copyright © 2016年 小雨很美. All rights reserved.
//

#import "UIImage+color.h"

@implementation UIImage (color)

+ (UIImage *)imageWithColor:(UIColor *)color andAlpha:(CGFloat)alpha
{
	return [self imageWithColor:color andAlpha:alpha andSize:CGSizeMake(1, 1)];
}
+ (UIImage *)imageWithColor:(UIColor *)color andAlpha:(CGFloat)alpha andSize:(CGSize)size
{


		//通过自己创建一个context来绘制，通常用于对图片的处理
	/*
	 解释一下UIGraphicsBeginImageContextWithOptions函数参数的含义：第一个参数表示所要创建的图片的尺寸；第二个参 数用来指定所生成图片的背景是否为不透明，如上我们使用YES而不是NO，则我们得到的图片背景将会是黑色，显然这不是我想要的；第三个参数指定生成图片 的缩放因子，这个缩放因子与UIImage的scale属性所指的含义是一致的。传入0则表示让图片的缩放因子根据屏幕的分辨率而变化，所以我们得到的图 片不管是在单分辨率还是视网膜屏上看起来都会很好。
	 */
		//该函数会自动创建一个context，并把它push到上下文栈顶，坐标系也经处理和UIKit的坐标系相同


	UIGraphicsBeginImageContextWithOptions(size, (alpha != 0), 1);
	CGContextRef context = UIGraphicsGetCurrentContext();

	//填充颜色为蓝色
	CGContextSetFillColorWithColor(context, [color CGColor]);
	CGContextSetAlpha(context, alpha);
	//在context上绘制
	 CGRect rect = CGRectMake(0, 0, size.width, size.height);
	CGContextFillRect(context, rect);

	UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();

	return theImage;

}



@end
