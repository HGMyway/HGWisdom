//
//  UIView+HGExtension.m
//  YonyouBanche
//
//  Created by 小雨很美 on 2017/5/4.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import "UIView+HGExtension.h"

@implementation UIView (HGExtension)
- (CGFloat)hg_width
{
    return CGRectGetWidth(self.frame);
}

- (void)setHg_width:(CGFloat)hg_width
{
    self.frame = CGRectMake(self.hg_left, self.hg_top, hg_width, self.hg_height);
}

- (CGFloat)hg_height
{
    return CGRectGetHeight(self.frame);
}

- (void)setHg_height:(CGFloat)hg_height
{
    self.frame = CGRectMake(self.hg_left, self.hg_top, self.hg_width, hg_height);
}

- (CGFloat)hg_top
{
    return CGRectGetMinY(self.frame);
}

- (void)setHg_top:(CGFloat)hg_top
{
    self.frame = CGRectMake(self.hg_left, hg_top, self.hg_width, self.hg_height);
}

- (CGFloat)hg_bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setHg_bottom:(CGFloat)hg_bottom
{
    self.hg_top = hg_bottom - self.hg_height;
}

- (CGFloat)hg_left
{
    return CGRectGetMinX(self.frame);
}

- (void)setHg_left:(CGFloat)hg_left
{
    self.frame = CGRectMake(hg_left, self.hg_top, self.hg_width, self.hg_height);
}

- (CGFloat)hg_right
{
    return CGRectGetMaxX(self.frame);
}

- (void)setHg_right:(CGFloat)hg_right
{
    self.hg_left = self.hg_right - self.hg_width;
}

- (UIViewController *)viewController
{
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}
@end
