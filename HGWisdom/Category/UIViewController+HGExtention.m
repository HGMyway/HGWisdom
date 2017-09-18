//
//  UIViewController+HGExtention.m
//  BabysCard_OC
//
//  Created by 小雨很美 on 2017/6/10.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import "UIViewController+HGExtention.h"

@implementation UIViewController (HGExtention)
- (BOOL)hidesBottomBarWhenPushed{
    return self.navigationController.viewControllers.count > 1;
}

@end
