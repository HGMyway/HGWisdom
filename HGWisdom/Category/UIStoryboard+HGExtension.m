//
//  UIStoryboard+HGExtension.m
//  YonyouBanche
//
//  Created by 小雨很美 on 2017/5/4.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import "UIStoryboard+HGExtension.h"

@implementation UIStoryboard (HGExtension)
+(UIStoryboard*)mainStoryboard
{
    return [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
}
+(UIViewController*)mainTabBarController
{
    return [[self mainStoryboard] instantiateInitialViewController];
}

+(UIStoryboard*)loginStoryboard
{
	return [UIStoryboard mainStoryboard];
//    return [UIStoryboard storyboardWithName:@"Login" bundle:[NSBundle mainBundle]];
}
+(UIViewController*)loginNavigationController
{
    return [[self loginStoryboard] instantiateViewControllerWithIdentifier:@"loginSID"];
}

@end
