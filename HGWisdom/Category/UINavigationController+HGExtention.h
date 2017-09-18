//
//  UINavigationController+HGExtention.h
//  BabysCard_OC
//
//  Created by 小雨很美 on 2017/6/18.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (HGExtention)
#pragma mark - 导航条样式
- (void)resetNavigationbar;
- (void)setNavigationbarBackgroundColorClear;
- (void)setNavigationbarBackgroundColor:(UIColor *)color alpha:(CGFloat)alpha;
@end
