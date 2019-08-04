//
//  UIViewController+HGHiddenBottem.m
//  HGTest
//
//  Created by 小雨很美 on 2018/8/8.
//  Copyright © 2018年 小雨很美. All rights reserved.
//

#import "UIViewController+HGHiddenBottem.h"
#import "NSObject+HGMethod.h"
@implementation UIViewController (HGHiddenBottem)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self hg_swizzlInstanseMethod:@selector(hidesBottomBarWhenPushed) swizzledSelector:@selector(hg_hiddenBottem_hidesBottomBarWhenPushed)];
    });
}
- (BOOL)hg_hiddenBottem_hidesBottomBarWhenPushed{
    return self.navigationController.viewControllers.count > 1;
}

@end
