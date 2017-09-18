//
//  UINavigationController+HGExtention.m
//  BabysCard_OC
//
//  Created by 小雨很美 on 2017/6/18.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import "UINavigationController+HGExtention.h"
#import "UIImage+color.h"
@implementation UINavigationController (HGExtention)
#pragma mark - 导航条样式
- (void)resetNavigationbar
{
    [self.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = nil;
}
- (void)setNavigationbarBackgroundColorClear
{

    self.navigationBar.translucent = YES;


    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] andAlpha:1]  forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new]; // 去掉导航条下边的横线
}
- (void)setNavigationbarBackgroundColor:(UIColor *)color alpha:(CGFloat)alpha
{
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:color andAlpha:alpha]  forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new]; // 去掉导航条下边的横线
}
@end
