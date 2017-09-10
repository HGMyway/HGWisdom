//
//  NSObject+HGExtention.m
//  UICollectionViewDemo
//
//  Created by 小雨很美 on 2017/4/9.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import "NSObject+HGExtention.h"

@implementation UIView (HGExtension)
- (UIViewController *)hgviewController
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

@implementation NSObject (HGExtention)
- (id)hgperformSelector:(SEL)selector withObjects:(NSArray *)objects {
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    
    if (signature) {
        NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:selector];
        for(int i = 0;i < [objects count];i++) {
            id object = [objects objectAtIndex:i];
            [invocation setArgument:&object atIndex:(i+2)];
        }
        [invocation invoke];
        if (signature.methodReturnLength) {
            id anObject;
            [invocation getReturnValue:&anObject];
            return anObject;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}


-(UIViewController *)hg_viewController
{
    return [[self class] hg_viewController];
}
+ (UIViewController *)hg_viewController
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    // modal展现方式的底层视图不同
    // 取到第一层时，取到的是UITransitionView，通过这个view拿不到控制器
    UIView *firstView = [keyWindow.subviews firstObject];
    UIView *secondView = [firstView.subviews firstObject];
    UIViewController *vc= [secondView hgviewController ];
    if ([vc isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tab = (UITabBarController *)vc;
        if ([tab.selectedViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)tab.selectedViewController;
            return [nav.viewControllers lastObject];
        } else {
            return tab.selectedViewController;
        }
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)vc;
        return [nav.viewControllers lastObject];
    } else {
        return vc;
    }
    return nil;
}


@end


