//
//  UIView+HGExtension.h
//  YonyouBanche
//
//  Created by 小雨很美 on 2017/5/4.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HGExtension)
@property (nonatomic) CGFloat hg_width;
@property (nonatomic) CGFloat hg_height;

@property (nonatomic) CGFloat hg_top;
@property (nonatomic) CGFloat hg_left;
@property (nonatomic) CGFloat hg_bottom;
@property (nonatomic) CGFloat hg_right;

- (UIViewController *)viewController;
@end
