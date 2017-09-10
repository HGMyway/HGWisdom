//
//  UIScrollView+ContentOffSet.m
//  JianShang
//
//  Created by 小雨很美 on 2016/11/12.
//  Copyright © 2016年 小雨很美. All rights reserved.
//

#import "UIScrollView+ContentOffSet.h"

@implementation UIScrollView (ContentOffSet)
-(NSInteger)horizontalIndexOfScrollPage
{
    return self.contentOffset.x/CGRectGetWidth(self.bounds);
}
-(NSInteger)verticalIndexOfScrollPage
{
    return self.contentOffset.y/CGRectGetHeight(self.bounds);
}
@end
