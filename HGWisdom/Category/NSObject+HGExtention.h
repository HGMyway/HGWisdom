//
//  NSObject+HGExtention.h
//  UICollectionViewDemo
//
//  Created by 小雨很美 on 2017/4/9.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSObject (HGExtention)
- (id)hgperformSelector:(SEL)selector withObjects:(NSArray *)objects ;


-(UIViewController *)hg_viewController;
+ (UIViewController *)hg_viewController;
@end
